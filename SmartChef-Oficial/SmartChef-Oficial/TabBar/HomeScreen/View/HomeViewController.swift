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


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let spacing: CGFloat = 25 // Define o espaçamento desejado entre as células
        return UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: spacing)
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let cellWidth = screenWidth * 0.75
        let height = collectionView.frame.height
        return CGSize(width: cellWidth, height: height)
        
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeScreenCollectionViewCell.identifier, for: indexPath) as? RecipeScreenCollectionViewCell
        cell?.setupCell(recipe: randomRecipes[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
}

extension HomeViewController: RecipeStackViewProtocol{
    func tapGoToTypeRecipe(_ sender: MyCustomButton){
        
     
//        navigationController?.pushViewController(vc, animated: true)
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
        if indexPath.row == 0{
            return 130
        }
        if indexPath.row == 1{
            return 200
        }
        if indexPath.row == 2{
            return 45
        }
        if indexPath.row == 3{
            return 170
        }
        if indexPath.row == 4{
            return 150
        }
            return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        switch indexPath.row {
        case 0:
            if let cell2 = tableView.dequeueReusableCell(withIdentifier: FirstUITableViewCell.identifier, for: indexPath) as? FirstUITableViewCell {
                
                cell2.delegate = self
                return cell2
            }
                        
                
            
            
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "secondUITableViewCell", for: indexPath) as? secondUITableViewCell ?? UITableViewCell()
            break
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "thirdUITableViewCell", for: indexPath) as? thirdUITableViewCell ?? UITableViewCell()
            break
        case 3:
            cell = tableView.dequeueReusableCell(withIdentifier: "fourthUITableViewCell", for: indexPath) as? fourthUITableViewCell ?? UITableViewCell()
            break
        case 4:
            cell = tableView.dequeueReusableCell(withIdentifier: "fifthUITableViewCell", for: indexPath) as? fourthUITableViewCell ?? UITableViewCell()
            break
        default:
            cell = UITableViewCell()
            break
        }

        return cell
        
    }
}

extension HomeViewController: FirstUITableViewCellProtocol{
    func goToAnotherScreen() {
        navigationController?.pushViewController(HotMealsViewController(), animated: true)
    }
    
    
}

