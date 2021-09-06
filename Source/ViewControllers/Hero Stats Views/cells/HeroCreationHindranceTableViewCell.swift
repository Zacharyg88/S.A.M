//
//  HeroCreationHindranceTableViewCell.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/4/21.
//

import UIKit

class HeroCreationHindranceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var disclosureImageView: UIImageView!

    var row: Int = 0
    var hostVC: HeroCreationHindrancesView?
    override func awakeFromNib() {
        super.awakeFromNib()
        let selectHindranceTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(addHindranceTapped))
        self.disclosureImageView.isUserInteractionEnabled = true
        self.disclosureImageView.addGestureRecognizer(selectHindranceTap)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func addHindranceTapped() {
        self.hostVC?.addHindrance(row: self.row)
        self.disclosureImageView.image = UIImage(named: "icon_minus")
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor(named: "SWBlue_Light")?.cgColor
    }
    
}
