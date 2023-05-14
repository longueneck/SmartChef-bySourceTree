import UIKit

class RecipeViewController: UIViewController {
    
    var recipeViewModel: RecipeViewModel = RecipeViewModel()
    var homeScreen: RecipeScreen?
    var wrapperView: WrapperViewAnimation?
    var discover: DiscoverViewController?
    
    override func loadView() {
        self.homeScreen = RecipeScreen()
        self.view = self.homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 255/255, green: 230/255, blue: 181/255, alpha: 1)
        setInitialConfigs()
        setTableViewDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        homeScreen?.addIngredientTextField.resignFirstResponder()
    }
    
    func setTableViewDelegate(){
        homeScreen?.addTableViewDelegate(delegate: self, dataSource: self)
        homeScreen?.setupCategoriesTableViewDelegate(delegate: self, dataSource: self)
    }
    
    func setInitialConfigs() {
        homeScreen?.addIngredientTextField.delegate = self
        homeScreen?.delegate(delegate: self)
        guard let screen = homeScreen else { return }
        wrapperView = WrapperViewAnimation(target: screen.addIngredientTextField)
    }
}

extension RecipeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch tableView {
        case homeScreen?.searchedTableView:
            homeScreen?.addIngredientTextField.text = ""
            homeScreen?.removeSearchTableView()
            recipeViewModel.addSelectedIngredient(indexPath: indexPath)
            homeScreen?.insertedIngredientTableView.reloadData()
            print(recipeViewModel.countSelectedIngredients())
            break
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case homeScreen?.searchedTableView:
            return recipeViewModel.countIngredientSearch()
        default:
            return recipeViewModel.countSelectedIngredients()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case homeScreen?.searchedTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: SearchTextField.identifier, for: indexPath) as? SearchTextField
            cell?.searchedIngredientLabel.text = recipeViewModel.loadCurrentIngredientSearch(indexPath: indexPath)
            return cell ?? UITableViewCell()
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: IngredientsTableViewCell.identifier, for: indexPath) as? IngredientsTableViewCell
            cell?.buttonTwo.tag = indexPath.row
            cell?.ingredientsCellProtocol = self
            cell?.lbIngredients.text = recipeViewModel.loadCurrentNameIngredient(indexPath: indexPath)
            return cell ?? UITableViewCell()
        }
    }
}

extension RecipeViewController: InsertedIngredientsViewCellProtocol{
    
    func removeIngredients(index: Int) {
        recipeViewModel.deleteSelectedIngredient(index: index)
        homeScreen?.insertedIngredientTableView.reloadData()
    }
}

extension RecipeViewController: UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == " " && textField == homeScreen?.addIngredientTextField {    
            return false
        }
        
        guard let text = textField.text else { return false }
        let updatedText = (text as NSString).replacingCharacters(in: range, with: string)
        homeScreen?.removeSearchTableView()
        print(updatedText)
        if !updatedText.isEmpty {
            homeScreen?.addSearchTableView()
            recipeViewModel.filterIngredients(with: updatedText)
            homeScreen?.searchedTableView.reloadData()
        }
        return true
    }

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

extension RecipeViewController: RecipeScreenProtocol{
    func goToSearch(){
        let enviaDados = recipeViewModel.getAllSelectedIngredientsAsString()
        
        let discoverVM = DiscoverViewModel(selectedIngredients: enviaDados)
        let discoverVC = DiscoverViewController()
        discoverVM.selectedIngredients = enviaDados
        discoverVC.viewModel = discoverVM
        
        navigationController?.pushViewController(discoverVC, animated: true)
    }
}
