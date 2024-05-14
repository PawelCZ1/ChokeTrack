//
//  UIImageViewExtensions.swift
//  ChokeTrack
//
//  Created by Paweł Czapran on 14/05/2024.
//
import UIKit

extension UIImageView {
    func makeRounded() {
        let radius = CGRectGetWidth(self.frame) / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
