//
//  TableViewController.swift
//  NewsAppSimulator
//
//  Created by Жеребцов Данил on 21.06.2021.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import RealmSwift
import ObjectMapper
import Kingfisher

class TableViewController: UITableViewController {
    
    
    var titles: [String] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    var images: [String] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    
    let defaultUrl = "https://1.bp.blogspot.com/--b7JV7PgDPo/Xj6jliViqZI/AAAAAAAAC60/NO3XtMYWHR00NPBc-a_wxlkszqLEB07QACLcBGAsYHQ/s1600/record.jpg"
    let url = "https://newsapi.org/v2/everything?q=education&from=2021-05-21&sortBy=publishedAt&apiKey=6c574b777a1f48dbb6d1c39c17fd8038"

    override func viewDidLoad() {
        
        super.viewDidLoad()
        getData()
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return titles.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataImage = URL(string: images[indexPath.row])
        
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        cell.titleLabel.text = titles[indexPath.row]
        cell.newsImage.kf.setImage(with: dataImage)
        
        return cell
    }
    
    func getData() {
        
        AF.request(url).responseString{ response in
            switch response.result {
            
            case .success(let items):
                guard let response = NewsResponse(JSONString: "\(items)") else {return}
                for i in 0...response.newsArray!.count-1 {
                    self.titles.append(response.newsArray![i].title)
                    response.newsArray![i].urlToImage == "" ? self.images.append(self.defaultUrl) : self.images.append(response.newsArray![i].urlToImage)
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    


}
