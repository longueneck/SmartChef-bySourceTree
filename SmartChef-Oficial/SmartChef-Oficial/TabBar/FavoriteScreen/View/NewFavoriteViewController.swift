import UIKit

protocol HomeViewControllerProtocol: AnyObject{
    func navToScreen()
}

class NewFavoriteViewController: UIViewController{
    
    weak private var delegate: HomeViewControllerProtocol?
    private var homeViewModel: NewFavoriteViewModel = NewFavoriteViewModel()
    
    var recipe: NewFavoriteScreen?
    var wrapperView: WrapperViewAnimation?
    var stackView: DrinksStackView = DrinksStackView()
    var drinkViewModel: DrinkRecipeStackViewModel = DrinkRecipeStackViewModel()
    var loading: Loading?
           
    
    
    var randomRecipes: [Recipes] = []
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        setupInitialView()
    }
    
    override func loadView() {
        self.recipe = NewFavoriteScreen()
        self.view = recipe
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .whiteBase
        
        recipe?.setTableViewDelegate(delegate: self, dataSource: self)
        recipe?.searchRecipeTextField.delegate = self
        inicializeConfigs()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        recipe?.searchRecipeTextField.resignFirstResponder()
    }
    
    func setupInitialView() {
        randomRecipes = homeViewModel.generateRandomRecipes()
        var indexPath = IndexPath(item: 0, section: 0)
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

extension NewFavoriteViewController: UITextFieldDelegate {
    
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

extension NewFavoriteViewController: thirdTableViewCellProtocol{
    func tapToMain() {
        delegate?.navToScreen()
    }
}

extension NewFavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 300
        case 1:
            return 45
        case 2:
            return 170
        case 3:
            return 150
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        switch indexPath.row {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: RandomRecipeTableViewCell.identifier, for: indexPath) as? RandomRecipeTableViewCell ?? UITableViewCell()
            break
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: InsertIngredientsTableViewCell.identifier, for: indexPath) as? InsertIngredientsTableViewCell ?? UITableViewCell()
            break
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: RandomDrinksTableViewCell.identifier, for: indexPath) as? RandomDrinksTableViewCell ?? UITableViewCell()
            break
        default:
            cell = UITableViewCell()
            break
        }
        return cell
    }
}

extension NewFavoriteViewController: firstUITableViewCellProtocol {
    func goToAhotherView() {
        navigationController?.pushViewController(HotMealsViewController(), animated: true)
    }
}

