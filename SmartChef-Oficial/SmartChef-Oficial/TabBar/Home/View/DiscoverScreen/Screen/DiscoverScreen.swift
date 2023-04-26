import Foundation
import UIKit

protocol DiscoverScreenProtocol: AnyObject{
    func backToPage()
}

class DiscoverScreen: UIView {
    
    weak private var discoverProtocol: DiscoverScreenProtocol?
    
    func delegate(delegate: DiscoverScreenProtocol){
        self.discoverProtocol = delegate
    }
      
    lazy var view1: UIView = {
        let table = UIView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        
        return table
    }()
    
    lazy var backButton: UIButton = {
        let back = UIButton()
        back.translatesAutoresizingMaskIntoConstraints = false
        back.setImage(UIImage(systemName: "arrowshape.backward.fill"), for: .normal)
        back.tintColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        back.layer.cornerRadius = 8
        back.contentMode = .scaleAspectFit
        back.backgroundColor = .white
        back.addTarget(self, action: #selector(tappedToBack), for: .touchUpInside)
               
        return back
    }()
    
    lazy var lbNamePage: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "< Descubrir Receitas >"
        let locate = NSLocalizedString("discover_recipe", comment: "")
        name.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        name.font = UIFont(name: "Nice Sugar", size: 22)
        
        return name
    }()
    
    lazy var imageBall: UIImageView = {
        let table = UIImageView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.image = UIImage(named: "balls2")
        table.contentMode = .scaleAspectFill
        
        return table
    }()
    
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: CGRect.zero,collectionViewLayout: UICollectionViewLayout.init())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsVerticalScrollIndicator = false
        collection.backgroundColor = .clear
        collection.register(DiscoverCollectionViewCell.self, forCellWithReuseIdentifier: DiscoverCollectionViewCell.identifier)
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
    
    private func addSubViews(){
        self.addSubview(self.view1)
        self.addSubview(self.backButton)
        self.addSubview(self.lbNamePage)
        self.addSubview(self.imageBall)
        self.addSubview(self.collectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func tappedToBack(){
        discoverProtocol?.backToPage()
        
    }
    
    public func addCollectionProtocol(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource){
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            view1.topAnchor.constraint(equalTo: self.topAnchor),
            view1.heightAnchor.constraint(equalToConstant: 150),
            view1.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view1.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            backButton.heightAnchor.constraint(equalToConstant: 35),
            backButton.widthAnchor.constraint(equalToConstant: 35),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            
            lbNamePage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            lbNamePage.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            
            imageBall.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageBall.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageBall.centerYAnchor.constraint(equalTo: view1.bottomAnchor),
            imageBall.heightAnchor.constraint(equalToConstant: 30),
            
            collectionView.topAnchor.constraint(equalTo: imageBall.bottomAnchor,constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
    
}
