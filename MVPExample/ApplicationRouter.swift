//
//  ApplicationRouter.swift
//  MVPExample
//
//  Created by Fernando Ortiz on 10/23/16.
//  Copyright © 2016 Fernando Martín Ortiz. All rights reserved.
//

import UIKit

final class ApplicationRouter {
    let keyWindow: UIWindow
    
    init(keyWindow: inout UIWindow?) {
        keyWindow = UIWindow(frame: UIScreen.main.bounds)
        self.keyWindow = keyWindow!
    }
    
    func start() {
        let router = PostsListRouter()
        let mainController = router.build()
        let navigationController = UINavigationController(
            rootViewController: mainController
        )
        keyWindow.rootViewController = navigationController
        keyWindow.makeKeyAndVisible()
    }
}
