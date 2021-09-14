//
//  SWHeroConditionActionCollectionViewCell.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/13/21.
//

import UIKit

class SWHeroConditionActionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 12
    }

}
