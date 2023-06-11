import UIKit

class MyTabBarController: UITabBarController{
    
    enum indexView: Int {
        case recipes = 0
        case favorite = 1
        case profile = 2
    }
    
    var recipes = HomeViewController()
    var favorite = NewFavoriteViewController()
    var profile = ProfileViewController()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.setupTabBarController()
        self.view.backgroundColor = .lightYellow
        profile.setupDelegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setupTabBarController(){
        
        let tela01 = UINavigationController(rootViewController: recipes)
        let tela02 = UINavigationController(rootViewController: favorite)
        let tela03 = UINavigationController(rootViewController: profile)
        
        self.setViewControllers([tela01, tela02, tela03], animated: false)
        self.tabBar.backgroundColor = .yellowBase
        self.tabBar.unselectedItemTintColor = .brownBase
        self.tabBar.tintColor = .whiteBase
        self.tabBar.itemPositioning = .centered
        self.tabBar.isTranslucent = false
        self.tabBar.barTintColor = .whiteBase
        
        guard let items = tabBar.items else{return}
        
        items[indexView.recipes.rawValue].image = .bookFill
        items[indexView.recipes.rawValue].title = .caseRecipe
        
        items[indexView.favorite.rawValue].image = .heartFill
        items[indexView.favorite.rawValue].title = .caseFavorite
        
        items[indexView.profile.rawValue].image = .personFill
        items[indexView.profile.rawValue].title = .caseProfile
        
        self.selectedIndex = indexView.recipes.rawValue
    }
}

extension MyTabBarController: HomeViewControllerProtocol{
    
    func navToScreen() {
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
