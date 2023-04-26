import Foundation
import UIKit

class DiscoverViewController: UIViewController{
    
    var discoverScreen: DiscoverScreen?
    var viewModel: DiscoverViewModel = DiscoverViewModel()
    
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
        return viewModel.getListImages()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscoverCollectionViewCell.identifier, for: indexPath) as? DiscoverCollectionViewCell
        cell?.setupCell(image: viewModel.getListCell(index: indexPath.row))
        return cell ?? UICollectionViewCell()
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



