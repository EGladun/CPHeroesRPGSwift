//
//  ArchEnemyClass.swift
//  CPHeroesRPG
//
//  Created by Egor on 19.04.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import Foundation

class ArchEnemy: Enemy {
    
    var bossType: ArchEnemyType?
    
    override init(heroLevel: Int) {
        super.init(heroLevel: heroLevel)
        let type = Int.random(in: 1...3)
        self.maxHP += 30
        switch type {
        case 1:
            self.bossType = .overLord
            
            self.dodge += 3 * heroLevel
            self.accurancy += 5 * heroLevel
            self.crit += 5 * heroLevel
            
        case 2:
            self.bossType = .zombieBugai
            
            self.maxHP += 10 * heroLevel
            self.protection += 10 * heroLevel
            self.maxDmg += 5 * heroLevel
            
        case 3:
            self.bossType = .banshee
            
            self.maxHP += 5 * heroLevel
            self.dodge += 20 * heroLevel
            self.speed += 10 * heroLevel
            
        default:
            break
        }
    }
    
}

enum ArchEnemyType {
    case overLord
    case zombieBugai
    case banshee
}
