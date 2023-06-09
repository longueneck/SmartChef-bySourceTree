import UIKit
import OSLog

class RecipeViewController: UIViewController{
    
    var recipeViewModel: RecipeViewModel = RecipeViewModel()
    var screen: RecipeScreen?
    var wrapperView: WrapperViewAnimation?
    var discover: DiscoverViewController?
    
    override func loadView() {
        self.screen = RecipeScreen()
        self.view = self.screen
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 255/255, green: 230/255, blue: 181/255, alpha: 1)
        setInitialConfigs()
        setTableViewDelegate()
        recipeViewModel.callAlertControllError = self.errorAPI(_:)
        recipeViewModel.ingredientDATA()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        screen?.addIngredientTextField.resignFirstResponder()
    }
    
    func setTableViewDelegate(){
        screen?.addTableViewDelegate(delegate: self, dataSource: self)
        screen?.setupCategoriesTableViewDelegate(delegate: self, dataSource: self)
    }
    
    func setInitialConfigs() {
        screen?.addIngredientTextField.delegate = self
        screen?.delegate(delegate: self)
        guard let screen = screen else { return }
        wrapperView = WrapperViewAnimation(target: screen.addIngredientTextField)
    }
    

    public func errorAPI(_ error: Error){
        print(error)
        let osLog = OSLog(subsystem: "KevinLongue", category: "RecipeViewController")
        os_log("Teste xereca", log: osLog)
        
        DispatchQueue.main.async {
            
#if DEBUG
            let alert: UIAlertController = UIAlertController(title: "API Error", message: error.localizedDescription, preferredStyle: .alert)
#else
            let alert: UIAlertController = UIAlertController(title: "Poxa Vida", message: "Parece que o Chef está dormindo agora 😴", preferredStyle: .alert)
#endif
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }

    
}

extension RecipeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch tableView {
        case screen?.searchedTableView:
            screen?.addIngredientTextField.text = ""
            screen?.removeSearchTableView()
            recipeViewModel.addSelectedIngredient(indexPath: indexPath)
            screen?.insertedIngredientTableView.reloadData()
            print(recipeViewModel.countSelectedIngredients())
            break
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch tableView {
        case screen?.searchedTableView:
            return recipeViewModel.countIngredientSearch()
        default:
            return recipeViewModel.countSelectedIngredients()
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case screen?.searchedTableView:
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
        screen?.insertedIngredientTableView.reloadData()
    }
}

extension RecipeViewController: UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == " " && textField == screen?.addIngredientTextField {
            return false
        }
        
        guard let text = textField.text else { return false }
        let updatedText = (text as NSString).replacingCharacters(in: range, with: string)
        screen?.removeSearchTableView()
        print(updatedText)
        if !updatedText.isEmpty {
            screen?.addSearchTableView()
            recipeViewModel.filterIngredients(with: updatedText)
            screen?.searchedTableView.reloadData()
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
