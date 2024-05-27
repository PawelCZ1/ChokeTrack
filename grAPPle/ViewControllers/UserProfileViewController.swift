//
//  UserProfileViewController.swift
//  ChokeTrack
//
//  Created by Paweł Czapran on 14/05/2024.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    let vm = UserProfileViewModel()
    
    struct Cells {
        static let statCell = "StatCell"
    }
    
    let safeAreaView = UIView()
    let userProfileNavigationItem = UINavigationItem()
    let scrollView = UIScrollView()
    let contentView = UIView()
    let userProfileLabel = UILabel()
    let userProfileInfoView = UserProfileInfoView()
    let userProfileCurrentBeltView = UserProfileCurrentBeltView()
    let userProfileStatsTableView = UITableView()
    let userProfileFavoriteTechniqueView = UserProfileFavoriteTechniqueView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        vm.initialize()
        vm.stats.bind {_ in
            self.userProfileStatsTableView.reloadData()
        }
        setupSafeAreaView()
        setupNavigationBar()
        setupScrollView()
        setupContentView()
        setupUserProfileLabel()
        addUserProfileInfoView()
        addUserProfileCurrentBeltView()
        setupUserProfileStatsTableView()
        addUserProfileFavoriteTechniqueView()
    }
    
    private func setupSafeAreaView() {
        view.addSubview(safeAreaView)
        safeAreaView.backgroundColor = .darkRose
        safeAreaView.translatesAutoresizingMaskIntoConstraints = false
        var topSafeAreaHeight: CGFloat = 0
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            let window = windowScene.windows.first
            let safeFrame = window?.safeAreaLayoutGuide.layoutFrame
            topSafeAreaHeight = safeFrame?.minY ?? 0
            NSLayoutConstraint.activate([
                safeAreaView.topAnchor.constraint(equalTo: view.topAnchor),
                safeAreaView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                safeAreaView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                safeAreaView.heightAnchor.constraint(equalToConstant: topSafeAreaHeight)
            ])
        } else {
            NSLayoutConstraint.activate([
                safeAreaView.topAnchor.constraint(equalTo: view.topAnchor),
                safeAreaView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                safeAreaView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                safeAreaView.heightAnchor.constraint(equalToConstant: 59)
            ])
        }
    }
    
    private func setupNavigationBar() {
        let settingsButton: UIButton = UIButton(type: UIButton.ButtonType.custom)
        settingsButton.setTitle("Settings", for: .normal)
        settingsButton.setTitleColor(.darkerRose, for: .normal)
        settingsButton.addTarget(self, action: #selector(settingsButtonTapped), for: UIControl.Event.touchUpInside)
        settingsButton.frame = CGRectMake(0, 0, 53, 31)

        let barButton = UIBarButtonItem(customView: settingsButton)
        navigationItem.rightBarButtonItem = barButton
        
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        backButton.tintColor = .darkerRose
        
        navigationItem.backBarButtonItem = backButton
        
        let barApperance = UINavigationBarAppearance()
        barApperance.configureWithOpaqueBackground()
        barApperance.backgroundColor = .darkRose
        self.navigationController?.navigationBar.standardAppearance = barApperance
        self.navigationController?.navigationBar.scrollEdgeAppearance = barApperance
    }
    
    @objc func settingsButtonTapped() {
        let settingsVC = SettingsViewController()
        self.navigationController?.pushViewController(settingsVC, animated: true)
    }
    
    private func setupUserProfileLabel() {
        contentView.addSubview(userProfileLabel)
        
        userProfileLabel.text = "User Profile"
        userProfileLabel.textColor = .darkRose
        userProfileLabel.font = UIFont.systemFont(ofSize: 36)
        
        userProfileLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userProfileLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 32),
            userProfileLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            userProfileLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
        ])
    }

    private func addUserProfileInfoView() {
        contentView.addSubview(userProfileInfoView)
        userProfileInfoView.backgroundColor = .darkRose
        DispatchQueue.main.async(execute:{
            self.userProfileInfoView.makeRoundedAndShadow()
        })
        setUserProfileInfoViewConstraints()
    }
    
    private func setUserProfileInfoViewConstraints() {
        userProfileInfoView.configureUI(vm: vm)
        userProfileInfoView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userProfileInfoView.topAnchor.constraint(equalTo: userProfileLabel.bottomAnchor, constant: 32),
            userProfileInfoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            userProfileInfoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            userProfileInfoView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func addUserProfileCurrentBeltView() {
        contentView.addSubview(userProfileCurrentBeltView)
        userProfileCurrentBeltView.backgroundColor = .darkRose
        DispatchQueue.main.async(execute:{
            self.userProfileCurrentBeltView.makeRoundedAndShadow()
        })
        setUserProfileCurrentBeltConstraints()
    }
    
    private func setUserProfileCurrentBeltConstraints() {
        userProfileCurrentBeltView.configureUI(vm: vm)
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
            scrollView.topAnchor.constraint(equalTo: safeAreaView.bottomAnchor),
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
            contentView.heightAnchor.constraint(equalToConstant: 1000)
        ])
    }
    
    private func setupUserProfileStatsTableView() {
        contentView.addSubview(userProfileStatsTableView)
        
        userProfileStatsTableView.delegate = self
        userProfileStatsTableView.dataSource = self
        
        userProfileStatsTableView.backgroundColor = .darkRose
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
            userProfileStatsTableView.heightAnchor.constraint(equalToConstant: 25 * CGFloat(vm.stats.value?.count ?? 0))
        ])
    }
    
    private func addUserProfileFavoriteTechniqueView() {
        contentView.addSubview(userProfileFavoriteTechniqueView)
        userProfileFavoriteTechniqueView.backgroundColor = .darkRose
        DispatchQueue.main.async(execute:{
            self.userProfileFavoriteTechniqueView.makeRoundedAndShadow()
        })
        setUserProfileFavoriteTechniqueViewConstraints()
    }
    
    private func setUserProfileFavoriteTechniqueViewConstraints() {
        userProfileFavoriteTechniqueView.configureUI(vm: vm)
        userProfileFavoriteTechniqueView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userProfileFavoriteTechniqueView.topAnchor.constraint(equalTo: userProfileStatsTableView.bottomAnchor, constant: 40),
            userProfileFavoriteTechniqueView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            userProfileFavoriteTechniqueView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            userProfileFavoriteTechniqueView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}

extension UserProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.stats.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userProfileStatsTableView.dequeueReusableCell(withIdentifier: Cells.statCell) as! UserProfileStatsTableViewCell
        guard let stats = vm.stats.value else {return UITableViewCell()}
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
