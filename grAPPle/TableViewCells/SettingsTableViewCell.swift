//
//  SettingsTableViewCell.swift
//  grAPPle
//
//  Created by Paweł Czapran on 28/05/2024.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    let settingIconImageView = UIImageView()
    let settingNameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSettingIconImageView()
        setupSettingNameLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(setting: Setting) {
        backgroundColor = .darkRose
        selectionStyle = .none
        settingNameLabel.text = setting.name
        settingIconImageView.image = UIImage(systemName: setting.iconSourceName!)
    }
    
    private func setupSettingIconImageView() {
        addSubview(settingIconImageView)
        
        settingIconImageView.tintColor = .black
        
        settingIconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            settingIconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            settingIconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            settingIconImageView.widthAnchor.constraint(equalToConstant: 25),
            settingIconImageView.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    private func setupSettingNameLabel() {
        addSubview(settingNameLabel)
        
        settingNameLabel.text = "Default"
        settingNameLabel.textColor = .black
        
        settingNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            settingNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            settingNameLabel.leadingAnchor.constraint(equalTo: settingIconImageView.trailingAnchor, constant: 8),
            settingNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
