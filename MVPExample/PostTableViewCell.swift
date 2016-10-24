//
//  PostTableViewCell.swift
//  MVPExample
//
//  Created by Fernando Ortiz on 10/23/16.
//  Copyright © 2016 Fernando Martín Ortiz. All rights reserved.
//

import UIKit

final class PostTableViewCell: UITableViewCell {
    
    // MARK: - Views -
    @IBOutlet weak var postTitleLabel: UILabel!
    
    // MARK: - Life cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Configuration -
    func configure(with post: PostViewEntity) {
        self.postTitleLabel.text = post.title
    }
    
}
