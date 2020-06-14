var entities = [{
  "id": 1,
  "typeString": "class",
  "properties": [
    {
  "name": "var heroPortrait: UIImageView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var enemyView: UIImageView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var percentLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var concedeButton: UIButton!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var battleButton: UIButton!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var enemies: [Enemy]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var boss: ArchEnemy",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var hero: Hero?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var takenGold: Int?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var goldBag: Int",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "configScreen()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "configObservers()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "updateEnemy()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "goBack(alert: UIAlertAction!)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "BattleViewController",
  "superClass": 18
},{
  "id": 2,
  "typeString": "class",
  "methods": [
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "heroesListButton(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "MainMenuController",
  "superClass": 18
},{
  "id": 3,
  "typeString": "class",
  "properties": [
    {
  "name": "let tableView",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let identifier",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let nib",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var heroesArray: Results<HeroModel>!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let realm",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "viewWillAppear(_ animated: Bool)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "configTableView()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "configNavBar()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "newHero()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "deleteHero(alert: UIAlertAction!,identifier: Int)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "HeroesViewController",
  "superClass": 18,
  "extensions": [
    4
  ]
},{
  "id": 5,
  "typeString": "class",
  "properties": [
    {
  "name": "var nameLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var classLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var heroImage: UIImageView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var lvlLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var thisHero: Hero?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "awakeFromNib(hero: Hero)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "setSelected(_ selected: Bool, animated: Bool)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "HeroTableViewCell",
  "superClass": 19
},{
  "id": 6,
  "typeString": "enum",
  "cases": [
    {
  "name": "crusader case leaper case plagueDoctor"
}
  ],
  "name": "heroClassEnum"
},{
  "id": 7,
  "typeString": "class",
  "properties": [
    {
  "name": "var name",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var heroClass: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var id: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var maxHP",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var dodge",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var accurancy",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var protection",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var speed",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var crit",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var minDmg",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var maxDmg",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var gold",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var lvlCounter",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "lvlUp(lvlUpCost: Int)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(name: String, heroClass: String, lastId: Int)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(hero: HeroModel)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Hero"
},{
  "id": 8,
  "typeString": "class",
  "properties": [
    {
  "name": "var name",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var type: EnemyType?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var maxHP",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var dodge",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var accurancy",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var protection",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var speed",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var crit",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var minDmg",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var maxDmg",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "init(heroLevel: Int)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Enemy"
},{
  "id": 9,
  "typeString": "enum",
  "cases": [
    {
  "name": "skeleton case zombie case ghost"
}
  ],
  "name": "EnemyType"
},{
  "id": 10,
  "typeString": "class",
  "properties": [
    {
  "name": "var bossType: ArchEnemyType?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "init(heroLevel: Int)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ArchEnemy",
  "superClass": 8
},{
  "id": 11,
  "typeString": "enum",
  "cases": [
    {
  "name": "overLord case zombieBugai case banshee"
}
  ],
  "name": "ArchEnemyType"
},{
  "id": 12,
  "typeString": "class",
  "properties": [
    {
  "name": "var id: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var name: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var heroClass: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var maxHP: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var dodge: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var accurancy: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var protection: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var speed: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var crit: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var minDmg: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var maxDmg: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var gold: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var lvlCounter: Int",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "HeroModel",
  "superClass": 20
},{
  "id": 14,
  "typeString": "class",
  "properties": [
    {
  "name": "var window: UIWindow?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var navController: UINavigationController?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationWillResignActive(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationDidEnterBackground(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationWillEnterForeground(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationDidBecomeActive(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationWillTerminate(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    22
  ],
  "name": "AppDelegate",
  "superClass": 21
},{
  "id": 15,
  "typeString": "class",
  "properties": [
    {
  "name": "var classLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var maxHPLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var dodgeLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var accurancyLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var protectionLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var speedLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var critLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var damageLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var heroPortrait: UIImageView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var goldLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var lvlUpButton: UIButton!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var costLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var hero: Hero?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let lvlUpCost",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var enemyArray: [Enemy]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var boss: ArchEnemy",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let realm",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var heroes: Results<HeroModel>!",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "viewDidAppear(_ animated: Bool)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "viewWillDisappear(_ animated: Bool)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "configObserves()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "createEnemies()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "saveToRealm()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "configLabels()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "levelUp(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "plusGold(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "toBattle(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "HeroScreenViewController",
  "superClass": 18
},{
  "id": 16,
  "typeString": "class",
  "properties": [
    {
  "name": "var portraitView: UIImageView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var nameField: UITextField!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var classChooser: UISegmentedControl!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var saveHeroBtn: UIButton!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var choosedClass: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let realm",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var lastId: Int",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "configView()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "switchImage()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "saveHero()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "saveHero(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "NewHeroViewController",
  "superClass": 18,
  "extensions": [
    17
  ]
},{
  "id": 18,
  "typeString": "class",
  "name": "UIViewController"
},{
  "id": 19,
  "typeString": "class",
  "name": "UITableViewCell"
},{
  "id": 20,
  "typeString": "class",
  "name": "Object"
},{
  "id": 21,
  "typeString": "class",
  "name": "UIResponder"
},{
  "id": 22,
  "typeString": "protocol",
  "name": "UIApplicationDelegate"
},{
  "id": 23,
  "typeString": "protocol",
  "name": "UITableViewDelegate"
},{
  "id": 24,
  "typeString": "protocol",
  "name": "UITableViewDataSource"
},{
  "id": 25,
  "typeString": "class",
  "name": "Double",
  "extensions": [
    13
  ]
},{
  "id": 26,
  "typeString": "protocol",
  "name": "UITextFieldDelegate"
},{
  "id": 4,
  "typeString": "extension",
  "methods": [
    {
  "name": "tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    23,
    24
  ]
},{
  "id": 13,
  "typeString": "extension",
  "methods": [
    {
  "name": "rounded(toPlaces places:Int) -> Double",
  "type": "instance",
  "accessLevel": "internal"
}
  ]
},{
  "id": 17,
  "typeString": "extension",
  "methods": [
    {
  "name": "textFieldShouldReturn(_ textField: UITextField) -> Bool",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    26
  ]
}] 