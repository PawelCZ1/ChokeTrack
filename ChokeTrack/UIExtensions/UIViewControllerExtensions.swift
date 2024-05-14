//
//  UIViewControllerExtensions.swift
//  ChokeTrack
//
//  Created by Paweł Czapran on 14/05/2024.
//

import UIKit

extension UIViewController {
    func makeRounded() {
        self.view.layer.cornerRadius = 20
        self.view.layer.masksToBounds = true
    }
}
