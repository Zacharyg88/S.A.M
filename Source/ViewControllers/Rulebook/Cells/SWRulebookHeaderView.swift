//
//  SWRulebookHeaderView.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/29/21.
//

import Foundation
import UIKit


class SWRulebookHeaderView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var disclosureButton: UIButton!
    
    
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
