import UIKit

protocol HotMealScreenProtocol: AnyObject{
    func actionBackButton()
}

class HotMealScreen: UIView {
    
    weak private var delegate:HotMealScreenProtocol?
    
    func delegate(delegate:HotMealScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var lbPageName: UILabel = {
        let page = UILabel()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.text = "Receitas Populares"
        page.font = UIFont.boldSystemFont(ofSize: 18)
        page.numberOfLines = 0
        page.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        
        return page
    }()
    
    lazy var imagePageType: UIImageView = {
        let imageType = UIImageView()
        imageType.translatesAutoresizingMaskIntoConstraints = false
        imageType.image = UIImage(named: "hot")
        imageType.contentMode = .scaleAspectFill
        
        return imageType
    }()
    
    lazy var yellowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    

    lazy var lbMostVisited: UILabel = {
        let page = UILabel()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.text = "Mais visitadas"
        page.font = UIFont.boldSystemFont(ofSize: 16)
        page.numberOfLines = 0
        page.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        
        return page
    }()
    
    lazy var imageStar: UIImageView = {
        let star = UIImageView()
        star.translatesAutoresizingMaskIntoConstraints = false
        star.image = UIImage(systemName: "star.fill")
        star.tintColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return star
    }()
    
    lazy var collectionHot: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: .init() )
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.layer.cornerRadius = 10
        collection.backgroundColor = .clear
        collection.showsVerticalScrollIndicator = false
        collection.delaysContentTouches = false
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collection.register(HotMealsCollectionViewCell.self, forCellWithReuseIdentifier: HotMealsCollectionViewCell.identifier)
        collection.setCollectionViewLayout(layout, animated: true)
        
        return collection
    }()
    
    lazy var lbFriends: UILabel = {
        let friends = UILabel()
        friends.translatesAutoresizingMaskIntoConstraints = false
        friends.text = "Aproveite com os amigos"
        friends.font = UIFont.boldSystemFont(ofSize: 16)
        friends.numberOfLines = 0
        friends.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        
        return friends
    }()
    
    lazy var imageFriends: UIImageView = {
        let friend = UIImageView()
        friend.translatesAutoresizingMaskIntoConstraints = false
        friend.image = UIImage(systemName: "person.3.fill")
        friend.tintColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return friend
    }()
    
    lazy var stackRecipes: DrinksStackView = {
        let stack = DrinksStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 12
        
        return stack
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
        self.addSubview(self.lbPageName)
        self.addSubview(self.imagePageType)
        
        self.addSubview(self.yellowView)
        self.addSubview(self.lbMostVisited)
        self.addSubview(self.imageStar)
        self.addSubview(self.lbFriends)
        self.addSubview(self.imageFriends)
        self.addSubview(self.collectionHot)
        self.addSubview(self.stackRecipes)
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
     
            yellowView.topAnchor.constraint(equalTo: self.topAnchor),
            yellowView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            yellowView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            yellowView.heightAnchor.constraint(equalToConstant: 180),
            
            lbPageName.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            lbPageName.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            imagePageType.centerYAnchor.constraint(equalTo: lbPageName.centerYAnchor),
            imagePageType.leadingAnchor.constraint(equalTo: lbPageName.trailingAnchor, constant: 5),
            imagePageType.heightAnchor.constraint(equalToConstant: 20),
            imagePageType.widthAnchor.constraint(equalToConstant: 20),
            
      
            
         
            
            
            lbMostVisited.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            lbMostVisited.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 25),
            
            imageStar.leadingAnchor.constraint(equalTo: lbMostVisited.trailingAnchor, constant: 5),
            imageStar.centerYAnchor.constraint(equalTo: lbMostVisited.centerYAnchor),
            
            collectionHot.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            collectionHot.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            collectionHot.topAnchor.constraint(equalTo: lbMostVisited.bottomAnchor, constant:10),
            collectionHot.heightAnchor.constraint(equalToConstant: 150),
            
            lbFriends.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            lbFriends.topAnchor.constraint(equalTo: collectionHot.bottomAnchor, constant: 25),
            
            imageFriends.leadingAnchor.constraint(equalTo: lbFriends.trailingAnchor, constant: 5),
            imageFriends.centerYAnchor.constraint(equalTo: lbFriends.centerYAnchor),
            
            stackRecipes.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            stackRecipes.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            stackRecipes.topAnchor.constraint(equalTo: lbFriends.bottomAnchor, constant: 10),
            stackRecipes.heightAnchor.constraint(equalToConstant: 80),
            
        ])
    }
    
}
