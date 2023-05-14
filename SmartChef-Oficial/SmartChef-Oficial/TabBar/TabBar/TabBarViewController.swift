import UIKit

class MyTabBarController: UITabBarController{
    
    var mainScreen = RecipeViewController()
    var recipes = HomeViewController()
    var favorite = FavoriteViewController()
    var profile = ProfileViewController()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.setupTabBarController()
        self.view.backgroundColor = UIColor(red: 255/255, green: 230/255, blue: 181/255, alpha: 1)
        profile.setupDelegate(delegate: self)
        mainScreen.setupDelegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setupTabBarController(){
        
        let tela01 = UINavigationController(rootViewController: mainScreen )
        let tela02 = UINavigationController(rootViewController: recipes)
        let tela03 = UINavigationController(rootViewController: favorite)
        let tela04 = UINavigationController(rootViewController: profile)
        
        self.setViewControllers([tela01, tela02, tela03, tela04], animated: false)
        self.tabBar.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        self.tabBar.unselectedItemTintColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        self.tabBar.tintColor = .white
        self.tabBar.itemPositioning = .centered
        self.tabBar.isTranslucent = false
        self.tabBar.barTintColor = .white
      
        
        guard let items = tabBar.items else{return}
        
        items[0].image = UIImage(systemName: "house.fill")
        items[0].title = "Home"
        
        items[1].image = UIImage(systemName: "book.fill")
        items[1].title = "Receitas"
        
        items[2].image = UIImage(systemName: "bookmark.fill")
        items[2].title = "Favoritos"
        
        items[3].image = UIImage(systemName: "person.fill")
        items[3].title = "Perfil"
        
        self.selectedIndex = 0
    }
    
}

extension MyTabBarController: RecipeViewControllerProtocol{
    
    func navToScreen() {
        self.selectedIndex = 0
    }
}

extension MyTabBarController: ProfileViewControllerProtocol{
    func tapCancel() {
        self.selectedIndex = 0
    }
    
    func tapSave() {
        self.selectedIndex = 0
    }
    
    func tapExit() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
