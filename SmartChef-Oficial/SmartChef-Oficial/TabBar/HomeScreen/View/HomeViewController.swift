import Foundation
import UIKit


protocol HomeViewControllerProtocol: AnyObject{
    func navToScreen()
}

enum CellType: Int {
    case category = 0
    case mostVisited = 1
    case chooseIngredients = 2
    case recomendDrinks = 3
    
    var identifier: String {
        switch self {
        case .category: return CategoryTableViewCell.identifier
        case .mostVisited: return MostVisitedTableViewCell.identifier
        case .chooseIngredients: return ChooseIngredientsTableViewCell.identifier
        case .recomendDrinks: return RecommendDrinkTableViewCell.identifier
        }
    }
    
    var size: CGFloat {
        switch self {
        case .category: return 130
        case .mostVisited: return 200
        case .chooseIngredients: return 45
        case .recomendDrinks: return 170
        }
    }
}

class HomeViewController: UIViewController{
    
    weak private var delegate: HomeViewControllerProtocol?
    private var homeViewModel: HomeViewModel = HomeViewModel()
    
    var recipe: HomeScreen?
    var wrapperView: WrapperViewAnimation?
    var stackView: DrinksStackView = DrinksStackView()
    var drinkViewModel: DrinkRecipeStackViewModel = DrinkRecipeStackViewModel()
    
     var randomRecipes: [Recipes] = []
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        setupInitialView()
    }
    
    override func loadView() {
        self.recipe = HomeScreen()
        self.view = recipe
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        recipe?.setTableViewDelegate(delegate: self, dataSource: self)
        recipe?.searchRecipeTextField.delegate = self
        inicializeConfigs()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        recipe?.searchRecipeTextField.resignFirstResponder()
    }
    
    func setupInitialView() {
        randomRecipes = homeViewModel.generateRandomRecipes()
    }
    
    func inicializeConfigs() {
        recipe?.searchRecipeTextField.delegate = self
        guard let screen = recipe else { return }
        wrapperView = WrapperViewAnimation(target: screen.searchRecipeTextField)
    }
    
    func setupDelegate(delegate: HomeViewControllerProtocol){
        self.delegate = delegate
    }
}

extension HomeViewController: UITextFieldDelegate{
        
    func textFieldDidBeginEditing(_ textField: UITextField) {
        wrapperView?.startANimation()
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        wrapperView?.reverseAnimation()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let text = textField.text, !text.isEmpty {
            textField.text = ""
        }
        return true
    }
}

extension HomeViewController: thirdTableViewCellProtocol{
    func tapToMain() {
        delegate?.navToScreen()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4  }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        guard let celltype = CellType(rawValue: indexPath.row) else {return CGFloat()}
        return celltype.size
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let celltype = CellType(rawValue: indexPath.row) else {return UITableViewCell()}
        
        let cell = tableView.dequeueReusableCell(withIdentifier: celltype.identifier, for: indexPath)
        
        if let cell = cell as? CategoryTableViewCell {
            cell.categoryDelegate = self
        }
        
        if let cell = cell as? MostVisitedTableViewCell {
            cell.mostVisitedDelegate = self
        }
        
        return cell
    }
}

extension HomeViewController: CategoryTableViewCellProtocol{
    func tapToCategoryScreen() {
        navigationController?.pushViewController(HotMealsViewController(), animated: true)
    }
}

extension HomeViewController: MostVisitedTableViewCellProtocol {
    func tapToMostVisitedScreen() {
        self.navigationController?.pushViewController(PrepairViewController(), animated: true)
    }
}

