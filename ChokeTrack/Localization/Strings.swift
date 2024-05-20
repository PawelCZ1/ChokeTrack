//
//  Strings.swift
//  ChokeTrack
//
//  Created by Paweł Czapran on 20/05/2024.
//
import UIKit

struct Strings {
    static let currentBelt = "current_belt".localized()
}

extension String {
    static let defaultLocalizationTableName = "Localizable"
    
    func localized() -> String {
        return NSLocalizedString(self, tableName: String.defaultLocalizationTableName, bundle: .main, value: self, comment: self)
    }
}
