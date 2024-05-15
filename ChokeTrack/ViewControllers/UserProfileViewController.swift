//
//  UserProfileViewController.swift
//  ChokeTrack
//
//  Created by Paweł Czapran on 14/05/2024.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let userProfileInfoView = UserProfileInfoView()
    let userProfileCurrentBeltView = UserProfileCurrentBeltView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        setupScrollView()
        setupContentView()
        addUserProfileInfoView()
        addUserProfileCurrentBeltView()
    }
    
    private func addUserProfileInfoView() {
        contentView.addSubview(userProfileInfoView)
        userProfileInfoView.backgroundColor = .systemPurple
        DispatchQueue.main.async(execute:{
            self.userProfileInfoView.makeRoundedAndShadow()
        })
        setUserProfileInfoViewConstraints()
    }
    
    private func setUserProfileInfoViewConstraints() {
        userProfileInfoView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userProfileInfoView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 32),
            userProfileInfoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            userProfileInfoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            userProfileInfoView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func addUserProfileCurrentBeltView() {
        contentView.addSubview(userProfileCurrentBeltView)
        userProfileCurrentBeltView.backgroundColor = .systemPurple
        DispatchQueue.main.async(execute:{
            self.userProfileCurrentBeltView.makeRoundedAndShadow()
        })
        setUserProfileCurrentBeltConstraints()
    }
    
    private func setUserProfileCurrentBeltConstraints() {
        userProfileCurrentBeltView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userProfileCurrentBeltView.topAnchor.constraint(equalTo: userProfileInfoView.bottomAnchor, constant: 40),
            userProfileCurrentBeltView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            userProfileCurrentBeltView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            userProfileCurrentBeltView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isDirectionalLockEnabled = true
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupContentView() {
        scrollView.addSubview(contentView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 2000)
        ])
    }
}

