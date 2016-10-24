//
//  PostsListPresenter.swift
//  MVPExample
//
//  Created by Fernando Ortiz on 10/23/16.
//  Copyright © 2016 Fernando Martín Ortiz. All rights reserved.
//

import Foundation

final class PostsListPresenter {
    weak var delegate: PostsListPresenterDelegate?
}

extension PostsListPresenter: PostsListPresenterType {
    func getPosts() {
        DataManager.instance.getPosts { (result: Result<[Post]>) in
            if let _ = result.error {
                self.delegate?.displayError(error: "An error has ocurred while getting posts")
                return
            }
            
            if let posts = result.data {
                self.delegate?.didLoadedPosts(posts: posts.map {
                    (post: Post) -> PostViewEntity in
                    
                    let postViewEntity = PostViewEntity(
                        title       : post.title ?? "",
                        description : post.body ?? ""
                    )
                    
                    return postViewEntity
                })
            }
        }
    }
}
