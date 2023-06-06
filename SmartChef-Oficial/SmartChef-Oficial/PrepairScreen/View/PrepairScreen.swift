import UIKit

class PrepairScreen: UIView {
    
    lazy var collectionHot: UICollectionView = {
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init() )
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.layer.cornerRadius = 10
        collection.backgroundColor = .clear
        collection.showsVerticalScrollIndicator = false
        collection.delaysContentTouches = false
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        collection.register(PrepairCollectionViewCell.self, forCellWithReuseIdentifier: PrepairCollectionViewCell.identifier)
        collection.setCollectionViewLayout(layout, animated: true)
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func collectionDelegate(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource){
        collectionHot.delegate = delegate
        collectionHot.dataSource = dataSource
    }
    
    private func addViews()
    {

        self.addSubview(self.collectionHot)
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            
            collectionHot.topAnchor.constraint(equalTo: self.topAnchor, constant: 70),
            collectionHot.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionHot.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionHot.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50)
        
        ])
    }
    
}
