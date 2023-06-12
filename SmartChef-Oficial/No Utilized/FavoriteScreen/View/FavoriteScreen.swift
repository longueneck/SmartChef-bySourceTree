import UIKit

class FavoriteScreen: UIView {
   
    lazy var view1: UIView = {
        let table = UIView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .yellowBase
        table.layer.cornerRadius = 20
        return table
    }()
    
    lazy var lbNamePage: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .brownBase
        name.font = .sugarFont24
        name.text = .favorite
        return name
    }()
    
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: CGRect.zero,collectionViewLayout: UICollectionViewLayout.init())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsVerticalScrollIndicator = false
        collection.backgroundColor = .clear
        collection.register(FavoriteCollectionViewCell.self, forCellWithReuseIdentifier: FavoriteCollectionViewCell.identifier)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collection.setCollectionViewLayout(layout, animated: false)
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        setupConstraints()
    }
    
    private func addSubViews() {
        self.addSubview(self.view1)
        self.addSubview(self.lbNamePage)
        self.addSubview(self.collectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError(.fatalErrorInit)
    }
    
    public func addCollectionProtocol(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            view1.topAnchor.constraint(equalTo: self.topAnchor, constant: -30),
            view1.heightAnchor.constraint(equalToConstant: 200),
            view1.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view1.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            lbNamePage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            lbNamePage.centerYAnchor.constraint(equalTo: view1.centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: view1.bottomAnchor,constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
