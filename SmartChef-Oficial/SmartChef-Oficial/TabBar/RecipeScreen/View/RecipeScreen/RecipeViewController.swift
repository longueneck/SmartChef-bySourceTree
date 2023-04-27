import Foundation
import UIKit

    //MARK: Protocolo do Botao
protocol RecipeViewControllerProtocol: AnyObject{
    
    func navToScreen()
}

class RecipeViewController: UIViewController{
    
    weak private var delegate: RecipeViewControllerProtocol?
    func setupDelegate(delegate: RecipeViewControllerProtocol){
        self.delegate = delegate
    }
    
    //MARK: Instanciando
    var wrapperView: WrapperViewAnimation?
    var recipe: RecipeScreen?
    private var recipeViewModel: RecipeViewModel = RecipeViewModel()
    var stackView: DrinksStackView = DrinksStackView()
    var drinkViewModel: DrinkRecipeStackViewModel = DrinkRecipeStackViewModel()

    
    //MARK: Carregando a tela
    override func loadView() {
        self.recipe = RecipeScreen()
        self.view = recipe
    }
    
    //MARK: Carrega configs e elementos
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
    
    func drinkImage(){
        
        guard let subviews = self.recipe?.stack2.subviews else {
            print("Deu merda")
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        recipe?.tfSearchRecipe.resignFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
}

extension RecipeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipeViewModel.countRecipes()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeScreenCollectionViewCell.identifier, for: indexPath) as? RecipeScreenCollectionViewCell
        if let image = UIImage(named: recipeViewModel.loadCurrentRecipeSearch(indexPath: indexPath)) {
            cell?.picture.image = image
        }
        return cell ?? UICollectionViewCell()
    }
}

//MARK: EXTENSIONS StackView
extension RecipeViewController: RecipeStackViewProtocol{
    func tapGoToTypeRecipe(_ sender: MyCustomButton){
        var vc = HotMealsViewController()
        vc.dataHotMeal =
        [
            HotRecipes(nameImage: "lasanha"),
            HotRecipes(nameImage: "coxinha"),
            HotRecipes(nameImage: "costela"),
            HotRecipes(nameImage: "strogonoff"),
            HotRecipes(nameImage: "bolinhodearroz"),
            
        ]
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: EXTENSIONS TextFieldDelegate
extension RecipeViewController: UITextFieldDelegate{
        
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
extension RecipeViewController: RecipeScreenProtocol{
    func tapToMain() {
        delegate?.navToScreen()
    }
    
    
}


