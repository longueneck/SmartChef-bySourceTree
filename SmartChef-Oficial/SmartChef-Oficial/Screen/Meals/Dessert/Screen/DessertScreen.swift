import UIKit

protocol DessertScreenProtocol: AnyObject{
    func actionBackButton()
}

class DessertScreen: UIView {
    
    weak private var delegate:DessertScreenProtocol?
    
    func delegate(delegate:DessertScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var lbPageName: UILabel = {
        let page = UILabel()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.text = "Lanches"
        page.font = UIFont.boldSystemFont(ofSize: 18)
        page.numberOfLines = 0
        page.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        
        return page
    }()
    
    lazy var imagePageType: UIImageView = {
        let imageType = UIImageView()
        imageType.translatesAutoresizingMaskIntoConstraints = false
        imageType.image = UIImage(named: "lanche")
        imageType.contentMode = .scaleAspectFill
        
        return imageType
    }()
    
    lazy var backButton: UIButton = {
        let back = UIButton()
        back.translatesAutoresizingMaskIntoConstraints = false
        back.setImage(UIImage(systemName: "arrowshape.backward.fill"), for: .normal)
        back.tintColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        back.layer.cornerRadius = 8
        back.contentMode = .scaleAspectFit
        back.backgroundColor = .white
        back.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
        
        return back
    }()
    
    lazy var tfSearchRecipe: UITextField = {
        let search = UITextField()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.backgroundColor = .white
        search.placeholder = "Pesquise por receitas"
        search.layer.shadowColor = UIColor.black.cgColor
        search.layer.shadowOpacity = 0.1
        search.layer.shadowOffset = CGSize(width: 0, height: 2)
        search.layer.shadowRadius = 2
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: search.frame.height))
        search.leftView = paddingView
        search.leftViewMode = .always
        search.layer.cornerRadius = 10
        return search
    }()
    
    lazy var backGroundWhite: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    lazy var ballsSeparator: UIImageView = {
        let separator = UIImageView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.image = UIImage(named: "balls2")
        separator.contentMode = .scaleAspectFill
        
        return separator
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
        collection.register(DessertCollectionViewCell.self, forCellWithReuseIdentifier: DessertCollectionViewCell.identifier)
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
    
    lazy var stackRecipes: VisitedsSteckView = {
        let stack = VisitedsSteckView()
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
    
    private func addViews(){
        
        self.addSubview(self.lbPageName)
        self.addSubview(self.imagePageType)
        self.addSubview(self.backButton)
        self.addSubview(self.tfSearchRecipe)
        self.addSubview(self.backGroundWhite)
        self.addSubview(self.ballsSeparator)
        self.addSubview(self.lbMostVisited)
        self.addSubview(self.imageStar)
        self.addSubview(self.lbFriends)
        self.addSubview(self.imageFriends)
        self.addSubview(self.collectionHot)
        self.addSubview(self.stackRecipes)
        
    }
    
    @objc func tappedBackButton(){
        self.delegate?.actionBackButton()
        print("CLICOU")
    }
    
    func configTextFieldDelegate(delegate: UITextFieldDelegate){
        self.tfSearchRecipe.delegate = delegate
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            
            
            backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            backButton.heightAnchor.constraint(equalToConstant: 35),
            backButton.widthAnchor.constraint(equalToConstant: 35),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            
            lbPageName.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            lbPageName.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            
            imagePageType.centerYAnchor.constraint(equalTo: lbPageName.centerYAnchor),
            imagePageType.leadingAnchor.constraint(equalTo: lbPageName.trailingAnchor, constant: 5),
            imagePageType.heightAnchor.constraint(equalToConstant: 20),
            imagePageType.widthAnchor.constraint(equalToConstant: 20),
            
            tfSearchRecipe.topAnchor.constraint(equalTo: lbPageName.bottomAnchor, constant: 30),
            tfSearchRecipe.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            tfSearchRecipe.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            tfSearchRecipe.heightAnchor.constraint(equalToConstant: 45),
            
            backGroundWhite.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backGroundWhite.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backGroundWhite.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backGroundWhite.topAnchor.constraint(equalTo: tfSearchRecipe.bottomAnchor, constant: 30),
            
            ballsSeparator.heightAnchor.constraint(equalToConstant: 10),
            ballsSeparator.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            ballsSeparator.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            ballsSeparator.centerYAnchor.constraint(equalTo: backGroundWhite.topAnchor),
            
            lbMostVisited.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            lbMostVisited.topAnchor.constraint(equalTo: ballsSeparator.bottomAnchor, constant: 25),
            
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
