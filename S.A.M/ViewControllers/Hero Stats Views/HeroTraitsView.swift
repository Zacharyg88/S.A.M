//
//  HeroTraitsView.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 8/26/21.
//

import Foundation
import UIKit

class HeroTraitsView: UIView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadAndShowNib()
        setupViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadAndShowNib()
        setupViews()
    }
    
    
    func setupViews() {
        
    }
    
}
