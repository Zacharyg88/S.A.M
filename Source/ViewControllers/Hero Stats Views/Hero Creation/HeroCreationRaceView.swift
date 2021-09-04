//
//  HeroCreationRaceView.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/3/21.
//

import Foundation
import UIKit

class HeroCreationRaceView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var cardTitleLabel: UILabel!
    @IBOutlet weak var cardSubtitleLabel: UILabel!
    @IBOutlet weak var raceTableView: UITableView!
 
    
    var races = ruleBook.races.racesArray
    var hostVC: SWHeroCreationViewController?
    var currentRace: String?
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
        
        raceTableView.delegate = self
        raceTableView.dataSource = self
        raceTableView.register(UINib(nibName: "HeroCreationRaceTableViewCell", bundle: nil), forCellReuseIdentifier: "HeroCreationRaceTableViewCell")
        raceTableView.tableFooterView = UIView()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return races.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: HeroCreationRaceTableViewCell = tableView.dequeueReusableCell(withIdentifier: "HeroCreationRaceTableViewCell", for: indexPath) as? HeroCreationRaceTableViewCell {
            var race = races[indexPath.row]
            databaseManager.getImageFromStorage(imageName: race.imageLocation ?? "") { Image, error in
                if error != nil {
                    print("There was an error getting the image \(error)")
                }else {
                    cell.raceImageView.image = Image
                    cell.raceImageView.layer.cornerRadius = cell.raceImageView.frame.height / 2
                    cell.raceImageView.layer.borderWidth = 2
                    cell.raceImageView.layer.borderColor = UIColor(named: "SWButton_Border")?.cgColor
                }
            }
            cell.contentView.layer.borderWidth = 2
            cell.contentView.layer.borderColor = UIColor(named: "SWButton_Border")?.cgColor
            cell.raceTitleLabel.text = race.title
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let race = races[indexPath.row]
        self.currentRace = race.title
        let detailView: HeroObjectDetailsView = HeroObjectDetailsView(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY, width: self.hostVC?.view.frame.width ?? 0, height: UIScreen.main.bounds.height / 2))
        
        let raceImageView: UIImageView = UIImageView(frame: detailView.bannerView.frame)
        raceImageView.contentMode = .scaleAspectFill
        if let raceCell: HeroCreationRaceTableViewCell = tableView.cellForRow(at: indexPath) as? HeroCreationRaceTableViewCell {
            raceImageView.image = raceCell.raceImageView.image
            raceCell.contentView.layer.borderColor = UIColor(named: "SWBlue_Light")?.cgColor
        }
        
        detailView.bannerView.addSubview(raceImageView)
        detailView.bannerView.bringSubviewToFront(raceImageView)
        detailView.typeLabel.text = "Race"
        detailView.nameLabel.text = race.title
        detailView.leftHeader1.text = "Description"
        detailView.leftDescription1.text = race.generalDescription
        detailView.rightHeader1.isHidden = true
        detailView.rightDescription1.isHidden = true
        detailView.rightHeader2.isHidden = true
        detailView.rightDescription2.isHidden = true
        detailView.rightHeader3.isHidden = true
        detailView.rightDescription3.isHidden = true
        detailView.leftHeader2.isHidden = true
        detailView.leftDescription2.isHidden = true
        detailView.leftHeader3.isHidden = true
        detailView.leftDescription3.isHidden = true
        detailView.leftHeader4.isHidden = true
        detailView.leftDescription4.isHidden = true
        
        self.hostVC?.view.addSubview(detailView)
        self.hostVC?.view.bringSubviewToFront(detailView)
        UIView.animate(withDuration: 0.5) {
            detailView.frame = CGRect(x: 0, y: UIScreen.main.bounds.maxY / 2, width: self.hostVC?.view.frame.width ?? 0, height: UIScreen.main.bounds.height / 2)
        }



    }
    
    
}
