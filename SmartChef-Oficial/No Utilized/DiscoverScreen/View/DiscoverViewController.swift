import UIKit

class DiscoverViewController: UIViewController{
    
    
    var discoverScreen: DiscoverScreen?
    var viewModel: DiscoverViewModel?
  
    override func loadView() {
        self.discoverScreen = DiscoverScreen()
        self.view = self.discoverScreen
        self.view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        discoverScreen?.delegate(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        discoverScreen?.addCollectionProtocol(delegate: self, dataSource: self)
    }
}

extension DiscoverViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return viewModel?.selectedArray()?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscoverCollectionViewCell.identifier, for: indexPath) as? DiscoverCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configShadow()
        cell.lbIngredients.text = viewModel?.selectedArray()?[indexPath.row] ?? ""
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width * 0.98, height: 100)
    }
}

extension DiscoverViewController: DiscoverScreenProtocol{
    func backToPage() {
        navigationController?.popViewController(animated: true)
    }
}




