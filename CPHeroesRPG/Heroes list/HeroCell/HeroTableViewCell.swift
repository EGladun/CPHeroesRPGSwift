//
//  HeroTableViewCell.swift
//  CPHeroesRPG
//
//  Created by Egor on 30.03.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import UIKit

class HeroTableViewCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var classLabel: UILabel!
    @IBOutlet var heroImage: UIImageView!
    @IBOutlet weak var lvlLabel: UILabel!
    
    
    var thisHero: Hero?
    
    
    func awakeFromNib(hero: Hero) {
        super.awakeFromNib()
        
        self.thisHero = hero
        
        self.nameLabel.text = hero.name
        self.classLabel.text = hero.heroClass
        self.lvlLabel.text = String(hero.lvlCounter)
        switch hero.heroClass{
        case "crusader":
            self.heroImage.image = UIImage(named: "crusader")
        case "leaper":
            self.heroImage.image = UIImage(named: "leaper")
        case "plagueDoctor":
            self.heroImage.image = UIImage(named: "plagueDoctor")
        default:
            print("here")
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
