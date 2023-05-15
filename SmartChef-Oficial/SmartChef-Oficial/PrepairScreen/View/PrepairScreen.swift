import UIKit

class PrepairScreen: UIView {
    
    lazy var collectionHot: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: .init() )
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
//        self.addSubview(self.recipePrepairImage)
//        self.addSubview(self.recipeNameLabel)
        self.addSubview(self.collectionHot)
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            
//            recipePrepairImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
//            recipePrepairImage.heightAnchor.constraint(equalToConstant: 180),
//            recipePrepairImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            recipePrepairImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//
//            recipeNameLabel.centerXAnchor.constraint(equalTo: recipePrepairImage.centerXAnchor),
//            recipeNameLabel.topAnchor.constraint(equalTo: recipePrepairImage.bottomAnchor, constant: 15),

            collectionHot.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            collectionHot.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionHot.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionHot.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
            
         
            
        ])
    }
    
}
