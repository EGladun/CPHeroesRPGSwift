//
//  HeroScreenViewController.swift
//  CPHeroesRPG
//
//  Created by Egor on 10.04.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import UIKit
import RealmSwift
import Bond
import ReactiveKit

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
    let realm = try! Realm()
    var heroes: Results<HeroModel>!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configLabels()
        self.configObserves()
        self.createEnemies()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.heroes = realm.objects(HeroModel.self)
        for hero in heroes {
            if hero.id == self.hero!.id {
                self.hero = Hero(hero: hero)
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.saveToRealm()
    }
    
    func configObserves(){
        self.hero!.gold.observeNext { (gold) in
            if gold < (self.lvlUpCost * self.hero!.lvlCounter) {
                self.lvlUpButton.isHidden = true
            } else {
                self.lvlUpButton.isHidden = false
            }
        }
    }
    
    func createEnemies(){
        for _ in 1...9 {
            let newEnemy = Enemy(heroLevel: self.hero!.lvlCounter)
            self.enemyArray.append(newEnemy)
        }
        boss = ArchEnemy(heroLevel: self.hero!.lvlCounter)
    }
    
    func saveToRealm(){
        let currentHero = HeroModel()
        currentHero.id = self.hero!.id
        currentHero.name = self.hero!.name
        currentHero.heroClass = self.hero!.heroClass
        currentHero.maxHP = self.hero!.maxHP
        currentHero.dodge = self.hero!.dodge
        currentHero.accurancy = self.hero!.accurancy
        currentHero.protection = self.hero!.protection
        currentHero.speed = self.hero!.speed
        currentHero.crit = self.hero!.crit
        currentHero.minDmg = self.hero!.minDmg
        currentHero.maxDmg = self.hero!.maxDmg
        currentHero.maxHP = self.hero!.maxHP
        currentHero.gold = self.hero!.gold.value
        currentHero.lvlCounter = self.hero!.lvlCounter
        
        try! realm.write {
            for hero in heroes{
                if hero.id == currentHero.id{
                    realm.delete(hero)
                    realm.add(currentHero)
                }
            }
        }
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
        self.goldLabel.text = "Gold: " + String(self.hero!.gold.value)
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

    @IBAction func levelUp(_ sender: Any) {
        if self.hero!.gold.value >= (self.lvlUpCost * self.hero!.lvlCounter) {
            self.hero!.gold.receive(self.hero!.gold.value - (self.lvlUpCost * self.hero!.lvlCounter))
            self.hero!.lvlUp()
            self.configLabels()
        }
    }
    
    @IBAction func plusGold(_ sender: Any) {
        self.hero!.gold.receive(self.hero!.gold.value + 100)
        self.configLabels()
    }
    
    @IBAction func toBattle(_ sender: Any) {
        let nextVC = BattleViewController()
        nextVC.enemies = self.enemyArray
        nextVC.boss = self.boss
        nextVC.hero = self.hero
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
