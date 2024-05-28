//
//  SettingsViewController.swift
//  grAPPle
//
//  Created by Paweł Czapran on 25/05/2024.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let settingsLabel = UILabel()
    let settingsTableView = UITableView()
    
    let settings = [Setting(iconSourceName: "globe", name: "Language")]
    
    
    override func viewDidLoad() {
        view.backgroundColor = .black
        setupSettingsLabel()
        setupSettingsTableView()
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
    
    private func setupSettingsTableView() {
        view.addSubview(settingsTableView)
        
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        
        settingsTableView.backgroundColor = .darkRose
        settingsTableView.isScrollEnabled = false
        
        settingsTableView.rowHeight = 40
        settingsTableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: Cells.settingCell)
        DispatchQueue.main.async(execute:{
            self.settingsTableView.makeRoundedAndShadow()
        })
        
        settingsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            settingsTableView.topAnchor.constraint(equalTo: settingsLabel.bottomAnchor, constant: 40),
            settingsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            settingsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
            ,
            settingsTableView.heightAnchor.constraint(equalToConstant: 40 * CGFloat(settings.count))
        ])
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingsTableView.dequeueReusableCell(withIdentifier: Cells.settingCell) as! SettingsTableViewCell
        let setting = settings[indexPath.row]
        cell.configure(setting: setting)
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if settings[indexPath.row].name == "Language" {
            
        }
    }
    
}
