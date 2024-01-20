//
//  ByCategory.swift
//  OhanaTestTask
//
//  Created by Serhan Khan on 20/01/2024.
//

import UIKit.UIImage

struct ByCategory: Hashable {
    let type: CategoryType
    let percentage: Double
    let duration: String
    let count: Int
}

enum CategoryType {
    case socials
    case games
    case education
    case productivity
    case messaging
    
    var title: String {
        switch self {
        case .socials:
            "Socials"
        case .games:
            "Games"
        case .education:
            "Education"
        case .productivity:
            "Productivity"
        case .messaging:
            "Messaging"
        }
    }
    
    var color: UIColor {
        switch self {
        case .socials:
            UIColor.red
        case .games:
            UIColor.yellow
        case .education:
            UIColor.green
        case .productivity:
            UIColor.blue
        case .messaging:
            UIColor.purple
        }
    }
}
