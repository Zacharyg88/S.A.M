//
//  TabNavigationMenu.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 8/30/21.
//

import Foundation
import UIKit


class TabNavigationMenu: UIView {
    var itemTapped: ((_ tab: Int) -> Void)?
    var activeItem: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    convenience init(menuItems: [TabBarItem], frame: CGRect) {
        self.init(frame: frame)
        self.layer.backgroundColor = UIColor(named: "SWBackground")?.cgColor
        for i in 0 ..< menuItems.count {
            let itemWidth = (UIScreen.main.bounds.width / CGFloat(menuItems.count))
            let leadingAnchor = itemWidth * CGFloat(i)
            let itemView = self.createTabItem(item: menuItems[i])
            itemView.translatesAutoresizingMaskIntoConstraints = false
            if i == 2 && currentUserIsAdmin {
                itemView.clipsToBounds = false
            }else {
                itemView.clipsToBounds = true
            }
            itemView.tag = i
            self.addSubview(itemView)
            NSLayoutConstraint.activate([
                itemView.heightAnchor.constraint(equalTo: heightAnchor, constant: -24),
                itemView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingAnchor),
                itemView.topAnchor.constraint(equalTo: self.topAnchor, constant: -8),
                itemView.widthAnchor.constraint(equalToConstant: itemWidth)
            ])
        }
        self.setNeedsLayout()
        self.layoutIfNeeded()
        self.activateTab(tab: 0)
        
    }
    
    func createTabItem(item: TabBarItem) -> UIView {
        let tabBarItem = UIView(frame: CGRect.zero)
        let itemTitleLabel = UILabel(frame: CGRect.zero)
        let itemIconView = UIImageView(frame: CGRect.zero)
    itemTitleLabel.text = item.displayTitle
        itemTitleLabel.textAlignment = .center
        itemTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        itemTitleLabel.clipsToBounds = true
        itemTitleLabel.font = UIFont(name: "Oxanium", size: 11)
        itemTitleLabel.textColor = UIColor(named: "SWStrength_Vigor")
        
        itemIconView.image = item.icon.withRenderingMode(.automatic)
        itemIconView.tintColor = UIColor(named: "SWStrength_Vigor")
        itemIconView.translatesAutoresizingMaskIntoConstraints = false
        itemIconView.clipsToBounds = true
        tabBarItem.layer.backgroundColor = UIColor(named: "SWBackground")?.cgColor
        tabBarItem.addSubview(itemIconView)
        tabBarItem.addSubview(itemTitleLabel)
        tabBarItem.translatesAutoresizingMaskIntoConstraints = false
        
        tabBarItem.clipsToBounds = true
    NSLayoutConstraint.activate([
            itemIconView.heightAnchor.constraint(equalToConstant: 20), // Fixed height for our tab item(25pts)
            itemIconView.widthAnchor.constraint(equalToConstant: 20), // Fixed width for our tab item icon
            itemIconView.centerXAnchor.constraint(equalTo: tabBarItem.centerXAnchor),
            itemIconView.topAnchor.constraint(equalTo: tabBarItem.topAnchor, constant: 16), // Position menu item icon 8pts from the top of it's parent view
            //itemIconView.leadingAnchor.constraint(equalTo: tabBarItem.leadingAnchor, constant: 35),
            itemTitleLabel.heightAnchor.constraint(equalToConstant: 13), // Fixed height for title label
            itemTitleLabel.widthAnchor.constraint(equalTo: tabBarItem.widthAnchor), // Position label full width across tab bar item
            itemTitleLabel.topAnchor.constraint(equalTo: itemIconView.bottomAnchor, constant: 8), // Position title label 4pts below item icon
        ])
    tabBarItem.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTap))) // Each item should be able to trigger and action on tap
    return tabBarItem
    }
    
    @objc func handleTap(_ sender: UIGestureRecognizer) {
        self.switchTab(from: self.activeItem, to: sender.view!.tag)
    }
    func switchTab(from: Int, to: Int) {
        self.deactivateTab(tab: from)
        self.activateTab(tab: to)
    }
    func activateTab(tab: Int) {
        let tabToActivate = self.subviews[tab]
        tabToActivate.backgroundColor = UIColor(named: "SWBacking")
        tabToActivate.layer.cornerRadius = 8
    DispatchQueue.main.async {
            UIView.animate(withDuration: 0.8, delay: 0.0, options: [.curveEaseIn, .allowUserInteraction], animations: {
                tabToActivate.setNeedsLayout()
                tabToActivate.layoutIfNeeded()
            })
            self.itemTapped?(tab)
        }
        self.activeItem = tab
    }
    func deactivateTab(tab: Int) {
        let inactiveTab = self.subviews[tab]
        inactiveTab.backgroundColor = UIColor(named: "SWBackground")

        let layersToRemove = inactiveTab.layer.sublayers!.filter({ $0.name == "active border" })
    DispatchQueue.main.async {
            UIView.animate(withDuration: 0.4, delay: 0.0, options: [.curveEaseIn, .allowUserInteraction], animations: {
                layersToRemove.forEach({ $0.removeFromSuperlayer() })
                inactiveTab.setNeedsLayout()
                inactiveTab.layoutIfNeeded()
            })
        }
    }
}
