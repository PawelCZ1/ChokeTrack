//
//  SettingsViewController.swift
//  grAPPle
//
//  Created by Paweł Czapran on 25/05/2024.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let settingsLabel = UILabel()
    
    
    override func viewDidLoad() {
        view.backgroundColor = .black
        setupSettingsLabel()
    }
    
    
    
    private func setupSettingsLabel() {
        view.addSubview(settingsLabel)
        
        settingsLabel.text = "Settings"
        settingsLabel.textColor = .darkRose
        settingsLabel.font = UIFont.systemFont(ofSize: 36)
        
        settingsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            settingsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            settingsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            settingsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
        ])
    }
}
