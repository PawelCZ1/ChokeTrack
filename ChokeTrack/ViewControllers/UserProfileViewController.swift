//
//  ViewController.swift
//  ChokeTrack
//
//  Created by Paweł Czapran on 14/05/2024.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    var userProfileInfoVC = UserProfileInfoViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        setupScrollView()
        setupContentView()
        addUserProfileInfoVC()
    }
    
    private func addUserProfileInfoVC() {
        addChild(userProfileInfoVC)
        contentView.addSubview(userProfileInfoVC.view)
        userProfileInfoVC.view.backgroundColor = .systemPurple
        userProfileInfoVC.didMove(toParent: self)
        DispatchQueue.main.async(execute:{
            self.userProfileInfoVC.makeRounded()
        })
        setUserProfileInfoVCConstraints()
    }
    
    private func setUserProfileInfoVCConstraints() {
        userProfileInfoVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userProfileInfoVC.view.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 32),
            userProfileInfoVC.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            userProfileInfoVC.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            userProfileInfoVC.view.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isDirectionalLockEnabled = true
        scrollView.isScrollEnabled = true
        scrollView.contentSize = CGSize(width: 100, height: 5000)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
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

