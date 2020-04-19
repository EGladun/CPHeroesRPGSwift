//
//  HereModel.swift
//  CPHeroesRPG
//
//  Created by Egor on 30.03.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import Foundation
import RealmSwift

class HeroModel: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var heroClass: String = ""
    @objc dynamic var maxHP: Int = 0
    @objc dynamic var dodge: Int = 0
    @objc dynamic var accurancy: Int = 0
    @objc dynamic var protection: Int = 0
    @objc dynamic var speed: Int = 0
    @objc dynamic var crit: Int = 0
    @objc dynamic var minDmg: Int = 0
    @objc dynamic var maxDmg: Int = 0
    @objc dynamic var gold: Int = 0
    @objc dynamic var lvlCounter: Int = 0
}
