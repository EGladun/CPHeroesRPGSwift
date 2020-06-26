//
//  ViewController.swift
//  CPHeroesRPG
//
//  Created by Egor on 27.03.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import UIKit
import RealmSwift

class HeroesViewController: UIViewController {
    
    let tableView = UITableView()
    let identifier = "HeroCell"
    let nib = UINib(nibName: "HeroTableViewCell", bundle: nil)
    var heroesArray: Results<HeroModel>!
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Heroes list"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.configTableView()
        self.configNavBar()
        self.tableView.reloadData()
    }
    
    func configTableView() {
        self.tableView.register(self.nib, forCellReuseIdentifier: self.identifier)
        self.tableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        self.tableView.reloadData()
    }
    
    func configNavBar() {
        self.navigationItem.setRightBarButton(UIBarButtonItem(title: "New", style: .plain, target: self, action: #selector(newHero)), animated: true)
    }
    
    // MARK: - METHODS FOR SELECTORS
    @objc func newHero() {
        let lastId = self.heroesArray.count
        let nextVC = NewHeroViewController()
        Hero.lastId = lastId
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func deleteHero(alert: UIAlertAction!,identifier: Int) {
        try! realm.write {
            for hero in heroesArray{
                if hero.id == heroesArray[identifier].id{
                    realm.delete(hero)
                    break
                }
            }
        }
        self.tableView.reloadData()
    }
    
}


// MARK: - TableView Extensions
extension HeroesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.heroesArray = realm.objects(HeroModel.self)
        if self.heroesArray.count != 0 {
            return self.heroesArray.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: self.identifier, for: indexPath) as! HeroTableViewCell
        let hero = Hero(hero: self.heroesArray[indexPath.row])
        cell.awakeFromNib(hero: hero)
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let hero = Hero(hero: self.heroesArray[indexPath.row])
        let nextVC = HeroScreenViewController()
        nextVC.hero = hero
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //Alert before deleting
            let alert = UIAlertController(title: "Delete hero", message: "Are you sure?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { (action) in
                self.deleteHero(alert: action, identifier: indexPath.row)
            }))
            alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
