//
//  EnemyClass.swift
//  CPHeroesRPG
//
//  Created by Egor on 19.04.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import Foundation

class Enemy {
    
    var name = ""
    var type: EnemyType?
    var maxHP = 0
    var dodge = 0
    var accurancy = 80
    var protection = 0
    var speed = 1
    var crit = 3
    var minDmg = 1
    var maxDmg = 5
    
    init(heroLevel: Int) {
        let type = Int.random(in: 1...3)
        self.maxHP += 10 * heroLevel
        switch type {
        case 1:
            self.type = .skeleton
            self.name = "skeleton"
            
            self.dodge += 3 * heroLevel
            self.accurancy += 5 * heroLevel
            self.crit += 5 * heroLevel
            
        case 2:
            self.type = .zombie
            self.name = "zombie"
            
            self.maxHP += 10 * heroLevel
            self.protection += 10 * heroLevel
            self.maxDmg += 5 * heroLevel
            
        case 3:
            self.type = .ghost
            self.name = "ghost"
            
            self.maxHP -= 5 * heroLevel
            self.dodge += 20 * heroLevel
            self.speed += 10 * heroLevel
        default:
            self.type = .zombie
        }
        
    }
    
}

enum EnemyType {
    case skeleton
    case zombie
    case ghost
}
