//
//  URLRequest+Utilities.swift
//  ios-app
//
//  Created by Vincent Chau on 7/10/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import Foundation

extension URLRequest {
    func executeRequest(completion: CompletionAnyHandler = nil) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: self) { (data, response, error) in
            if let error = error {
                mainQueue { completion?(error, nil) }
            } else if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let responseDictionary = json as? [String: Any] {
                        mainQueue { completion?(nil, responseDictionary) }
                    } else if let responseDictionaryArray = json as? [[String: Any]] {
                        mainQueue { completion?(nil, responseDictionaryArray) }
                    } else {
                        mainQueue { completion?(WebServiceError.parseError, nil) }
                    }
                } catch {
                    mainQueue { completion?(error, nil) }
                }
            }
        }
        task.resume()
    }
}
