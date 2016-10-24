//
//  PostDetailViewController.swift
//  MVPExample
//
//  Created by Fernando Ortiz on 10/23/16.
//  Copyright © 2016 Fernando Martín Ortiz. All rights reserved.
//

import UIKit

class PostDetailViewController: UIViewController {

    // MARK: - Attributes -
    let presenter: PostDetailPresenterType
    
    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Init -
    init(presenter: PostDetailPresenterType) {
        self.presenter = presenter
        super.init(nibName: "PostDetailViewController", bundle: nil)
    }
    
}

// MARK: - PostDetailPresenterDelegate -
extension PostDetailViewController: PostDetailPresenterDelegate {
    
}
