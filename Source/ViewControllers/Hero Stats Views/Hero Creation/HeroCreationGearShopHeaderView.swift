//
//  HeroCreationGearShopHeaderView.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/10/21.
//

import Foundation
import UIKit


class HeroCreationGearShopHeaderView: UIView {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var headerImageView: UIImageView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadAndShowNib()
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadAndShowNib()
        setupView()
    }
    
    func setupView() {
        
    }
    
}
