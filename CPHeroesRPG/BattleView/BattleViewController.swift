//
//  BattleViewController.swift
//  CPHeroesRPG
//
//  Created by Egor on 19.04.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import UIKit
import Bond
import Realm
import RealmSwift

class BattleViewController: UIViewController {
    
    @IBOutlet var heroPortrait: UIImageView!
    @IBOutlet var enemyView: UIImageView!
    @IBOutlet var percentLabel: UILabel!
    @IBOutlet weak var concedeButton: UIButton!
    @IBOutlet weak var battleButton: UIButton!
    
    var enemies: [Enemy] = []
    var boss: ArchEnemy = ArchEnemy(heroLevel: 1)
    var hero: Hero?
    var takenGold: Int?
    var goldBag: Int = 0
    let realm = try! Realm()
    var heroes: Results<HeroModel>!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configScreen()
        self.configObservers()
        self.createEnemies()
        self.updateEnemy()
    }
    
    func configScreen(){
        
        self.title = "Battle"
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        switch self.hero?.heroClass {
        case "crusader":
            self.heroPortrait.image = UIImage(named: "crusader")
        case "leaper":
            self.heroPortrait.image = UIImage(named: "leaper")
        case "plagueDoctor":
            self.heroPortrait.image = UIImage(named: "plagueDoctor")
        default:
            print("error")
        }
        self.heroes = realm.objects(HeroModel.self)
        
    }
    
    func configObservers(){
        self.concedeButton.reactive.tap.observeNext { (tap) in
            let alert = UIAlertController(title: "Concede", message: "Are you sure?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: self.goBack(alert:)))
            alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        self.battleButton.reactive.tap.observeNext { (tap) in
            guard let gold = self.takenGold else { return }
            if gold > 0 {
                self.goldBag += gold
                let alert = UIAlertController(title: "You won", message: "+\(gold) gold for you", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Yay", style: .default, handler: self.win(alert:)))
                self.present(alert, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "You loose", message: "Omae wa mou shindeiru", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Nani?", style: .default, handler: self.death(alert:)))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func createEnemies(){
        for _ in 1...9 {
            let newEnemy = Enemy(heroLevel: self.hero!.lvlCounter)
            self.enemies.append(newEnemy)
        }
        self.boss = ArchEnemy(heroLevel: self.hero!.lvlCounter)
    }
    
    func updateEnemy(){
        switch self.enemies.first?.name {
        case "zombie":
            self.enemyView.image = UIImage(named: "zombie")
        case "skeleton":
            self.enemyView.image = UIImage(named: "skeleton")
        case "ghost":
            self.enemyView.image = UIImage(named: "ghost")
        default:
            self.enemyView.image = UIImage(named: "zombie")
        }
        
        let percent = winPercent(hero: self.hero!, enemy: self.enemies.first!)
        self.percentLabel.text = "Your chance of winning is \(percent)%"
        
        self.takenGold = battle(percent: percent)
        
    }
    
    func win(alert: UIAlertAction!){
        self.enemies.removeFirst()
        self.updateEnemy()
    }
    
    func goBack(alert: UIAlertAction!){
        self.hero!.gold.receive(self.hero!.gold.value + self.goldBag)
        self.saveToRealm()
        self.navigationController?.popViewController(animated: true)
    }
    
    func death(alert: UIAlertAction!){
        try! realm.write {
            for hero in self.heroes{
                if hero.id == self.hero!.id{
                    realm.delete(hero)
                }
            }
        }
        self.navigationController?.popToRootViewController(animated: true)
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
    
}
