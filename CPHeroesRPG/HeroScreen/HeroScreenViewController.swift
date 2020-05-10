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
    @IBOutlet var goldLabel: UILabel!
    @IBOutlet var lvlUpButton: UIButton!
    
    var hero: Hero?
    let lvlUpCost = 10
    var enemyArray: [Enemy] = []
    var boss: ArchEnemy = ArchEnemy(heroLevel: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configLabels()
        self.createEnemies()
        
        
    }
    
    func createEnemies(){
        for _ in 1...9 {
            let newEnemy = Enemy(heroLevel: self.hero!.lvlCounter)
            self.enemyArray.append(newEnemy)
        }
        boss = ArchEnemy(heroLevel: self.hero!.lvlCounter)
    }
    
    func configLabels(){
        self.title = self.hero!.name + " lvl." + String(self.hero!.lvlCounter)
        self.classLabel.text = "Class: " + self.hero!.heroClass
        self.maxHPLabel.text = "Max HP: " + String(self.hero!.maxHP)
        self.dodgeLabel.text = "Dodge: " + String(self.hero!.dodge)
        self.accurancyLabel.text = "Accurancy: " + String(self.hero!.accurancy)
        self.protectionLabel.text = "Protection: " + String(self.hero!.protection)
        self.speedLabel.text = "Speed: " + String(self.hero!.speed)
        self.critLabel.text = "Crit: " + String(self.hero!.crit) + "%"
        self.damageLabel.text = "Damage: " + String(self.hero!.minDmg) + " - " + String(self.hero!.maxDmg)
        self.goldLabel.text = "Gold: " + String(self.hero!.gold)
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
        if self.hero!.gold < (self.lvlUpCost * self.hero!.lvlCounter) {
            self.lvlUpButton.isHidden = true
        } else {
            self.lvlUpButton.isHidden = false
        }
    }

    @IBAction func levelUp(_ sender: Any) {
        if self.hero!.gold >= (self.lvlUpCost * self.hero!.lvlCounter) {
            self.hero!.gold -= self.lvlUpCost * self.hero!.lvlCounter
            self.hero!.lvlUp()
            self.configLabels()
        }
    }
    
    @IBAction func plusGold(_ sender: Any) {
        self.hero!.gold += 100
        self.configLabels()
    }
    
    @IBAction func toBattle(_ sender: Any) {
        let nextVC = BattleViewController()
        nextVC.enemies = self.enemyArray
        nextVC.boss = self.boss
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
