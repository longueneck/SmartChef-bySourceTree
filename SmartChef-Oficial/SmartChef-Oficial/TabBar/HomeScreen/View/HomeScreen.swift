import UIKit

protocol HomeScreenProtocol: AnyObject{
    
    func tapToMain()
}

class HomeScreen: UIView {
    
    weak private var recipeScreenProtocol: HomeScreenProtocol?
    
    func delegate(delegate: HomeScreenProtocol){
        self.recipeScreenProtocol = delegate
    }
    
    lazy var yellowSeparatorView: UIView = {
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        separator.layer.cornerRadius = 20
        separator.layer.shadowColor = UIColor.black.cgColor
        separator.layer.shadowOpacity = 0.5
        separator.layer.shadowOffset = CGSize(width: 2, height: 2)
        separator.layer.shadowRadius = 4
        return separator
    }()
    
    
    lazy var initialLabel: UILabel = {
        let initial = UILabel()
        initial.translatesAutoresizingMaskIntoConstraints = false
        initial.text = "Descubra novas eceitas e divirta-se na cozinha!"
        initial.font = UIFont(name: "Nice Sugar", size: 18)
        initial.numberOfLines = 0
        initial.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return initial
    }()
    
    lazy var searchRecipeTextField: UITextField = {
        let search = UITextField()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.placeholder = "  Pesquise por receitas"
        search.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
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
    
    lazy var mainTableView: UITableView = {
        let tView:UITableView = UITableView()
        tView.translatesAutoresizingMaskIntoConstraints = false
        tView.register(firstUITableViewCell.self, forCellReuseIdentifier: firstUITableViewCell.identifier)
        tView.register(secondUITableViewCell.self, forCellReuseIdentifier: secondUITableViewCell.identifier)
//        tView.register(SearchTextField.self, forCellReuseIdentifier: SearchTextField.identifier)
//        tView.register(SearchTextField.self, forCellReuseIdentifier: SearchTextField.identifier)
        tView.separatorStyle = .none
        tView.backgroundColor = UIColor.red
        tView.layer.cornerRadius = 20
        tView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        tView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        return tView
    }()

//
//    lazy var myIngredientsButton: UIButton = {
//        let ingredients = UIButton()
//        ingredients.translatesAutoresizingMaskIntoConstraints = false
//        ingredients.layer.cornerRadius = 8
//        ingredients.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
//        ingredients.setTitle("Receitas com meus ingredientes", for: .normal)
//        ingredients.setTitleColor(UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1), for: .normal)
//        ingredients.titleLabel?.font = UIFont.systemFont(ofSize: 14)
//        ingredients.addTarget(self, action: #selector(goToMain), for: .touchUpInside)
//        return ingredients
//    }()
//
//    lazy var drinksCollectionView: UICollectionView = {
//        let collection = UICollectionView(frame: .zero, collectionViewLayout: .init() )
//        let layout = UICollectionViewFlowLayout.init()
//        collection.translatesAutoresizingMaskIntoConstraints = false
//        collection.layer.cornerRadius = 10
//        collection.backgroundColor = .clear
//        collection.showsVerticalScrollIndicator = false
//        collection.showsHorizontalScrollIndicator = false
//        collection.delaysContentTouches = false
//        collection.register(RecipeScreenCollectionViewCell.self, forCellWithReuseIdentifier: RecipeScreenCollectionViewCell.identifier)
//        collection.setCollectionViewLayout(layout, animated: true)
//        layout.scrollDirection = .horizontal
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
//        return collection
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    public func setTableViewDelegate(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        mainTableView.delegate = delegate
        mainTableView.dataSource = dataSource
    }
    
    private func addViews(){
        self.addSubview(self.yellowSeparatorView)
        self.addSubview(self.initialLabel)
        self.addSubview(self.searchRecipeTextField)
        self.addSubview(self.mainTableView)
    }
    
    @objc func goToMain(){
        recipeScreenProtocol?.tapToMain()
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            
            yellowSeparatorView.topAnchor.constraint(equalTo: self.topAnchor, constant: -30),
            yellowSeparatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            yellowSeparatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            yellowSeparatorView.bottomAnchor.constraint(equalTo: searchRecipeTextField.bottomAnchor, constant: 10),
            
            initialLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Sizes.GlobalPage.topSpace),
            initialLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            initialLabel.trailingAnchor.constraint(equalTo:trailingAnchor, constant: -45),
            
            searchRecipeTextField.topAnchor.constraint(equalTo: initialLabel.bottomAnchor, constant: 20),
            searchRecipeTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            searchRecipeTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            searchRecipeTextField.heightAnchor.constraint(equalToConstant: 45),
            
            mainTableView.topAnchor.constraint(equalTo: yellowSeparatorView.bottomAnchor),
            mainTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
                        
//            myIngredientsButton.topAnchor.constraint(equalTo: firstCollectionView.bottomAnchor, constant: 10),
//            myIngredientsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
//            myIngredientsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
//            myIngredientsButton.heightAnchor.constraint(equalToConstant: 45),
//
//            drinksCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            drinksCollectionView.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -10),
//            drinksCollectionView.topAnchor.constraint(equalTo: myIngredientsButton.bottomAnchor, constant: 20),
//            drinksCollectionView.heightAnchor.constraint(equalToConstant: 150),
//
        ])
    }
    
}
