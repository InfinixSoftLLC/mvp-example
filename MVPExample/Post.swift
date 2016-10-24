//
//  Post.swift
//  MVPExample
//
//  Created by Fernando Ortiz on 10/23/16.
//  Copyright © 2016 Fernando Martín Ortiz. All rights reserved.
//

import Foundation

final class Post {
    var userID: Int
    var id: Int?
    var title: String?
    var body: String?
    
    init?(json: [String: Any]) {
        // Required fields
        guard   let userID = json["userId"] as? Int,
                let id = json["id"] as? Int else {
            return nil
        }
        self.userID = userID
        self.id = id
        
        // Optional fields
        title = json["title"]       as? String
        body = json["body"]         as? String

    }
}

