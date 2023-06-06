
import UIKit

class PrepairViewController: UIViewController {
    
    var prepair: PrepairScreen?
    var dataHotMeal: [PrepairRecipes] = []
   
    override func loadView() {
        self.prepair = PrepairScreen()
        self.view = prepair
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepair?.collectionDelegate(delegate: self, dataSource: self)
        
        self.view.backgroundColor = .white
    }
    
    
}

extension PrepairViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PrepairCollectionViewCell.identifier, for: indexPath) as? PrepairCollectionViewCell
//        cell?.setupCell(data: dataHotMeal[indexPath.row])
        cell?.recipePrepairImage.image = UIImage(named: "expresso.jpg")
        
        return cell ?? UICollectionViewCell()
    }
    
    
}
