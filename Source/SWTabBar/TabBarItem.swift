//
//  TabBarItem.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 8/30/21.
//

import Foundation
import UIKit


enum TabBarItem: String, CaseIterable {
    case heroes = "Heroes"
    case missions = "Missions"
    case rules = "Rules"
    case profile = "Profile"
    
var viewController: UIViewController {
        switch self {
        case .heroes:
            return SWHeroViewController()
    
        case .missions:
            return SWMissionLogViewController()
        case .rules:
            return SWRulesViewController()
        case .profile:
            return SWProfileViewController()
        }
    }
    // these can be your icons
    var icon: UIImage {
        switch self {
        case .heroes:
            return UIImage(named: "sw_icon_heroes")!
        
        case .missions:
            return UIImage(named: "sw_icon_missions")!
        case .rules:
            return UIImage(named: "sw_icon_rules")!
        case .profile:
            return UIImage(named: "sw_icon_settings")!
        }
    }
var displayTitle: String {
        return self.rawValue.capitalized(with: nil)
    }
}
