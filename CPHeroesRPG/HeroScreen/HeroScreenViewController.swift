//
//  HeroScreenViewController.swift
//  CPHeroesRPG
//
//  Created by Egor on 10.04.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import UIKit

class HeroScreenViewController: UIViewController {
    @IBOutlet var classLabel: UILabel!
    @IBOutlet var maxHPLabel: UILabel!
    @IBOutlet var dodgeLabel: UILabel!
    @IBOutlet var accurancyLabel: UILabel!
    @IBOutlet var protectionLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    @IBOutlet var critLabel: UILabel!
    @IBOutlet var damageLabel: UILabel!
    @IBOutlet var heroPortrait: UIImageView!
    
    var hero: Hero?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.hero?.name
        self.configLabels()
        
    }
    
    func configLabels(){
        self.classLabel.text = "Class: " + self.hero!.heroClass
        self.maxHPLabel.text = "Max HP: " + String(self.hero!.maxHP)
        self.dodgeLabel.text = "Dodge: " + String(self.hero!.dodge)
        self.accurancyLabel.text = "Accurancy: " + String(self.hero!.accurancy)
        self.protectionLabel.text = "Protection: " + String(self.hero!.protection)
        self.speedLabel.text = "Speed: " + String(self.hero!.speed)
        self.critLabel.text = "Crit: " + String(self.hero!.crit) + "%"
        self.damageLabel.text = "Damage: " + String(self.hero!.minDmg) + " - " + String(self.hero!.maxDmg)
        switch self.hero!.heroClass {
        case "crusader":
            self.heroPortrait.image = UIImage(named: "crusader")
        case "leaper":
            self.heroPortrait.image = UIImage(named: "leaper")
        case "plagueDoctor":
            self.heroPortrait.image = UIImage(named: "plagueDoctor")
        default:
            print("hmm")
        }
    }


}
