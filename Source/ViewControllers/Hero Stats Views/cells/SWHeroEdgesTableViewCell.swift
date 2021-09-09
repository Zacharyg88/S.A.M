//
//  SWHeroEdgesTableViewCell.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/7/21.
//

import UIKit
protocol edgeSelectionDelegate {
    func didSelectEdge(edge: EdgeModel)
    func didDeSelectEdge(edge: EdgeModel)
}

class SWHeroEdgesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var edgeLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    var delegate: edgeSelectionDelegate?
    var hasSelectedEdge: Bool = false
    var cellEdge: EdgeModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func selectEdgeTapped(_ sender: Any) {
        if !hasSelectedEdge {
            self.delegate?.didSelectEdge(edge: self.cellEdge ?? EdgeModel())
            self.addButton.setImage(UIImage(named: "icon_minus_button"), for: UIControl.State())
            self.hasSelectedEdge = true
            self.backgroundColor = UIColor(named: "SWPower_Light")
        }else {
            self.delegate?.didDeSelectEdge(edge: self.cellEdge ?? EdgeModel())
            self.addButton.setImage(UIImage(named: "icon_plus_button"), for: UIControl.State())
            self.hasSelectedEdge = false
            self.backgroundColor = UIColor(named: "SWStrength_Vigor")
        }
    }
    
}
