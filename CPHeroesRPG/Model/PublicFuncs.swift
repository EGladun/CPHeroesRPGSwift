//
//  PublicFuncs.swift
//  CPHeroesRPG
//
//  Created by Egor on 17.05.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import Foundation

func winPercent(hero: Hero, enemy: Enemy) -> Double{
    let heroPower = (hero.minDmg + hero.maxDmg) / 2 * (1 + (hero.crit / 100))
    let heroDefence = hero.maxHP * (1 + (hero.dodge / 100)) * (1 + (hero.protection / 100))
    
    let enemyPower = (enemy.minDmg + enemy.maxDmg) / 2 * (1 + (enemy.crit / 100))
    let enemyDefence = enemy.maxHP * (1 + (enemy.dodge / 100)) * (1 + (enemy.protection / 100))
    
    let heroKillCoef: Double = Double(enemyDefence) / Double(heroPower)
    print(heroKillCoef)
    let heroDeathCoef: Double = Double(heroDefence) / Double(enemyPower)
    print(heroDeathCoef)
    
    var percent: Double = (heroDeathCoef / heroKillCoef) * 100
    if percent > 100 {
        percent = 100
    }
    print(percent)
    
    return percent
}

func battle(percent: Double){
    
}
