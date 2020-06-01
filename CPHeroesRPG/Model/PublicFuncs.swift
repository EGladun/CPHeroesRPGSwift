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
    print("kill:", heroKillCoef, " turns")
    let heroDeathCoef: Double = Double(heroDefence) / Double(enemyPower)
    print("Death:",heroDeathCoef, " turns")
    
    let onePercent = (heroKillCoef + heroDeathCoef) / 100
    let percent = heroDeathCoef / onePercent
    print(percent)
    
    return percent.rounded(toPlaces: 2)
}

func battle(percent: Double){
    
}

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
