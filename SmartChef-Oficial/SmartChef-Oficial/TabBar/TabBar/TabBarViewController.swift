import UIKit

class MyTabBarController: UITabBarController{
    
    enum indexView: Int {
        case recipes = 0
        case profile = 1
       
    }
    var home: HomeScreen?
    var recipes = HomeViewController()
    var profile = ProfileViewController(String())
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.setupTabBarController()
        self.view.backgroundColor = .lightYellow
        profile.setupDelegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.home?.searchedTableView.reloadData()
    }
    
    private func setupTabBarController(){
        
        let tela01 = UINavigationController(rootViewController: recipes)
        let tela02 = UINavigationController(rootViewController: profile)
        
        
        self.setViewControllers([tela01, tela02], animated: false)
        self.tabBar.backgroundColor = .yellowBase
        self.tabBar.unselectedItemTintColor = .brownBase
        self.tabBar.tintColor = .whiteBase
        self.tabBar.itemPositioning = .centered
        self.tabBar.isTranslucent = false
        self.tabBar.barTintColor = .whiteBase
        
        guard let items = tabBar.items else{return}
        
        items[indexView.recipes.rawValue].image = .bookFill
        items[indexView.recipes.rawValue].title = .caseRecipe

        items[indexView.profile.rawValue].image = .personFill
        items[indexView.profile.rawValue].title = .caseProfile
        
        self.selectedIndex = indexView.recipes.rawValue
    }
}

extension MyTabBarController: ProfileViewControllerProtocol{
    func tapCancel() {
        self.selectedIndex = indexView.recipes.rawValue
    }
    
    func tapSave() {
        self.selectedIndex = indexView.recipes.rawValue
    }
    
    func tapExit() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
