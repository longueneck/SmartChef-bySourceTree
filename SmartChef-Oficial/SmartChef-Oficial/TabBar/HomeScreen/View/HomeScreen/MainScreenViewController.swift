import UIKit

class MainScreenViewController: UIViewController {
    
    var viewModel: MainScreeViewModel = MainScreeViewModel()
    var mainScreen: MainScreen?
    var wrapperView: WrapperViewAnimation?
    
    override func loadView() {
        self.mainScreen = MainScreen()
        self.view = self.mainScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 255/255, green: 230/255, blue: 181/255, alpha: 1)
        inicializeConfigs()
        setTableViewDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        mainScreen?.addIngredientLabel.resignFirstResponder()
    }
    
    func setTableViewDelegate(){
        mainScreen?.addTableViewDelegate(delegate: self, dataSource: self)
        mainScreen?.setupCategoriesTableViewDelegate(delegate: self, dataSource: self)
    }
    
    func inicializeConfigs() {
        mainScreen?.addIngredientLabel.delegate = self
        mainScreen?.delegate(delegate: self)
        guard let screen = mainScreen else { return }
        wrapperView = WrapperViewAnimation(target: screen.addIngredientLabel)
    }
}

//===================================================================================================================================
//MARK: EXTENSIONS TableView
extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch tableView {
        case mainScreen?.searchedTableView:
            mainScreen?.addIngredientLabel.text = ""
            mainScreen?.removeSearchTableView()
            viewModel.addSelectedIngredient(indexPath: indexPath)
            mainScreen?.insertedIngredientTableView.reloadData()
            print(viewModel.countSelectedIngredients())
            break
        default:
            break
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case mainScreen?.searchedTableView:
            return viewModel.countIngredientSearch()
        default:
            return viewModel.countSelectedIngredients()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case mainScreen?.searchedTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: SearchedFieldTableView.identifier, for: indexPath) as? SearchedFieldTableView
            cell?.searchedItem.text = viewModel.loadCurrentIngredientSearch(indexPath: indexPath)
            return cell ?? UITableViewCell()
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: IngredientsTableViewCell.identifier, for: indexPath) as? IngredientsTableViewCell
            cell?.buttonTwo.tag = indexPath.row
            cell?.ingredientsCellProtocol = self
            cell?.lbIngredients.text = viewModel.loadCurrentNameIngredient(indexPath: indexPath)
            return cell ?? UITableViewCell()
        }
    }
}

//===================================================================================================================================
//MARK: EXTENSIONS CELULA da TableView
extension MainScreenViewController: IngredientsTableViewCellProtocol{
    
    func removeIngredients(index: Int) {
        viewModel.deleteSelectedIngredient(index: index)
        mainScreen?.insertedIngredientTableView.reloadData()
    }
}

//===================================================================================================================================
//MARK: EXTENSIONS TextField Delegate
extension MainScreenViewController: UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text as? NSString else { return false }
        let txtAfterUpdate = text.replacingCharacters(in: range, with: string)
        mainScreen?.removeSearchTableView()
        print(txtAfterUpdate)
        if !txtAfterUpdate.isEmpty {
            mainScreen?.addSearchTableView()
            viewModel.filterIngredients(with: txtAfterUpdate)
            mainScreen?.searchedTableView.reloadData()
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

//==================================================================================================================================
//MARK: EXTENSIONS TextField Delegate
extension MainScreenViewController: MainScreenProtocol{
    func goToSearch(){
        navigationController?.pushViewController(DiscoverViewController(), animated: true)
    }
}
