//
//  PostsListPresenterDelegate.swift
//  MVPExample
//
//  Created by Fernando Ortiz on 10/23/16.
//  Copyright © 2016 Fernando Martín Ortiz. All rights reserved.
//

import Foundation

protocol PostsListPresenterDelegate: class {
    func didLoadedPosts(posts: [PostViewEntity])
    func displayError(error: String)
}
