import Foundation
import UIKit

class DiscoverViewController: UIViewController{
    
    var discoverScreen: DiscoverScreen?
    
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
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiscoverCollectionViewCell", for: indexPath) as! DiscoverCollectionViewCell
        cell.configShadow()
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



