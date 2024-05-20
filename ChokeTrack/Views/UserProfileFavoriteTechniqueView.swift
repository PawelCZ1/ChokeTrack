//
//  UserProfileFavoriteTechniqueView.swift
//  ChokeTrack
//
//  Created by Paweł Czapran on 17/05/2024.
//

import UIKit

class UserProfileFavoriteTechniqueView: UIView {
    
    var vm: UserProfileViewModel!
    
    let userProfileFavoriteTechniqueLabel = UILabel()
    let userProfileFavoriteTechniqueImageView = UIImageView()
    let userProfileFavoriteTechniqueNameLabel = UILabel()
    
    func configureUI(vm: UserProfileViewModel) {
        self.vm = vm
        setupUserProfileFavoriteTechniqueLabel()
        setupUserProfileFavoriteTechniqueImageView()
        setupUserProfileFavoriteTechniqueNameLabel()
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
    
    private func setupUserProfileFavoriteTechniqueImageView() {
        addSubview(userProfileFavoriteTechniqueImageView)
        
        userProfileFavoriteTechniqueImageView.image = UIImage(named: "taktarov")
//        userProfileFavoriteTechniqueImageView.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
//        let screenSize: CGRect = UIScreen.main.bounds
//        userProfileFavoriteTechniqueImageView.frame = CGRect(x: 0, y: 0, width: 50, height: screenSize.height * 0.2)
        
        userProfileFavoriteTechniqueImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userProfileFavoriteTechniqueImageView.topAnchor.constraint(equalTo: userProfileFavoriteTechniqueLabel.bottomAnchor, constant: 8),
            userProfileFavoriteTechniqueImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            userProfileFavoriteTechniqueImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            userProfileFavoriteTechniqueImageView.widthAnchor.constraint(equalToConstant: 0),
            userProfileFavoriteTechniqueImageView.heightAnchor.constraint(equalToConstant: 125)
        ])
    }
    
    private func setupUserProfileFavoriteTechniqueNameLabel() {
        addSubview(userProfileFavoriteTechniqueNameLabel)
        
        if vm.favoriteTechnique.value != nil {
            let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
            let underlineAttributedString = NSAttributedString(string: vm.favoriteTechnique.value!!, attributes: underlineAttribute)
            userProfileFavoriteTechniqueNameLabel.attributedText = underlineAttributedString
        } else {
            let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
            let underlineAttributedString = NSAttributedString(string: "Taktarov", attributes: underlineAttribute)
            userProfileFavoriteTechniqueNameLabel.attributedText = underlineAttributedString
        }
        userProfileFavoriteTechniqueNameLabel.textColor = .black
        userProfileFavoriteTechniqueNameLabel.textAlignment = .center
        userProfileFavoriteTechniqueNameLabel.font = .boldSystemFont(ofSize: 14)
        
        
        
        userProfileFavoriteTechniqueNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userProfileFavoriteTechniqueNameLabel.topAnchor.constraint(equalTo: userProfileFavoriteTechniqueImageView.bottomAnchor),
            userProfileFavoriteTechniqueNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            userProfileFavoriteTechniqueNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    
}
