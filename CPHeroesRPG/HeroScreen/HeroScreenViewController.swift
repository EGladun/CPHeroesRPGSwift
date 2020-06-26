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
    @IBOutlet weak var costLabel: UILabel!
    
    var hero: Hero?
    let lvlUpCost = 10
    var enemyArray: [Enemy] = []
    var boss: ArchEnemy = ArchEnemy(heroLevel: 1)
    let realm = try! Realm()
    var heroes: Results<HeroModel>!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configLabels()
        self.lvlUpButton.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.heroes = realm.objects(HeroModel.self)
        for hero in heroes {
            if hero.id == self.hero!.id {
                self.hero = Hero(hero: hero)
            }
        }
        self.configObserves()
        self.configLabels()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
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
        self.costLabel.text = String(self.lvlUpCost * self.hero!.lvlCounter)
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
            self.hero!.lvlUp(lvlUpCost: self.lvlUpCost)
            self.configLabels()
        }
    }
    
    @IBAction func plusGold(_ sender: Any) {
        self.hero!.gold.receive(self.hero!.gold.value + 100)
        self.configLabels()
    }
    
    @IBAction func toBattle(_ sender: Any) {
        let nextVC = BattleViewController()
        nextVC.hero = self.hero
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func postRequest(_ sender: Any) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        let parameters = ["name": self.hero?.name,
                          "heroClass":self.hero?.heroClass,
                          "maxHP": self.hero?.maxHP
            ] as [String : Any]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {return}
        request.httpBody = httpBody
        let session = URLSession.shared
        session.dataTask(with: request){ (data, response, error) in
            if let response = response{
                print(response)
            }
            
            guard let data = data else {return}
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error)
            }
        }.resume()
    }
}
