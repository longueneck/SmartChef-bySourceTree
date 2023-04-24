import Foundation
import UIKit

class DessertViewController: UIViewController {
    
    var dessert: DessertScreen?
    var dataDessert: [DessertRecipe] =
    
    [
        DessertRecipe(nameImage: "lasanha"),
        DessertRecipe(nameImage: "coxinha"),
        DessertRecipe(nameImage: "costela"),
        DessertRecipe(nameImage: "strogonoff"),
        DessertRecipe(nameImage: "bolinhodearroz"),
        
    ]
    
    override func loadView() {
        self.dessert = DessertScreen()
        self.view = dessert
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        dessert?.collectionDelegate(delegate: self, dataSource: self)
        self.dessert?.configTextFieldDelegate(delegate: self)
        self.dessert?.delegate(delegate: self)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dessert?.tfSearchRecipe.resignFirstResponder()
    }
}

extension DessertViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }

}

extension DessertViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataDessert.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DessertCollectionViewCell.identifier, for: indexPath) as? DessertCollectionViewCell
        cell?.setupCell(data: dataDessert[indexPath.row])
        
        return cell ?? UICollectionViewCell()
    }
}

extension DessertViewController: DessertScreenProtocol{
    
    func actionBackButton() {
        
        self.navigationController?.popViewController(animated: true)
    }
}
