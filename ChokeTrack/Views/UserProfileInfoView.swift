//
//  UserProfileInfoViewController.swift
//  ChokeTrack
//
//  Created by Paweł Czapran on 14/05/2024.
//

import UIKit

class UserProfileInfoView: UIView {
    
    let userProfileIconImageView = UIImageView()
    let userProfileNameLabel = UILabel()
    let userProfileTrainingCountLabel = UILabel()
    let userProfileDescriptionLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        setupUserProfileIconImageView()
        setupUserProfileNameLabel()
        setupUserProfileTrainingCountLabel()
        setupUserProfileDescriptionLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUserProfileIconImageView() {
        addSubview(userProfileIconImageView)
        
        userProfileIconImageView.image = UIImage(named: "default_user_profile_image")
        DispatchQueue.main.async(execute:{
            self.userProfileIconImageView.makeRounded()
        })
        userProfileIconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userProfileIconImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 24),
            userProfileIconImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24),
            userProfileIconImageView.widthAnchor.constraint(equalToConstant: 100),
            userProfileIconImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupUserProfileNameLabel() {
        addSubview(userProfileNameLabel)
        
        userProfileNameLabel.text = "Name"
        userProfileNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userProfileNameLabel.leadingAnchor.constraint(equalTo: userProfileIconImageView.trailingAnchor, constant: 8),
            userProfileNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            userProfileNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32)
        ])
    }
    
    private func setupUserProfileTrainingCountLabel() {
        addSubview(userProfileTrainingCountLabel)
        
        userProfileTrainingCountLabel.text = "Trainings: 0"
        userProfileTrainingCountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userProfileTrainingCountLabel.leadingAnchor.constraint(equalTo: userProfileIconImageView.trailingAnchor, constant: 8),
            userProfileTrainingCountLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            userProfileTrainingCountLabel.bottomAnchor.constraint(equalTo: userProfileIconImageView.bottomAnchor, constant: -8)
        ])
    }
    
    private func setupUserProfileDescriptionLabel() {
        addSubview(userProfileDescriptionLabel)
        
        userProfileDescriptionLabel.text = "Description"
        userProfileDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userProfileDescriptionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 32),
            userProfileDescriptionLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            userProfileDescriptionLabel.topAnchor.constraint(equalTo: userProfileIconImageView.bottomAnchor, constant: 16),
            userProfileDescriptionLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24)
        ])
    }
}
