import UIKit

protocol HomeScreenProtocol: AnyObject{
    func tapToMain()
}

class HomeScreen: UIView {
    
    weak private var recipeScreenProtocol: HomeScreenProtocol?
    
    func delegate(delegate: HomeScreenProtocol){
        self.recipeScreenProtocol = delegate
    }
    
    lazy var initialText: UILabel = {
        let initial = UILabel()
        initial.translatesAutoresizingMaskIntoConstraints = false
        initial.text = "Descubra novas eceitas e divirta-se na cozinha!"
        initial.font = UIFont(name: "Nice Sugar", size: 18)
        initial.numberOfLines = 0
        initial.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return initial
    }()
    
    lazy var tfSearchRecipe: UITextField = {
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
    
    lazy var yellowSeparator: UIView = {
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        return separator
    }()
    
    lazy var stack1: RecipeStackView = {
        let stack = RecipeStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 12
        return stack
    }()
    
    lazy var collectionRecipe: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: .init() )
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        collection.showsVerticalScrollIndicator = false
        collection.delaysContentTouches = false
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collection.register(RecipeScreenCollectionViewCell.self, forCellWithReuseIdentifier: RecipeScreenCollectionViewCell.identifier)
        collection.setCollectionViewLayout(layout, animated: true)
        return collection
    }()
    
    lazy var withMyIngredients: UIButton = {
        let ingredients = UIButton()
        ingredients.translatesAutoresizingMaskIntoConstraints = false
        ingredients.layer.cornerRadius = 8
        ingredients.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        ingredients.setTitle("Receitas com meus ingredientes", for: .normal)
        ingredients.setTitleColor(UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1), for: .normal)
        ingredients.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        ingredients.addTarget(self, action: #selector(goToMain), for: .touchUpInside)
        return ingredients
    }()
    
    lazy var collectionDrinks: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: .init() )
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        collection.showsVerticalScrollIndicator = false
        collection.delaysContentTouches = false
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collection.register(RecipeScreenCollectionViewCell.self, forCellWithReuseIdentifier: RecipeScreenCollectionViewCell.identifier)
        collection.setCollectionViewLayout(layout, animated: true)
        return collection
    }()
    
    lazy var collectionDrinks2: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: .init() )
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        collection.showsVerticalScrollIndicator = false
        collection.delaysContentTouches = false
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collection.register(RecipeScreenCollectionViewCell.self, forCellWithReuseIdentifier: RecipeScreenCollectionViewCell.identifier)
        collection.setCollectionViewLayout(layout, animated: true)
        return collection
    }()
    
    lazy var stack2: DrinksStackView = {
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
        collectionRecipe.delegate = delegate
        collectionRecipe.dataSource = dataSource
        
        collectionDrinks.delegate = delegate
        collectionDrinks.dataSource = dataSource
        
        collectionDrinks2.delegate = delegate
        collectionDrinks2.dataSource = dataSource
    }
    
    private func addViews(){
        
        self.addSubview(self.collectionRecipe)
        self.addSubview(self.initialText)
        self.addSubview(self.tfSearchRecipe)
        self.addSubview(self.yellowSeparator)
        self.addSubview(self.stack1)
        self.addSubview(self.withMyIngredients)
        self.addSubview(self.stack2)
        self.addSubview(self.collectionDrinks)
        self.addSubview(self.collectionDrinks2)

    }
    
    @objc func goToMain(){
        recipeScreenProtocol?.tapToMain()
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            
            initialText.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: Sizes.GlobalPage.topSpace),
            initialText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            initialText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45),
            
            tfSearchRecipe.topAnchor.constraint(equalTo: initialText.bottomAnchor, constant: 20),
            tfSearchRecipe.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            tfSearchRecipe.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            tfSearchRecipe.heightAnchor.constraint(equalToConstant: 45),
            
            yellowSeparator.topAnchor.constraint(equalTo: tfSearchRecipe.bottomAnchor, constant: 20),
            yellowSeparator.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            yellowSeparator.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            yellowSeparator.heightAnchor.constraint(equalToConstant: 5),
            
            stack1.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            stack1.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            stack1.topAnchor.constraint(equalTo: yellowSeparator.bottomAnchor, constant: 20),
            stack1.heightAnchor.constraint(equalToConstant: 75),
            
            collectionRecipe.topAnchor.constraint(equalTo: stack1.bottomAnchor, constant: 10),
            collectionRecipe.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionRecipe.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionRecipe.heightAnchor.constraint(equalToConstant: 180),
            
            withMyIngredients.topAnchor.constraint(equalTo: collectionRecipe.bottomAnchor, constant: 10),
            withMyIngredients.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            withMyIngredients.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            withMyIngredients.heightAnchor.constraint(equalToConstant: 45),
            
            stack2.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            stack2.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            stack2.topAnchor.constraint(equalTo: withMyIngredients.bottomAnchor, constant: 20),
            stack2.heightAnchor.constraint(equalToConstant: 80),
            
            collectionDrinks.topAnchor.constraint(equalTo: stack2.bottomAnchor, constant: 20),
            collectionDrinks.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionDrinks.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -15),
            collectionDrinks.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -25),
            
            collectionDrinks2.topAnchor.constraint(equalTo: stack2.bottomAnchor, constant: 20),
            collectionDrinks2.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 15),
            collectionDrinks2.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -55),
            collectionDrinks2.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -25),
            
        ])
    }
}
