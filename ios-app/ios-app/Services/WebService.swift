//
//  WebService.swift
//  ios-app
//
//  Created by Vincent Chau on 6/25/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import Foundation

typealias CompletionObjectHandler = ((Error?, AnyObject?) -> ())?

internal func mainQueue(_ block: @escaping ()->()) {
    DispatchQueue.main.async(execute: block)
}

enum WebServiceError: Error {
    case invalidURL
    case invalidResponse
    case failedRequest
}

final class Webservice {

    fileprivate enum APIMethod: String {
        case search = "flickr.photos.search"
        static func queryItem(method: APIMethod) -> URLQueryItem {
            switch method {
            case .search:
                return URLQueryItem(name: "method", value: method.rawValue)
            }
        }
    }

    fileprivate enum AuthMethod: String {
        case apiKey = "1508443e49213ff84d566777dc211f2a"
        static func queryItem(method: AuthMethod) -> URLQueryItem {
            switch method {
            case .apiKey:
                return URLQueryItem(name: "api_key", value: method.rawValue)
            }
        }
    }

    fileprivate enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
    }

    fileprivate let baseURL = "https://api.flickr.com/services/rest"

    func loadSearchResultsServer(parameters: [String: AnyObject], completion: CompletionObjectHandler = nil) {
        var urlComponents = URLComponents(string: baseURL)
        let authQuery = AuthMethod.queryItem(method: .apiKey)
        let apiMethodQuery = APIMethod.queryItem(method: .search)
        let parameterQueries = generateParameters(dictionary: parameters)
        var queryItems = [URLQueryItem]()
        queryItems.append(apiMethodQuery)
        queryItems.append(authQuery)
        queryItems.append(contentsOf: parameterQueries)
        urlComponents?.queryItems = queryItems
        guard let url = urlComponents?.url else {
            completion?(WebServiceError.invalidURL, nil)
            return
        }
        var urlRequest = URLRequest(url: url)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            mainQueue {
                if let error = error {
                    completion?(error, nil)
                } else if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        if let dictionary = json as? [String: Any] {
                            print("[DEBUG]: dictionary \(dictionary)")
                        }
                        completion?(nil, nil)
                    } catch {
                        // Handler Error
                        completion?(error, nil)
                    }
                }
            }
        }
        task.resume()
    }

    fileprivate func generateParameters(dictionary: [String: AnyObject]) -> [URLQueryItem] {
        var queryItems = [URLQueryItem]()
        for (key, value) in dictionary {
            if let value = value as? String {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        return queryItems
    }

}

