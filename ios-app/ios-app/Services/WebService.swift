//
//  WebService.swift
//  ios-app
//
//  Created by Vincent Chau on 6/25/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import Foundation

typealias CompletionObjectHandler = ((Any) -> ())?

fileprivate let flickrAPIKey = "1508443e49213ff84d566777dc211f2a"
//flickr.photos.search&api_key=4df09ecd4fb22d6b29e03658dfbca36f&extras=media&format=json&nojsoncallback=1&api_sig=4ab2e34ace5f6084eaed02698ac8e9b5
final class Webservice {

    fileprivate var baseURL = "https://api.flickr.com/services/rest/?method="


    func loadObjects(from url: URL, completion: CompletionObjectHandler = nil) {
        
    }
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

