//
//  PostsListRouter.swift
//  MVPExample
//
//  Created by Fernando Ortiz on 10/23/16.
//  Copyright © 2016 Fernando Martín Ortiz. All rights reserved.
//

import UIKit

final class PostsListRouter {
    var presenter: PostsListPresenter?
    var viewController: PostsListViewController?
    
    func build() -> UIViewController {
        self.presenter = PostsListPresenter()
        self.viewController = PostsListViewController(presenter: presenter!, router: self)
        self.presenter!.delegate = self.viewController!
        return viewController!
    }
}
