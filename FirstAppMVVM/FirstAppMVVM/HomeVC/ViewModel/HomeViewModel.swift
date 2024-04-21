//
//  HomeViewModel.swift
//  FirstAppMVVM
//
//  Created by Felipe Hoffmann on 15/04/24.
//

import UIKit

class HomeViewModel {
    
    private var service = HomeService()
    private var posts = [Posts]()
    private var story = [Stories]()
    
    public var getListPosts: [Posts] {
        posts
    }
    
    public var getListStories: [Stories] {
        story
    }
    
    public var numberOfItems: Int {
        2
    }
    
    public func sizeForItem(indexPath: IndexPath, frame: CGRect) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: 120, height: frame.height)
        } else {
            return CGSize(width: frame.width - 120, height: frame.height)
        }
    }
    
    public func fetchAllRequest() {
        service.getHomeDataJson { homeData, error in
            if error == nil {
                self.posts = homeData?.posts ?? []
                self.story = homeData?.stories ?? []
            }
        }
    }
}
