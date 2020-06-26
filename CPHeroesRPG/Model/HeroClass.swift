//
//  HeroClass.swift
//  CPHeroesRPG
//
//  Created by Egor on 30.03.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import Foundation
import Bond

class Hero {
    
    static var lastId: Int = 0
    
    var name = ""
    var heroClass: String = "crusader"
    var id: Int
    
    var maxHP = 10
    var dodge = 0
    var accurancy = 80
    var protection = 0
    var speed = 1
    var crit = 3
    var minDmg = 1
    var maxDmg = 5
    var gold = Observable<Int>(0)
    var lvlCounter = 1
    //Base init
    init(name: String, heroClass: String) {
        self.id = Hero.lastId
        self.name = name
        self.heroClass = heroClass
        switch heroClass {
        case "crusader":
            self.protection += 20
        case "leaper":
            self.dodge += 10
        case "plagueDoctor":
            self.accurancy += 20
        default:
            print("here")
        }
    }
    //Init for waking up from DB
    init(hero: HeroModel) {
        
        self.id = hero.id
        self.name = hero.name
        self.heroClass = hero.heroClass
        self.dodge = hero.dodge
        self.maxHP = hero.maxHP
        self.accurancy = hero.accurancy
        self.protection = hero.protection
        self.speed = hero.speed
        self.crit = hero.crit
        self.minDmg = hero.minDmg
        self.maxDmg = hero.maxDmg
        self.gold.receive(hero.gold)
        self.lvlCounter = hero.lvlCounter
        
    }
    
    func lvlUp(lvlUpCost: Int) {
        self.maxHP += 5
        self.protection += 5
        self.minDmg += 3
        self.maxDmg += 3
        self.crit += 2
        self.speed += 1
        self.accurancy += 3
        self.dodge += 3
        
        switch self.heroClass {
        case "crusader":
            self.protection += 5
            self.maxDmg += 3
        case "leaper":
            self.dodge += 5
            self.speed += 1
        case "plagueDoctor":
            self.accurancy += 3
            self.crit += 3
        default:
            break
        }
        
        self.lvlCounter += 1
        self.gold.receive(self.gold.value - (lvlUpCost * (self.lvlCounter - 1)))
    }
    
    
}
