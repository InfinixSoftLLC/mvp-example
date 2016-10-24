//
//  PostsListRouter.swift
//  MVPExample
//
//  Created by Fernando Ortiz on 10/23/16.
//  Copyright © 2016 Fernando Martín Ortiz. All rights reserved.
//

import UIKit

final class PostsListRouter {
    let navigationController    : UINavigationController
    let presenter               : PostsListPresenterType
    
    init(navigationController: UINavigationController, presenter: PostsListPresenterType) {
        self.navigationController   = navigationController
        self.presenter              = presenter
    }
    
    func start() {
        let presenter = PostsListPresenter()
        let viewController = PostsListViewController(
            presenter: presenter,
            router: self
        )
        navigationController.pushViewController(viewController, animated: true)
    }
}
