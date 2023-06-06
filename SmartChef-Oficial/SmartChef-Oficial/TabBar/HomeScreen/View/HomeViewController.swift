import Foundation
import UIKit

protocol HomeViewControllerProtocol: AnyObject{
    func navToScreen()
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
        let indexPath = IndexPath(item: 0, section: 0)
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
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 130
        }
        if indexPath.row == 1{
            return 230
        }
        if indexPath.row == 2{
            return 45
        }
        if indexPath.row == 3{
            return 170
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        switch indexPath.row {
        case 0:
            if let cell2 = tableView.dequeueReusableCell(withIdentifier: firstUITableViewCell.identifier, for: indexPath) as? firstUITableViewCell {
                
                cell2.delegate = self
                return cell2
            }
            break
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: secondUITableViewCell.identifier, for: indexPath) as? secondUITableViewCell ?? UITableViewCell()
            break
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: thirdUITableViewCell.identifier, for: indexPath) as? thirdUITableViewCell ?? UITableViewCell()
            break
        case 3:
            cell = tableView.dequeueReusableCell(withIdentifier: fourthUITableViewCell.identifier, for: indexPath) as? fourthUITableViewCell ?? UITableViewCell()
            break
        default:
            cell = UITableViewCell()
            break
        }
        return cell
    }
}

extension HomeViewController: firstUITableViewCellProtocol{
    func goToAhotherView() {
        navigationController?.pushViewController(HotMealsViewController(), animated: true)
    }
}

