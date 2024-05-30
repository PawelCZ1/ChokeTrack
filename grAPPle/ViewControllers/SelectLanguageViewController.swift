//
//  SelectLanguageViewController.swift
//  grAPPle
//
//  Created by Paweł Czapran on 30/05/2024.
//

import UIKit

class SelectLanguageViewController: UIViewController {
    
    let languages = [Language(name: "English"), Language(name: "Polish"), Language(name: "Spanish")]
    
    let selectLanguageLabel = UILabel()
    let languagesTableView = UITableView()
    
    override func viewDidLoad() {
        setupSelectLanguageLabel()
        setupLanguagesTableView()
    }
    
    private func setupSelectLanguageLabel() {
        view.addSubview(selectLanguageLabel)
        
        selectLanguageLabel.text = "Select language"
        selectLanguageLabel.textColor = .darkRose
        selectLanguageLabel.font = UIFont.systemFont(ofSize: Theme.Constants.standardViewControllerTitleFontSize)
        
        selectLanguageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            selectLanguageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            selectLanguageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Theme.Constants.standardLeadingMargin),
            selectLanguageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Theme.Constants.standardTrailingMargin),
        ])
    }
    
    private func setupLanguagesTableView() {
        view.addSubview(languagesTableView)
        
        languagesTableView.delegate = self
        languagesTableView.dataSource = self
        
        languagesTableView.backgroundColor = .darkRose
        languagesTableView.isScrollEnabled = false
        
        languagesTableView.rowHeight = 40
        languagesTableView.register(LanguagesTableViewCell.self, forCellReuseIdentifier: Cells.languageCell)
        DispatchQueue.main.async(execute:{
            self.languagesTableView.makeRoundedAndShadow()
        })
        
        languagesTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            languagesTableView.topAnchor.constraint(equalTo: selectLanguageLabel.bottomAnchor, constant: 40),
            languagesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Theme.Constants.standardLeadingMargin),
            languagesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Theme.Constants.standardTrailingMargin)
            ,
            languagesTableView.heightAnchor.constraint(equalToConstant: 40 * CGFloat(languages.count))
        ])
    }
    
}

extension SelectLanguageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = languagesTableView.dequeueReusableCell(withIdentifier: Cells.languageCell) as! LanguagesTableViewCell
        let language = languages[indexPath.row]
        cell.configure(language: language)
        
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
