//
//  String.swift
//  ChokeTrack
//
//  Created by Paweł Czapran on 20/05/2024.
//
import UIKit

extension String {
    static let defaultLocalizationTableName = "Localizable"
    static let currentLocale = "current_locale"
    
    static let currentBelt = "current_belt".localized
    
    var localized: String {
        if let _ = UserDefaults.standard.string(forKey: String.currentLocale) {} else {
                // we set a default, just in case
                UserDefaults.standard.set("en", forKey: String.currentLocale)
                UserDefaults.standard.synchronize()
            }

            let lang = UserDefaults.standard.string(forKey: String.currentLocale)

            let path = Bundle.main.path(forResource: lang, ofType: "lproj")
            let bundle = Bundle(path: path!)

            return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
        }
}
