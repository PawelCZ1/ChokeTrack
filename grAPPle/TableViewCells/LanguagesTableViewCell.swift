//
//  LanguagesTableViewCell.swift
//  grAPPle
//
//  Created by Paweł Czapran on 30/05/2024.
//

import UIKit

class LanguagesTableViewCell: UITableViewCell {
    
    let languageNameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLanguageNameLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(language: Language) {
        backgroundColor = .darkRose
        selectionStyle = .none
        languageNameLabel.text = language.name
    }
    
    private func setupLanguageNameLabel() {
        addSubview(languageNameLabel)
        
        languageNameLabel.text = "English"
        languageNameLabel.textColor = .black
        
        languageNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            languageNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            languageNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Theme.Constants.standardTableViewCellLeadingMargin),
            languageNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
