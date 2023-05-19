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
    
    private var randomRecipes: [Recipes] = []
    
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
        recipe?.collectionDelegate(delegate: self, dataSource: self)
        recipe?.delegate(delegate: self)
        recipe?.stack1.delegate(delegate: self)
        recipe?.tfSearchRecipe.delegate = self
        inicializeConfigs()
        drinkImage()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        recipe?.tfSearchRecipe.resignFirstResponder()
    }
    
    func setupInitialView() {
        randomRecipes = homeViewModel.generateRandomRecipes()
        let indexPath = IndexPath(item: 0, section: 0)
        recipe?.collectionRecipe.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        recipe?.collectionRecipe.reloadData()
    }
        
    
    func drinkImage(){
        
        guard let subviews = self.recipe?.stack2.subviews else {
            return
        }
        
        for index in 0..<subviews.count where ((subviews[index] as? UIButton) != nil) {
            let button = subviews[index] as! UIButton
            let image = drinkViewModel.getAllDrinkRecipes(index: index).image
            button.setImage(UIImage(named: image), for: .normal)
        }
    }
    
    func inicializeConfigs() {
        recipe?.tfSearchRecipe.delegate = self
        guard let screen = recipe else { return }
        wrapperView = WrapperViewAnimation(target: screen.tfSearchRecipe)
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

//MARK: EXTENSIONS Protocolo de Button Action
extension HomeViewController: HomeScreenProtocol{
    func tapToMain() {
        delegate?.navToScreen()
    }
    
    
}


