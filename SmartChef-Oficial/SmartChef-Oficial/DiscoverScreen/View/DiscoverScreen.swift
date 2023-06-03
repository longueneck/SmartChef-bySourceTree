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
      
    lazy var topBackgorundView: UIView = {
        let table = UIView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        return table
    }()
    
    lazy var backButton: UIButton = {
        let back = UIButton()
        back.translatesAutoresizingMaskIntoConstraints = false
        back.setImage(UIImage(systemName: String.setaVoltar), for: .normal)
        back.tintColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        back.layer.cornerRadius = 8
        back.contentMode = .scaleAspectFit
        back.backgroundColor = .white
        back.addTarget(self, action: #selector(tappedToBack), for: .touchUpInside)
        return back
    }()
    
    lazy var namePageLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = String.discoverRecipeTitle
        let locate = NSLocalizedString("discover_recipe", comment: "")
        name.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        name.font = UIFont(name: "Nice Sugar", size: 22)
        return name
    }()
    
    lazy var imageBall: UIImageView = {
        let table = UIImageView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.image = UIImage(named: String.balls)
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
        self.addSubview(self.topBackgorundView)
        self.addSubview(self.backButton)
        self.addSubview(self.namePageLabel)
        self.addSubview(self.imageBall)
        self.addSubview(self.collectionView)
        //        self.addSubview(self.tableView)
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
            
            topBackgorundView.topAnchor.constraint(equalTo: self.topAnchor),
            topBackgorundView.heightAnchor.constraint(equalToConstant: 150),
            topBackgorundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            topBackgorundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            backButton.heightAnchor.constraint(equalToConstant: 35),
            backButton.widthAnchor.constraint(equalToConstant: 35),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            
            namePageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            namePageLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            
            imageBall.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageBall.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageBall.centerYAnchor.constraint(equalTo: topBackgorundView.bottomAnchor),
            imageBall.heightAnchor.constraint(equalToConstant: 30),
            
            collectionView.topAnchor.constraint(equalTo: imageBall.bottomAnchor,constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
    
}
