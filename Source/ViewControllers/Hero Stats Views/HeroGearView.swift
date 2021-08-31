//
//  HeroGearView.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 8/30/21.
//

import Foundation
import UIKit

class HeroGearView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var weapons: [WeaponModel] = []
    var armor: [ArmorModel] = []
    var shields: [ShieldModel] = []
    var items: [ItemModel] = []
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadAndShowNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadAndShowNib()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return weapons.count
        case 1:
            return (armor.count + shields.count)
        default:
            return items.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
}
