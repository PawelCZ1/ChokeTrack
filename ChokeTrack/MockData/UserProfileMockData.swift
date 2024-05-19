//
//  UserProfileMockData.swift
//  ChokeTrack
//
//  Created by Paweł Czapran on 19/05/2024.
//

struct UserProfileMockData {
    static func getUserProfileData() -> UserProfile {
        return UserProfile(name: "Mateusz", description: "Serce ze złota", stats: [
            UserProfileStat(imageSource: "a", name: "Wins", lastSessionStats: "0", inTotalStats: "0"),
            UserProfileStat(imageSource: "a", name: "Loses", lastSessionStats: "0", inTotalStats: "0"),
            UserProfileStat(imageSource: "a", name: "Subs", lastSessionStats: "0", inTotalStats: "0"),
            UserProfileStat(imageSource: "a", name: "Taps", lastSessionStats: "0", inTotalStats: "0"),
            UserProfileStat(imageSource: "a", name: "Chokes", lastSessionStats: "0", inTotalStats: "0")
        ])
    }
}
