//
//  SWGearTableViewHeaderView.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 8/31/21.
//

import Foundation
import UIKit


class SWGearTableViewHeaderView: UIView {
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    
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
