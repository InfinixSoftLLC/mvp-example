//
//  PostsListViewController.swift
//  MVPExample
//
//  Created by Fernando Ortiz on 10/23/16.
//  Copyright © 2016 Fernando Martín Ortiz. All rights reserved.
//

import UIKit

class PostsListViewController: UIViewController {
    
    // MARK: - Views -
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Attributes -
    fileprivate var posts = [PostViewEntity]()
    
    let presenter: PostsListPresenterType
    let router: PostsListRouter

    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.presenter.getPosts()
    }
    
    // MARK: - Init -
    init(presenter: PostsListPresenterType, router: PostsListRouter) {
        self.presenter = presenter
        self.router = router
        super.init(nibName: "PostsListViewController", bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private configuration -
    
}

// MARK: - PostsListPresenterDelegate -
extension PostsListViewController: PostsListPresenterDelegate {
    func displayError(error: String) {
        let alertController = UIAlertController(
            title: error,
            message: nil,
            preferredStyle: .alert
        )
        
        alertController.addAction(UIAlertAction(
            title: "Accept",
            style: .cancel,
            handler: nil
        ))
        
        present(alertController, animated: true, completion: nil)
    }

    func didLoadedPosts(posts: [PostViewEntity]) {
        self.posts = posts
        self.tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource -
extension PostsListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell") as! PostTableViewCell
        let post = self.posts[indexPath.row]
        
        cell.configure(with: post)
        
        return cell
    }
}
