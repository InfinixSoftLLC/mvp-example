//
//  PostDetailRouter.swift
//  MVPExample
//
//  Created by Fernando Ortiz on 10/23/16.
//  Copyright © 2016 Fernando Martín Ortiz. All rights reserved.
//

import UIKit

final class PostDetailRouter {
    var presenter: PostDetailPresenter?
    var viewController: PostDetailViewController?
    
    func build() -> UIViewController {
        self.presenter = PostDetailPresenter()
        self.viewController = PostDetailViewController(presenter: presenter!, router: self)
        self.presenter!.delegate = self.viewController!
        return viewController!
    }
}
