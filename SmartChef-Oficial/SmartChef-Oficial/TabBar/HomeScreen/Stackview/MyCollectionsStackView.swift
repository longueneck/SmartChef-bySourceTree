import Foundation
import UIKit


class MyCollectionsStackView: UIStackView {
    
    let viewModel: HomeViewModel = HomeViewModel()
   
    lazy var drinksCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.layer.cornerRadius = 10
        collection.backgroundColor = .blue
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.delaysContentTouches = false
        collection.register(RecipeScreenCollectionViewCell.self, forCellWithReuseIdentifier: RecipeScreenCollectionViewCell.identifier)
        return collection
    }()
    
//    lazy var drinksCollectionView2: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
//        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collection.translatesAutoresizingMaskIntoConstraints = false
//        collection.layer.cornerRadius = 10
//        collection.backgroundColor = .clear
//        collection.showsVerticalScrollIndicator = false
//        collection.showsHorizontalScrollIndicator = false
//        collection.delaysContentTouches = false
//        collection.register(RecipeScreenCollectionViewCell.self, forCellWithReuseIdentifier: RecipeScreenCollectionViewCell.identifier)
//        return collection
//    }()

 
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        addConstraints()
        configDelegate()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configDelegate(){
        drinksCollectionView.delegate = self
        drinksCollectionView.dataSource = self
        
//        drinksCollectionView2.delegate = self
//        drinksCollectionView2.dataSource = self
    }
    
    func addViews(){
        self.addArrangedSubview(self.drinksCollectionView)
//        self.addArrangedSubview(self.drinksCollectionView2)
    }
    
    private func addConstraints(){
        
//        NSLayoutConstraint.activate([
//
//                drinksCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
//                drinksCollectionView.trailingAnchor.constraint(equalTo: centerXAnchor),
//                drinksCollectionView.topAnchor.constraint(equalTo: topAnchor),
//                drinksCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
//
//                drinksCollectionView2.leadingAnchor.constraint(equalTo: leadingAnchor),
//                drinksCollectionView2.trailingAnchor.constraint(equalTo: centerXAnchor),
//                drinksCollectionView2.topAnchor.constraint(equalTo: bottomAnchor),
//        ])
    }
}

extension MyCollectionsStackView: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeScreenCollectionViewCell.identifier, for: indexPath) as? RecipeScreenCollectionViewCell
        cell?.setupCell(recipe: viewModel.generateRandomRecipes()[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
}


