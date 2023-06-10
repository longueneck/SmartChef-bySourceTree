import UIKit

class MyTabBarController: UITabBarController{
    
    enum indexView: Int {
        case home = 0
        case recipes = 1
        case favorite = 2
        case profile = 3
    }
    
    var mainScreen = HomeViewController()
    var recipes = RecipeViewController()
    var favorite = FavoriteViewController()
    var profile = ProfileViewController()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.setupTabBarController()
        self.view.backgroundColor = .lightYellow
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
        self.tabBar.backgroundColor = .yellowBase
        self.tabBar.unselectedItemTintColor = .brownBase
        self.tabBar.tintColor = .whiteBase
        self.tabBar.itemPositioning = .centered
        self.tabBar.isTranslucent = false
        self.tabBar.barTintColor = .whiteBase
        
        guard let items = tabBar.items else{return}
        
        items[indexView.home.rawValue].image = .houseFill
        items[indexView.home.rawValue].title = .caseHome
              
        items[indexView.recipes.rawValue].image = .bookFill
        items[indexView.recipes.rawValue].title = .caseRecipe
              
        items[indexView.favorite.rawValue].image = .heartFill
        items[indexView.favorite.rawValue].title = .caseFavorite
              
        items[indexView.profile.rawValue].image = .personFill
        items[indexView.profile.rawValue].title = .caseProfile
              
        self.selectedIndex = indexView.home.rawValue
              }
              }
              
              extension MyTabBarController: HomeViewControllerProtocol{
            
            func navToScreen() {
                self.selectedIndex = indexView.home.rawValue
            }
        }
              
              extension MyTabBarController: ProfileViewControllerProtocol{
            func tapCancel() {
                self.selectedIndex = indexView.home.rawValue
            }
            
            func tapSave() {
                self.selectedIndex = indexView.home.rawValue
            }
            
            func tapExit() {
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
