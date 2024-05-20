//
//  UserProfileViewModel.swift
//  ChokeTrack
//
//  Created by Paweł Czapran on 18/05/2024.
//

struct UserProfileViewModel {
    var name: Observable<String?> = Observable()
    var description: Observable<String?> = Observable()
    var trainingsCount: Observable<Int> = Observable(0)
    var stats: Observable<[UserProfileStat]> = Observable([])
    var belt: Observable<Belts?> = Observable()
    var favoriteTechnique: Observable<String?> = Observable()
        
    
    func initialize() {
        let data = UserProfileMockData.getUserProfileData()
        name.value = data.name
        description.value = data.description
        trainingsCount.value = data.trainingsCount
        stats.value = data.stats
        belt.value = data.belt
        favoriteTechnique.value = data.favoriteTechnique
    }
}
