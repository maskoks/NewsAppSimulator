//
//  CustomCell.swift
//  NewsAppSimulator
//
//  Created by Жеребцов Данил on 21.06.2021.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
