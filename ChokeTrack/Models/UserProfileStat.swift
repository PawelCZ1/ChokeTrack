//
//  UserProfileStat.swift
//  ChokeTrack
//
//  Created by Paweł Czapran on 16/05/2024.
//

class UserProfileStat {
    
    init(imageSource: String, name: String, lastSessionStats: String, inTotalStats: String) {
        self.imageSource = imageSource
        self.name = name
        self.lastSessionStats = lastSessionStats
        self.inTotalStats = inTotalStats
    }
    
    var imageSource: String
    var name: String
    var lastSessionStats: String
    var inTotalStats: String
    
}
