//
//  HeroCreationEdgesTableViewSectionHeaderView.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/7/21.
//

import Foundation
import UIKit

class HeroCreationEdgesTableViewSectionHeaderView: UIView {
    
    @IBOutlet weak var headerLabel: UILabel!
    
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
