import Foundation
import UIKit

class SnackViewController: UIViewController {
    
    var snack: SnackScreen?
    var dataSnack: [SnackRecipe] =
    
    [
        SnackRecipe(nameImage: "lasanha"),
        SnackRecipe(nameImage: "coxinha"),
        SnackRecipe(nameImage: "costela"),
        SnackRecipe(nameImage: "strogonoff"),
        SnackRecipe(nameImage: "bolinhodearroz"),
        
    ]
    
    override func loadView() {
        self.snack = SnackScreen()
        self.view = snack
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        snack?.collectionDelegate(delegate: self, dataSource: self)
        self.snack?.configTextFieldDelegate(delegate: self)
        self.snack?.delegate(delegate: self)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        snack?.tfSearchRecipe.resignFirstResponder()
    }
}

extension SnackViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }

}

extension SnackViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSnack.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SnackCollectionViewCell.identifier, for: indexPath) as? SnackCollectionViewCell
        cell?.setupCell(data: dataSnack[indexPath.row])
        
        return cell ?? UICollectionViewCell()
    }
}

extension SnackViewController: SnackScreenProtocol{
    
    func actionBackButton() {
        
        self.navigationController?.popViewController(animated: true)
    }
}
