//
//  UserProfileCurrentBeltView.swift
//  ChokeTrack
//
//  Created by Paweł Czapran on 15/05/2024.
//

import UIKit

class UserProfileCurrentBeltView: UIView {
    
    let userProfileCurrentBeltLabel = UILabel()
    let userProfileCurrentBeltImageView = UIImageView()
    let userProfileChangeCurrentBeltButton = UIButton()
    
    init() {
        super.init(frame: .zero)
        setupUserProfileCurrentBeltLabel()
        setupUserProfileCurrentBeltImageView()
        setupUserProfileChangeCurrentBeltButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUserProfileCurrentBeltLabel() {
        addSubview(userProfileCurrentBeltLabel)
        
        userProfileCurrentBeltLabel.text = "Current belt"
        userProfileCurrentBeltLabel.textAlignment = .center
        userProfileCurrentBeltLabel.font = .boldSystemFont(ofSize: 18)
        userProfileCurrentBeltLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userProfileCurrentBeltLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            userProfileCurrentBeltLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            userProfileCurrentBeltLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24)
        ])
    }
    
    private func setupUserProfileCurrentBeltImageView() {
        addSubview(userProfileCurrentBeltImageView)
        
        userProfileCurrentBeltImageView.image = UIImage(named: "white_belt_icon")
        userProfileCurrentBeltImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userProfileCurrentBeltImageView.topAnchor.constraint(equalTo: userProfileCurrentBeltLabel.bottomAnchor, constant: 12),
            userProfileCurrentBeltImageView.widthAnchor.constraint(equalToConstant: 100),
            userProfileCurrentBeltImageView.heightAnchor.constraint(equalToConstant: 100),
            userProfileCurrentBeltImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setupUserProfileChangeCurrentBeltButton() {
        addSubview(userProfileChangeCurrentBeltButton)
        
        userProfileChangeCurrentBeltButton.setTitle("Change", for: .normal)
        userProfileChangeCurrentBeltButton.setTitleColor(.black, for: .normal)
        userProfileChangeCurrentBeltButton.backgroundColor = .systemTeal
        userProfileChangeCurrentBeltButton.layer.cornerRadius = 8
        userProfileChangeCurrentBeltButton.layer.borderWidth = 1
        userProfileChangeCurrentBeltButton.layer.borderColor = UIColor.black.cgColor
        userProfileChangeCurrentBeltButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userProfileChangeCurrentBeltButton.topAnchor.constraint(equalTo: userProfileCurrentBeltImageView.bottomAnchor),
            userProfileChangeCurrentBeltButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            userProfileChangeCurrentBeltButton.widthAnchor.constraint(equalToConstant: 100),
            userProfileChangeCurrentBeltButton.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    
    
}
