//
//  PostCardViewModel.swift
//  FirstAppMVVM
//
//  Created by Felipe Hoffmann on 18/04/24.
//

import UIKit

class PostCardViewModel {
    
    private var listPosts: [Posts]
    
    init(listPosts: [Posts]) {
        self.listPosts = listPosts
    }
    
    public var numberOfItems: Int {
        listPosts.count
    }
    
    public func loadCurrentPost(indexPath: IndexPath) -> Posts {
        listPosts[indexPath.row]
    }
}
