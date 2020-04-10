//
//  HeroClass.swift
//  CPHeroesRPG
//
//  Created by Egor on 30.03.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import Foundation

class Hero {
    
    var name = ""
    var heroClass: String = "crusader"
    
    var maxHP = 10
    var dodge = 0
    var accurancy = 80
    var protection = 0
    var speed = 1
    var crit = 3
    var minDmg = 1
    var maxDmg = 5
    //Base init
    init(name: String, heroClass: String) {
        self.name = name
        self.heroClass = heroClass
    }
    //Init for waking up from DB
    init(hero: HeroModel) {
        
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
        
    }
    
    
}
