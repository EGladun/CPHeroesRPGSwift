//
//  MainMenuController.swift
//  CPHeroesRPG
//
//  Created by Egor on 30.03.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import Foundation
import UIKit

class MainMenuController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Main menu"
        
    }
    @IBAction func heroesListButton(_ sender: Any) {
        let nextVC = HeroesViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
