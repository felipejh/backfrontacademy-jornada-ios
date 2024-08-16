//
//  NotificationViewModel.swift
//  BackfrontPosts
//
//  Created by Felipe Hoffmann on 12/08/24.
//

import SwiftUI

@Observable
class NotificationViewModel {
    var activityList = [
        Activity(activity: .liked, duration: "15m", usersInContext: [User(userName: "Cleiton", userImage: "user5"), User(userName: "Mario", userImage: "user2")], posImage: "dogs"),
        Activity(activity: .suggestFollower, duration: "25m", usersInContext: [User(userName: "Mario", userImage: "user2")], posImage: "dogs"),
        Activity(activity: .newFollower, duration: "25m", usersInContext: [User(userName: "Cleiton", userImage: "user5"), User(userName: "Mario", userImage: "user2")], posImage: "dogs"),
        Activity(activity: .suggestFollower, duration: "25m", usersInContext: [User(userName: "Cleiton", userImage: "user5"), User(userName: "Mario", userImage: "user2")], posImage: "dogs")
    ]
}
