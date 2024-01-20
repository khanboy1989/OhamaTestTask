//
//  ByApp.swift
//  OhanaTestTask
//
//  Created by Serhan Khan on 20/01/2024.
//

import UIKit.UIImage

struct ByApp: Hashable {
    let name: String
    let icon: String
    let duration: String
    
    var iconImage: UIImage? {
        return UIImage(named: icon)
    }
}

