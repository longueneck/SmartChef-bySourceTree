import Foundation
import UIKit

protocol RecipeViewControllerProtocol: AnyObject{
    
    func navToScreen()
}

class RecipeViewController: UIViewController{
    
    weak private var delegate: RecipeViewControllerProtocol?
    
    func setupDelegate(delegate: RecipeViewControllerProtocol){
        self.delegate = delegate
    }

    var viewModel: RecipeViewModel = RecipeViewModel()
    var wrapperView: WrapperViewAnimation?
    var recipe: RecipeScreen?
    
    override func loadView() {
        self.recipe = RecipeScreen()
        self.view = recipe
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        recipe?.collectionDelegate(delegate: self, dataSource: self)
        recipe?.delegate(delegate: self)
        recipe?.stack1.delegate(delegate: self)
        recipe?.tfSearchRecipe.delegate = self
        inicializeConfigs()
    }
    
    func inicializeConfigs() {
        recipe?.tfSearchRecipe.delegate = self
        guard let screen = recipe else { return }
        wrapperView = WrapperViewAnimation(target: screen.tfSearchRecipe)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        recipe?.tfSearchRecipe.resignFirstResponder()
    }
}

extension RecipeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeScreenCollectionViewCell.identifier, for: indexPath) as? RecipeScreenCollectionViewCell
        cell?.setupCell(data: viewModel.listRecipes[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    

}


extension RecipeViewController: RecipeStackViewProtocol{
    func goToHot() {
        let vc = HotMealsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToBreakfast() {
        let vc = BreakfastViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToLunch() {
        let vc = SnackViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToSnack() {
        let vc = LunchViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToDessert() {
        let vc = DessertViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

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
extension RecipeViewController: RecipeScreenProtocol{
    func tapToMain() {
        delegate?.navToScreen()
    }
    
    
}
