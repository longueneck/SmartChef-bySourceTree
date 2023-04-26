import UIKit

class HomeScreenViewController: UIViewController {
    
    //MARK: Instancias
    var viewModel: HomeScreeViewModel = HomeScreeViewModel()
    var mainScreen: HomeScreen?
    var wrapperView: WrapperViewAnimation? //Instanciada
    
    //MARK: Carrega a tela
    override func loadView() {
        self.mainScreen = HomeScreen()
        self.view = self.mainScreen
    }
    
    //MARK: Carrega configs e elementos
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 255/255, green: 230/255, blue: 181/255, alpha: 1)
        inicializeConfigs()
        setTableViewDelegate()
    }
    
    func setTableViewDelegate(){
        mainScreen?.addTableViewDelegate(delegate: self, dataSource: self)
        mainScreen?.setupCategoriesTableViewDelegate(delegate: self, dataSource: self)
    }
    
    func inicializeConfigs() {
        mainScreen?.tfIngredients.delegate = self
        guard let screen = mainScreen else { return }
        wrapperView = WrapperViewAnimation(target: screen.tfIngredients)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        mainScreen?.tfIngredients.resignFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
}

//MARK: EXTENSIONS TableView
extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch tableView {
        case mainScreen?.searchTableView:
            mainScreen?.tfIngredients.text = ""
            mainScreen?.removeSearchTableView()
            viewModel.addSelectedIngredient(indexPath: indexPath)
            mainScreen?.tableView.reloadData()
            print(viewModel.countSelectedIngredients())
            break
        default:
            break
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case mainScreen?.searchTableView:
            return viewModel.countIngredientSearch()
        default:
            return viewModel.countSelectedIngredients()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case mainScreen?.searchTableView:
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

//MARK: EXTENSIONS CELULA da TableView
extension HomeScreenViewController: IngredientsTableViewCellProtocol{
    
    func removeIngredients(index: Int) {
        viewModel.deleteSelectedIngredient(index: index)
        mainScreen?.tableView.reloadData()
    }
}

//MARK: EXTENSIONS TextField Delegate
extension HomeScreenViewController: UITextFieldDelegate{

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text as? NSString else { return false }
        let txtAfterUpdate = text.replacingCharacters(in: range, with: string)
        mainScreen?.removeSearchTableView()
        print(txtAfterUpdate)
        if !txtAfterUpdate.isEmpty {
            mainScreen?.addSearchTableView()
            viewModel.filterIngredients(with: txtAfterUpdate)
            mainScreen?.searchTableView.reloadData()
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

//extension MainScreenViewController: MainScreenProtocol{
//    func goToSearch() {
//        navigationController?.pushViewController(DiscoverViewController(), animated: true)
//    }
//
//
//}


//EMPTY STATE
