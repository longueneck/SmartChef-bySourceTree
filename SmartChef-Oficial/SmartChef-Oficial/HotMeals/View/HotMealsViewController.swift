import Foundation
import UIKit

class HotMealsViewController: UIViewController {
    
    var hotMeal: HotMealScreen?
    var dataHotMeal: [HotRecipes] = []
   
    override func loadView() {
        self.hotMeal = HotMealScreen()
        self.view = hotMeal
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        hotMeal?.collectionDelegate(delegate: self, dataSource: self)
        self.hotMeal?.delegate(delegate: self)
    }
   
}

extension HotMealsViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }

}

extension HotMealsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataHotMeal.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotMealsCollectionViewCell.identifier, for: indexPath) as? HotMealsCollectionViewCell
        cell?.setupCell(data: dataHotMeal[indexPath.row])
        
        return cell ?? UICollectionViewCell()
    }
}

extension HotMealsViewController: HotMealScreenProtocol{
    
    func actionBackButton() {
        
        self.navigationController?.popViewController(animated: true)
    }
}
