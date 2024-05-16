//
//  UserProfileStatsTableViewCell.swift
//  ChokeTrack
//
//  Created by Paweł Czapran on 16/05/2024.
//

import UIKit

class UserProfileStatsTableViewCell: UITableViewCell {
    
    let userProfileStatLabel = UILabel()
    let userProfileLastSessionStatsLabel = UILabel()
    let userProfileInTotalStatsLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUserProfileStatLabel()
        setupUserProfileLastSessionStatsLabel()
        setupUserProfileInTotalStatsLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(userProfileStat: UserProfileStat) {
        backgroundColor = .systemPurple
        selectionStyle = .none
        userProfileStatLabel.text = userProfileStat.name
        userProfileLastSessionStatsLabel.text = userProfileStat.lastSessionStats
        userProfileInTotalStatsLabel.text = userProfileStat.inTotalStats
    }
    
    private func setupUserProfileStatLabel() {
        addSubview(userProfileStatLabel)
        
        userProfileStatLabel.text = "No stat"
        
        userProfileStatLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userProfileStatLabel.topAnchor.constraint(equalTo: topAnchor),
            userProfileStatLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            userProfileStatLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupUserProfileLastSessionStatsLabel() {
        addSubview(userProfileLastSessionStatsLabel)
        
        userProfileLastSessionStatsLabel.text = "0"
        
        userProfileLastSessionStatsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userProfileLastSessionStatsLabel.topAnchor.constraint(equalTo: topAnchor),
            userProfileLastSessionStatsLabel.leadingAnchor.constraint(equalTo: userProfileStatLabel.trailingAnchor, constant: 24),
            userProfileLastSessionStatsLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupUserProfileInTotalStatsLabel() {
        addSubview(userProfileInTotalStatsLabel)
        
        userProfileInTotalStatsLabel.text = "0"
        
        userProfileInTotalStatsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userProfileInTotalStatsLabel.topAnchor.constraint(equalTo: topAnchor),
            userProfileInTotalStatsLabel.leadingAnchor.constraint(equalTo: userProfileLastSessionStatsLabel.trailingAnchor, constant: 24),
            userProfileInTotalStatsLabel.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
}
