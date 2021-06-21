//
//  NewsModel.swift
//  NewsAppSimulator
//
//  Created by Жеребцов Данил on 20.06.2021.
//

import Foundation

import ObjectMapper


class NewsResponse: Mappable {
    var newsArray: [News]?

    required convenience init?(map: ObjectMapper.Map) {
        self.init()
    }

    func mapping(map: ObjectMapper.Map) {
      newsArray <- map["articles"]
    }
}


class News: Mappable {
  
    var title = ""
    var author = ""
    var descript = ""
    var url = ""
    var urlToImage = ""
    var date = ""
    var content = ""
    
    
    required  convenience init?(map: ObjectMapper.Map) {
        self.init()
    }
    
 
    
    func mapping(map: ObjectMapper.Map) {
        title <- map["title"]
        author <- map["author"]
        descript <- map["description"]
        url <- map["url"]
        urlToImage <- map["urlToImage"]
        date <- map["publishedAt"]
        content <- map["content"]
    }
}

