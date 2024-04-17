//
//  StoryCardViewModel.swift
//  FirstAppMVVM
//
//  Created by Felipe Hoffmann on 16/04/24.
//

import UIKit

class StoryCardViewModel {
    
    private var listStory: [Stories]
    
    init(listStory: [Stories]) {
        self.listStory = listStory
    }
    
    public var numberOfItems: Int {
        listStory.count
    }
    
    func loadCurrentStory(indexPath: IndexPath) -> Stories {
        listStory[indexPath.row]
    }
    
    
}
