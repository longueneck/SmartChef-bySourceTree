import Foundation
import UIKit

class BreakfastViewController: UIViewController {
    
    var breakfastMeal: BreakfastScreen?
    var dataBreakfast: [BreakfastRecipe] =
    
    [
        BreakfastRecipe(nameImage: "paoartesanal"),
        BreakfastRecipe(nameImage: "bolo"),
        BreakfastRecipe(nameImage: "mistoquente"),
        BreakfastRecipe(nameImage: "bolacha"),
        BreakfastRecipe(nameImage: "torrada"),
        
    ]
    
    override func loadView() {
        self.breakfastMeal = BreakfastScreen()
        self.view = breakfastMeal
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        breakfastMeal?.collectionDelegate(delegate: self, dataSource: self)
        self.breakfastMeal?.configTextFieldDelegate(delegate: self)
        
        //Dentro da viewDidLoad precisamos assinar o protocolo
        self.breakfastMeal?.delegate(delegate: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        breakfastMeal?.tfSearchRecipe.resignFirstResponder()
    }
    
}



extension BreakfastViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataBreakfast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BreakfastCollectionViewCell.identifier, for: indexPath) as? BreakfastCollectionViewCell
        cell?.setupCell(data: dataBreakfast[indexPath.row])
        
        return cell ?? UICollectionViewCell()
        
    }
    
}

extension BreakfastViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }

}

//Precisamos criar outra extension para assinar completamente o protocolo na ViewController
extension BreakfastViewController: BreakfastScreenProtocol{
    func actionBackButton() {
      
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
