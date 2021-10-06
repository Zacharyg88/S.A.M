//
//  SWTabBarControllerViewController.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 8/29/21.
//

import UIKit
import Foundation

class SWTabBarControllerViewController: UITabBarController {

    var customTabBar: TabNavigationMenu!
    var tabBarHeight: CGFloat = 88.0
    
    override func viewDidLoad() {
            super.viewDidLoad()
            self.loadTabBar()
        }
    func loadTabBar() {
            // We'll create and load our custom tab bar here
        
        var tabItems: [TabBarItem] = [.heroes, .missions, .rules, .profile]
        if currentUserIsAdmin {
            tabItems = [.heroes, .missions, .admin, .rules, .profile]
        }
        self.setupCustomTabMenu(tabItems) { (controllers) in
            self.viewControllers = controllers
        }
        self.selectedIndex = 0 // default our selected index to the first item
        }
    
    
    func setupCustomTabMenu(_ menuItems: [TabBarItem], completion: @escaping ([UIViewController]) -> Void) {
        
        let frame = tabBar.frame
        var controllers = [UIViewController]()
        // hide the tab bar
        tabBar.isHidden = true
        self.customTabBar = TabNavigationMenu(menuItems: menuItems, frame: frame)
        self.customTabBar.translatesAutoresizingMaskIntoConstraints = false
        self.customTabBar.clipsToBounds = true
        self.customTabBar.itemTapped = self.changeTab
        self.customTabBar.backgroundColor = UIColor(named:"SWBackground")
        // Add it to the view
        self.view.addSubview(customTabBar)
        // Add positioning constraints to place the nav menu right where the tab bar should be
        NSLayoutConstraint.activate([
            self.customTabBar.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            self.customTabBar.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
            self.customTabBar.widthAnchor.constraint(equalToConstant: tabBar.frame.width),
            self.customTabBar.heightAnchor.constraint(equalToConstant: tabBarHeight), // Fixed height for nav menu
            self.customTabBar.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor)
        ])
        for i in 0 ..< menuItems.count {
            controllers.append(menuItems[i].viewController) // we fetch the matching view controller and append here
        }
        self.view.layoutIfNeeded() // important step
        completion(controllers) // setup complete. handoff here
    // handle creation of the tab bar and attach touch event listeners
        }
    
    func changeTab(tab: Int) {
        self.selectedIndex = tab
    }


}
