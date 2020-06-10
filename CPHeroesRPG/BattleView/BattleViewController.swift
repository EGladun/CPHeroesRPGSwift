//
//  BattleViewController.swift
//  CPHeroesRPG
//
//  Created by Egor on 19.04.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import UIKit
import Bond

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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configScreen()
        self.configObservers()
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
        
        self.updateEnemy()
        
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
                print("You win")
                self.goldBag += gold
            } else {
                print("You loose")
            }
        }
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
    
    func goBack(alert: UIAlertAction!){
        self.navigationController?.popViewController(animated: true)
    }
    
}
