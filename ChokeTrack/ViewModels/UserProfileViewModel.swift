//
//  UserProfileViewModel.swift
//  ChokeTrack
//
//  Created by Paweł Czapran on 18/05/2024.
//

struct UserProfileViewModel {
    var name: Observable<String?> = Observable(nil)
    var description: Observable<String?> = Observable(nil)
    var stats: Observable<[UserProfileStat]> = Observable([])
        
    
    func initialize() {
        let data = UserProfileMockData.getUserProfileData()
        name.value = data.name
        description.value = data.description
        stats.value = data.stats
        
    }
}
