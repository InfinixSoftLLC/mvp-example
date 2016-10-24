//
//  DataManager.swift
//  MVPExample
//
//  Created by Fernando Ortiz on 10/23/16.
//  Copyright © 2016 Fernando Martín Ortiz. All rights reserved.
//

import Foundation

final class DataManager {
    // MARK: - Singleton -
    static let instance = DataManager()
    private init(){}
}

extension DataManager {
    enum DataError: Error {
        case empty
        case wrongFormat
    }
}

// MARK: - Posts -
extension DataManager {
    func getPosts(completion: @escaping (Result<[Post]>) -> Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: URL(string: "http://jsonplaceholder.typicode.com/posts")!) {
            (data: Data?, response: URLResponse?, error: Error?) in
            
            if let error = error {
                completion(Result<[Post]>(data: nil, error: error))
                return
            }
            
            guard let data = data else {
                completion(Result<[Post]>(data: nil, error: DataError.empty))
                return
            }
            
            guard let jsonArray = (try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)) as? [[String: Any]] else {
                completion(Result<[Post]>(data: nil, error: DataError.wrongFormat))
                return
            }
            
            let posts = jsonArray
                .map { (json:[String : Any]) -> Post? in
                    return Post(json: json)
                }
                .filter { $0 != nil }
                .map { $0! }
            
            completion(Result<[Post]>(data: posts, error: nil))
        }
        
        task.resume()
    }
}
