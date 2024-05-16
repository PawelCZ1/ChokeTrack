//
//  UserProfileViewController.swift
//  ChokeTrack
//
//  Created by Paweł Czapran on 14/05/2024.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    
    struct Cells {
        static let statCell = "StatCell"
    }
    
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let userProfileInfoView = UserProfileInfoView()
    let userProfileCurrentBeltView = UserProfileCurrentBeltView()
    let userProfileStatsTableView = UITableView()
    
    var stats: [UserProfileStat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        stats = fetchData()
        setupScrollView()
        setupContentView()
        addUserProfileInfoView()
        addUserProfileCurrentBeltView()
        setupUserProfileStatsTableView()
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
    
    private func setupUserProfileStatsTableView() {
        contentView.addSubview(userProfileStatsTableView)
        
        userProfileStatsTableView.delegate = self
        userProfileStatsTableView.dataSource = self
        
        userProfileStatsTableView.backgroundColor = .systemPurple
        userProfileStatsTableView.isScrollEnabled = false
        //userProfileStatsTableView.is
        userProfileStatsTableView.rowHeight = 25
        userProfileStatsTableView.register(UserProfileStatsTableViewCell.self, forCellReuseIdentifier: Cells.statCell)
        DispatchQueue.main.async(execute:{
            self.userProfileStatsTableView.makeRoundedAndShadow()
        })
        
        userProfileStatsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userProfileStatsTableView.topAnchor.constraint(equalTo: userProfileCurrentBeltView.bottomAnchor, constant: 40),
            userProfileStatsTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            userProfileStatsTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32)
            ,
            userProfileStatsTableView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

extension UserProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userProfileStatsTableView.dequeueReusableCell(withIdentifier: Cells.statCell) as! UserProfileStatsTableViewCell
        
        let userProfileStat = stats[indexPath.row]
        cell.configure(userProfileStat: userProfileStat)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cornerRadius = 8
        var corners: UIRectCorner = []

        if indexPath.row == 0 {
            corners.update(with: .topLeft)
            corners.update(with: .topRight)
        }

        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            corners.update(with: .bottomLeft)
            corners.update(with: .bottomRight)
        }

        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: cell.bounds,
                                      byRoundingCorners: corners,
                                      cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)).cgPath
        cell.layer.mask = maskLayer
    }
    
}

extension UserProfileViewController {
    func fetchData() -> [UserProfileStat] {
        return [
            UserProfileStat(imageSource: "a", name: "Wins", lastSessionStats: "0", inTotalStats: "0"),
            UserProfileStat(imageSource: "a", name: "Loses", lastSessionStats: "0", inTotalStats: "0"),
            UserProfileStat(imageSource: "a", name: "Subs", lastSessionStats: "0", inTotalStats: "0"),
            UserProfileStat(imageSource: "a", name: "Chokes", lastSessionStats: "0", inTotalStats: "0")
        ]
    }
}

