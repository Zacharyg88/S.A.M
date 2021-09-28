//
//  HeroCreationRaceTableViewCell.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/4/21.
//

import UIKit

class HeroCreationRaceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var raceImageView: UIImageView!
    @IBOutlet weak var raceTitleLabel: UILabel!
    @IBOutlet weak var disclosureImageView: UIImageView!

    var hostVC: HeroCreationRaceView?
    var hasSelectedRace: Bool = false
    override func awakeFromNib() {
        super.awakeFromNib()
        let selectRaceTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectRaceTapped))
        self.disclosureImageView.isUserInteractionEnabled = true
        self.disclosureImageView.addGestureRecognizer(selectRaceTap)
        self.disclosureImageView.tintColor = .white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .clear
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0))
    }
    
    @objc func selectRaceTapped() {
        hostVC?.currentRace = self.raceTitleLabel.text
        hostVC?.layoutCellsForSelection()
    }
    
}
