//
//  NewHeroViewController.swift
//  CPHeroesRPG
//
//  Created by Egor on 10.04.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import UIKit
import Realm
import RealmSwift
import Bond

class NewHeroViewController: UIViewController {
    @IBOutlet var portraitView: UIImageView!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var classChooser: UISegmentedControl!
    @IBOutlet weak var saveHeroBtn: UIButton!
    
    var choosedClass: String = "crusader"
    let realm = try! Realm()
    var lastId: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configView()
        
    }
    
    func configView() {
        self.nameField.delegate = self
        self.nameField.reactive.text.observeNext { (text) in
            if text == ""{
                self.title = "Creating new hero"
            } else {
                self.title = "Creating \(text ?? "")..."
            }
        }
        
        self.nameField.reactive.text.observeNext { (name) in
            if name!.count > 0 {
                self.saveHeroBtn.isEnabled = true
            } else {
                self.saveHeroBtn.isEnabled = false
            }
        }
        self.saveHeroBtn.reactive.tap.observeNext {
            self.saveHero()
        }
        
        self.portraitView.image = UIImage(named: "crusader")
        self.classChooser.addTarget(self, action: #selector(self.switchImage), for: .valueChanged)
    }
    
    @objc func switchImage() {
        switch self.classChooser.selectedSegmentIndex {
        case 0:
            self.choosedClass = "crusader"
            self.portraitView.image = UIImage(named: "crusader")
        case 1:
            self.choosedClass = "leaper"
            self.portraitView.image = UIImage(named: "leaper")
        case 2:
            self.choosedClass = "plagueDoctor"
            self.portraitView.image = UIImage(named: "plagueDoctor")
        default:
            print("Error")
        }
    }
    
    func saveHero(){
        let newHero = Hero(name: self.nameField.text!, heroClass: self.choosedClass, lastId: self.lastId)

        let currentHero = HeroModel()
        currentHero.id = newHero.id
        currentHero.name = newHero.name
        currentHero.heroClass = newHero.heroClass
        currentHero.maxHP = newHero.maxHP
        currentHero.dodge = newHero.dodge
        currentHero.accurancy = newHero.accurancy
        currentHero.protection = newHero.protection
        currentHero.speed = newHero.speed
        currentHero.crit = newHero.crit
        currentHero.minDmg = newHero.minDmg
        currentHero.maxDmg = newHero.maxDmg
        currentHero.maxHP = newHero.maxHP
        currentHero.gold = newHero.gold
        currentHero.lvlCounter = newHero.lvlCounter

        try! realm.write {
            realm.add(currentHero)
            print("added")
        }

        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveHero(_ sender: Any) {
//        if self.nameField.text != "" {
//            let newHero = Hero(name: self.nameField.text!, heroClass: self.choosedClass, lastId: self.lastId)
//
//            let currentHero = HeroModel()
//            currentHero.id = newHero.id
//            currentHero.name = newHero.name
//            currentHero.heroClass = newHero.heroClass
//            currentHero.maxHP = newHero.maxHP
//            currentHero.dodge = newHero.dodge
//            currentHero.accurancy = newHero.accurancy
//            currentHero.protection = newHero.protection
//            currentHero.speed = newHero.speed
//            currentHero.crit = newHero.crit
//            currentHero.minDmg = newHero.minDmg
//            currentHero.maxDmg = newHero.maxDmg
//            currentHero.maxHP = newHero.maxHP
//            currentHero.gold = newHero.gold
//            currentHero.lvlCounter = newHero.lvlCounter
//
//            try! realm.write {
//                realm.add(currentHero)
//                print("added")
//            }
//
//            self.navigationController?.popViewController(animated: true)
//
//
//        } else {
//            let alert = UIAlertController(title: "Error", message: "Enter hero's name", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
//        }
//
//
    }
    
    
}

// MARK: - Extensions
extension NewHeroViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

