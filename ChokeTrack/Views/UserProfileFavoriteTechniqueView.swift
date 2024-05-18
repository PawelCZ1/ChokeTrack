//
//  UserProfileFavoriteTechniqueView.swift
//  ChokeTrack
//
//  Created by Paweł Czapran on 17/05/2024.
//

import UIKit

class UserProfileFavoriteTechniqueView: UIView {
    
    let userProfileFavoriteTechniqueLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        setupUserProfileFavoriteTechniqueLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUserProfileFavoriteTechniqueLabel() {
        addSubview(userProfileFavoriteTechniqueLabel)
        
        userProfileFavoriteTechniqueLabel.text = "Favorite technique"
        userProfileFavoriteTechniqueLabel.textColor = .black
        userProfileFavoriteTechniqueLabel.textAlignment = .center
        userProfileFavoriteTechniqueLabel.font = .boldSystemFont(ofSize: 18)
        
        userProfileFavoriteTechniqueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userProfileFavoriteTechniqueLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            userProfileFavoriteTechniqueLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            userProfileFavoriteTechniqueLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    
}
