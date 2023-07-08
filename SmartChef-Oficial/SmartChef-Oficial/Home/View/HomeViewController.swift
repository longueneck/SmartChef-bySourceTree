import UIKit


class HomeViewController: UIViewController{
    
    var screen: HomeScreen?
    var loading: Loading?
    var emptyState: EmptyStateView?
    var viewModel: HomeViewModel = HomeViewModel()
    var wrapperView: WrapperViewAnimation?
    var segmentControl: UISegmentedControl?
    
    override func loadView() {
        self.screen = HomeScreen()
        self.view = self.screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightYellow
        setInitialConfigs()
        setTableViewDelegate()
        viewModel.callAlertControllError = self.errorAPI(_:)
        viewModel.ingredientDATA()
        loading = Loading(viewController: self)
        screen?.delegate(delegate: self)
        
//        let willEat = screen?.segmentedControlValue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
//        screen?.searchButton.isEnabled = false
//        screen?.searchButton.alpha = 0.5
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
    
#warning("RESOLVER EMPTY STATE")
    func showEmptyState() {
        if emptyState == nil {
            emptyState = EmptyStateView(frame: (screen?.insertedIngredientTableView.bounds)!)
            emptyState?.imageView.image = UIImage(named: "logo")
            screen?.insertedIngredientTableView.addSubview(emptyState!)
            screen?.insertedIngredientTableView.separatorStyle = .none
        }
        emptyState?.isHidden = false
    }
    
    func hideEmptyState() {
        emptyState?.isHidden = true
        screen?.insertedIngredientTableView.separatorStyle = .singleLine
    }
    
    public func errorAPI(_ error: Error){
        print(error)
        DispatchQueue.main.async {
            
#if DEBUG
            let alert: UIAlertController = UIAlertController(title: .errorAPIDebug, message: error.localizedDescription, preferredStyle: .alert)
#else
            let alert: UIAlertController = UIAlertController(title: StringMagica.errorAPIRelease, message: .errorAPIReleaseMessage, preferredStyle: .alert)
#endif
            let okAction = UIAlertAction(title: .ok, style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch tableView {
        case screen?.searchedTableView:
            screen?.addIngredientTextField.text = ""
            screen?.removeSearchTableView()
            viewModel.addSelectedIngredient(indexPath: indexPath)
            screen?.insertedIngredientTableView.reloadData()
            break
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch tableView {
        case screen?.searchedTableView:
            return viewModel.countIngredientSearch()
        default:
            return viewModel.countSelectedIngredients()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case screen?.searchedTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: SearchTextField.identifier, for: indexPath) as? SearchTextField
            cell?.searchedIngredientLabel.text = viewModel.loadCurrentIngredientSearch(indexPath: indexPath)
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

extension HomeViewController: InsertedIngredientsViewCellProtocol{
    
    func removeIngredients(index: Int) {
        viewModel.deleteSelectedIngredient(index: index)
        screen?.insertedIngredientTableView.reloadData()
        showEmptyState()
    }
}

extension HomeViewController: UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == " " && textField == screen?.addIngredientTextField {
            return false
        }
        
        guard let text = textField.text else { return false }
        let updatedText = (text as NSString).replacingCharacters(in: range, with: string)
        screen?.removeSearchTableView()
        if !updatedText.isEmpty {
            screen?.addSearchTableView()
            viewModel.filterIngredients(with: updatedText)
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

 

extension HomeViewController: RecipeScreenProtocol {
    
    func goToSearch(people: String?) {
        
        let numberPeople = viewModel.getSelectedIndexSegmentControl(segmentControl: screen?.manyPeopleSegmentedControl.selectedSegmentIndex ?? 0)
        let numberOfTime = viewModel.getSelectedTimeToSlider(time: Int(screen?.howManyTimeSlider.value ?? 0))
        let myIngredients = viewModel.getAllSelectedIngredientsAsString()
        let myEletro = viewModel.setMySwitch(switchOne: screen?.mySwitch1.isOn ?? false, switchTwo: screen?.mySwitch2.isOn ?? false, switchThree:  screen?.mySwitch3.isOn ?? false, switchFour: screen?.mySwitch4.isOn ?? false, switchFive: screen?.mySwitch5.isOn ?? false, switchAll: screen?.mySwitchAll.isOn ?? false)
        let finalPharse = viewModel.getTotalPharse(people: numberPeople, time: numberOfTime, myIngredients: myIngredients, utens: myEletro)
      
        print(finalPharse)
        
        self.loading?.show(message: "Gerando Receita")
        
        let service = TextGPTService()

        service.generateRecipe(message: finalPharse) { response, error in
            if let responseText = response {
                DispatchQueue.main.async {
                    let responseAPIText = responseText.choices.first?.message.content ?? ""
                    let service2 = ImageGPTService()
                    let imageRequestAPI = "\(String.imagePharse), \(myIngredients), \(String.qualityImage), \(String.imageRule)"
                    service2.generateImage(message: imageRequestAPI) { response, error in
                        if let responseImage = response {
                            DispatchQueue.main.async {
                                let prepairVC = PrepairViewController()

                                prepairVC.recipeData = responseAPIText
                                prepairVC.recipeImage = responseImage.data.first?.url ?? ""

                                self.navigationController?.pushViewController(prepairVC, animated: true)
                                self.loading?.hide()
                            }
                        }else{
                            debugPrint(error ?? "")
                        }
                    }
                }
            }else{
                debugPrint(error ?? "")
            }
        }

    }
}
