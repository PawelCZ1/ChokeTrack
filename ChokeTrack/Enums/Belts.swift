//
//  Belts.swift
//  ChokeTrack
//
//  Created by Paweł Czapran on 20/05/2024.
//

import UIKit

enum Belts {
    case White
    case Blue
    case Purple
    case Brown
    case Black
}

extension Belts {
    static func image(for belt: Belts) -> UIImage? {
        switch belt {
        case .White:
            return UIImage(named: "white_belt_icon")
        case .Blue:
            return UIImage(named: "blue_belt_icon")
        case .Purple:
            return UIImage(named: "purple_belt_icon")
        case .Brown:
            return UIImage(named: "brown_belt_icon")
        case .Black:
            return UIImage(named: "black_belt_icon")
        }
    }
}

