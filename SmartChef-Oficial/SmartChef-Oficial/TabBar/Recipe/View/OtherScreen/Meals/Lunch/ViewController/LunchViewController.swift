import Foundation
import UIKit

class LunchViewController: UIViewController {
    
    var lunch: LunchScreen?
    var dataLunch: [LunchRecipe] =
    
    [
        LunchRecipe(nameImage: "lasanha"),
        LunchRecipe(nameImage: "coxinha"),
        LunchRecipe(nameImage: "costela"),
        LunchRecipe(nameImage: "strogonoff"),
        LunchRecipe(nameImage: "bolinhodearroz"),
        
    ]
    
    override func loadView() {
        self.lunch = LunchScreen()
        self.view = lunch
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        lunch?.collectionDelegate(delegate: self, dataSource: self)
        self.lunch?.configTextFieldDelegate(delegate: self)
        self.lunch?.delegate(delegate: self)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lunch?.tfSearchRecipe.resignFirstResponder()
    }
}

extension LunchViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
}

extension LunchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataLunch.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LunchCollectionViewCell.identifier, for: indexPath) as? LunchCollectionViewCell
        cell?.setupCell(data: dataLunch[indexPath.row])
        
        return cell ?? UICollectionViewCell()
    }
}

extension LunchViewController: LunchScreenProtocol{
    
    func actionBackButton() {
        
        self.navigationController?.popViewController(animated: true)
    }
}
