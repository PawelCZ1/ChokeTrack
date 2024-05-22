//
//  UIViewExtensions.swift
//  ChokeTrack
//
//  Created by Paweł Czapran on 14/05/2024.
//

import UIKit

extension UIView {
    func makeRoundedAndShadow(cornerRadius: CGFloat = 20) {
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 6.0, height: 6.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 2.0
        self.layer.masksToBounds = false
    }
    
    func makeRounded(cornerRadius: CGFloat = 20) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = false
    }
    
    func makeShadow() {
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 6.0, height: 6.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 2.0
        self.layer.masksToBounds = false
    }
}
