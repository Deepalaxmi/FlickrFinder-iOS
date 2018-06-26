//
//  WebService.swift
//  ios-app
//
//  Created by Vincent Chau on 6/25/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import Foundation

fileprivate let flickrAPIKey = "1508443e49213ff84d566777dc211f2a"

class Webservice {

//    func getArticles(url :URL, callback :@escaping ([Article]) -> ()) {
//
//        var articles = [Article]()
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//
//            if let data = data {
//
//                let json = try! JSONSerialization.jsonObject(with: data, options: [])
//                let dictionary = json as! JSONDictionary
//
//                let articleDictionaries = dictionary["articles"] as! [JSONDictionary]
//
//                articles = articleDictionaries.flatMap { dictionary in
//                    return Article(dictionary :dictionary)
//                }
//            }
//
//            DispatchQueue.main.async {
//                callback(articles)
//            }
//
//            }.resume()
//    }

}

