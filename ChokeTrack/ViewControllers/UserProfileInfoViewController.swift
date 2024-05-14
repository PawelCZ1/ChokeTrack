//
//  UserProfileInfoViewController.swift
//  ChokeTrack
//
//  Created by Paweł Czapran on 14/05/2024.
//

import UIKit

class UserProfileInfoViewController: UIViewController {
    
    let userProfileIconImageView = UIImageView()
    let userProfileNameLabel = UILabel()
    let userProfileTrainingCountLabel = UILabel()
    let userProfileDescriptionLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUserProfileIconImageView()
        setupUserProfileNameLabel()
        setupUserProfileTrainingCountLabel()
        setupUserProfileDescriptionLabel()
    }
    
    private func setupUserProfileIconImageView() {
        view.addSubview(userProfileIconImageView)
        
        userProfileIconImageView.image = UIImage(named: "default_user_profile_image")
        DispatchQueue.main.async(execute:{
            self.userProfileIconImageView.makeRounded()
        })
        userProfileIconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userProfileIconImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            userProfileIconImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            userProfileIconImageView.widthAnchor.constraint(equalToConstant: 100),
            userProfileIconImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupUserProfileNameLabel() {
        view.addSubview(userProfileNameLabel)
        
        userProfileNameLabel.text = "Name"
        userProfileNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userProfileNameLabel.leadingAnchor.constraint(equalTo: userProfileIconImageView.trailingAnchor, constant: 8),
            userProfileNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            userProfileNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32)
        ])
    }
    
    private func setupUserProfileTrainingCountLabel() {
        view.addSubview(userProfileTrainingCountLabel)
        
        userProfileTrainingCountLabel.text = "Trainings: 0"
        userProfileTrainingCountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userProfileTrainingCountLabel.leadingAnchor.constraint(equalTo: userProfileIconImageView.trailingAnchor, constant: 8),
            userProfileTrainingCountLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            userProfileTrainingCountLabel.bottomAnchor.constraint(equalTo: userProfileIconImageView.bottomAnchor, constant: -8)
        ])
    }
    
    private func setupUserProfileDescriptionLabel() {
        view.addSubview(userProfileDescriptionLabel)
        
        userProfileDescriptionLabel.text = "Description"
        userProfileDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userProfileDescriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            userProfileDescriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            userProfileDescriptionLabel.topAnchor.constraint(equalTo: userProfileIconImageView.bottomAnchor, constant: 16),
            userProfileDescriptionLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24)
        ])
    }
}
