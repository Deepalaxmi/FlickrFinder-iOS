//
//  WebService.swift
//  ios-app
//
//  Created by Vincent Chau on 6/25/18.
//  Copyright © 2018 Vincent Chau. All rights reserved.
//

import Foundation

internal typealias CompletionObjectHandler = ((Error?, AnyObject?) -> ())?
internal typealias CompletionAnyHandler = ((Error?, Any?) -> ())?

internal func mainQueue(_ block: @escaping ()->()) {
    DispatchQueue.main.async(execute: block)
}

enum WebServiceError: Error {
    case invalidURL
    case invalidResponse
    case failedRequest
    case parseError
}

final class WebService {

    // MARK: - Constants

    fileprivate let baseURL = "https://api.flickr.com/services/rest"

    // MARK: - Enumerations

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

    // MARK: - Load Methods

    public func loadSearchResultsServer(searchTerm: String, extraParameters: [String: Any]? = nil, currentPage: Int = 1, perPage: Int = 10, completion: CompletionObjectHandler = nil) {
        let parameters: [String: Any] = [
            "extras": [
                "media",
                "url_sq"
            ],
            "format": "json",
            "nojsoncallback": "true",
            "text": searchTerm,
            "per_page": String(perPage),
            "page": String(currentPage)
        ]
        var queryItems: [URLQueryItem] = [
            AuthMethod.queryItem(method: .apiKey),
            APIMethod.queryItem(method: .search)
        ]

        var parameterQueries = generateParameters(dictionary: parameters)
        if let extraParameters = extraParameters {
            parameterQueries.append(contentsOf: generateParameters(dictionary: extraParameters))
        }
        queryItems.append(contentsOf: parameterQueries)

        var urlComponents = URLComponents(string: baseURL)
        urlComponents?.queryItems = queryItems
        guard let url = urlComponents?.url else {
            completion?(WebServiceError.invalidURL, nil)
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        urlRequest.executeRequest { (error, data) in
            if let error = error {
                completion?(error, nil)
            } else if let dictionary = data as? [String: Any] {
                let searchGroup = SearchGroup(with: dictionary)
                completion?(nil, searchGroup)
            } else {
                completion?(WebServiceError.invalidResponse, nil)
            }
        }
    }

    // MARK: - Helper Methods

    fileprivate func generateParameters(dictionary: [String: Any]) -> [URLQueryItem] {
        var queryItems = [URLQueryItem]()
        for (key, value) in dictionary {
            if let value = value as? String {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            } else if let values = value as? [String] {
                for value in values {
                    let item = URLQueryItem(name: key, value: value)
                    queryItems.append(item)
                }
            }
        }
        return queryItems
    }
}
