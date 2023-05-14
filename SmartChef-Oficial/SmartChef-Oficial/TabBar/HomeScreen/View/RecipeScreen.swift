import Foundation
import UIKit

protocol RecipeScreenProtocol: AnyObject{
    func goToSearch()
}

class RecipeScreen: UIView {
    
    weak private var homeScreenProtocol: RecipeScreenProtocol?
    
    func delegate(delegate: RecipeScreenProtocol){
        self.homeScreenProtocol = delegate
    }
    
    lazy var yellowTopView: UIView = {
        let topYellow = UIView()
        topYellow.translatesAutoresizingMaskIntoConstraints = false
        topYellow.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        topYellow.layer.cornerRadius = 20
        topYellow.layer.shadowColor = UIColor.black.cgColor
        topYellow.layer.shadowOpacity = 0.2
        topYellow.layer.shadowOffset = CGSize(width: 0, height: 1)
        topYellow.layer.shadowRadius = 2
        return topYellow
    }()
    
    lazy var letsCookLabel: UILabel = {
        let letsCook = UILabel()
        letsCook.translatesAutoresizingMaskIntoConstraints = false
        letsCook.text = "<Vamos Cozinhar?>"
        letsCook.textColor = .white
        letsCook.font = UIFont(name: "Nice Sugar", size: 24)
        return letsCook
    }()
    
    lazy var startInsertLabel: UILabel = {
        let insert = UILabel()
        insert.translatesAutoresizingMaskIntoConstraints = false
        insert.text = "Insira seus ingredientes"
        insert.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        insert.numberOfLines = 0
        insert.font = UIFont(name: "Nice Sugar", size: 16)
        return insert
    }()
    
    lazy var addIngredientTextField: UITextField = {
        let add = UITextField()
        add.translatesAutoresizingMaskIntoConstraints = false
        add.backgroundColor = .white
        add.placeholder = "Insira aqui"
        add.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        add.layer.cornerRadius = 10
        add.layer.shadowColor = UIColor.black.cgColor
        add.layer.shadowOpacity = 0.1
        add.layer.shadowOffset = CGSize(width: 0, height: 2)
        add.layer.shadowRadius = 2
        add.borderStyle = .roundedRect
        return add
    }()
    
    lazy var insertedIngredientTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = UIColor.white
        table.layer.cornerRadius = 12
        table.layer.shadowColor = UIColor.black.cgColor
        table.layer.shadowOpacity = 0.3
        table.layer.shadowOffset = CGSize(width: 2, height: 2)
        table.layer.shadowRadius = 2
        table.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -6)
        table.separatorStyle = .none
        table.register(IngredientsTableViewCell.self, forCellReuseIdentifier: IngredientsTableViewCell.identifier)
        table.rowHeight = 51
        return table
    }()
    
    lazy var backgroundView: UIView = {
        let white = UIView()
        white.translatesAutoresizingMaskIntoConstraints = false
        white.backgroundColor = .white
        return white
    }()
    
    lazy var searchButton:UIButton = {
        let search = UIButton()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.backgroundColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        search.layer.cornerRadius = 10
        search.setTitle("Search", for: .normal)
        search.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1), for: .normal)
        search.addTarget(self, action: #selector(tappedToSearch), for: .touchUpInside)
        return search
    }()
    
    lazy var searchedTableView:UITableView = {
        let tView:UITableView = UITableView()
        tView.translatesAutoresizingMaskIntoConstraints = false
        tView.register(SearchTextField.self, forCellReuseIdentifier: SearchTextField.identifier)
        tView.layer.cornerRadius = 20
        tView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        tView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        return tView
    }()
    
    func addSearchTableView() {
        
        self.addSubview(searchedTableView)
        
        NSLayoutConstraint.activate([
            
            searchedTableView.topAnchor.constraint(equalTo: addIngredientTextField.bottomAnchor,constant: 16),
            searchedTableView.leadingAnchor.constraint(equalTo: addIngredientTextField.leadingAnchor,constant: 0),
            searchedTableView.trailingAnchor.constraint(equalTo: addIngredientTextField.trailingAnchor, constant: 0),
            searchedTableView.heightAnchor.constraint(equalToConstant: 280),
        ])
    }
    
    func removeSearchTableView() {
        searchedTableView.removeFromSuperview()
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        setElements()
        addConstraintsConfig()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupCategoriesTableViewDelegate(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        searchedTableView.delegate = delegate
        searchedTableView.dataSource = dataSource
    }
    
    public func addTableViewDelegate(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        insertedIngredientTableView.delegate = delegate
        insertedIngredientTableView.dataSource = dataSource
    }
    
    func setElements(){
        self.addSubview(self.yellowTopView)
        self.addSubview(self.letsCookLabel)
        self.addSubview(self.startInsertLabel)
        self.addSubview(self.addIngredientTextField)
        self.addSubview(self.backgroundView)
        self.addSubview(self.insertedIngredientTableView)
        self.addSubview(self.searchButton)
    }
    
    @objc private func tappedToSearch(){
        homeScreenProtocol?.goToSearch()
    }
    
    func addConstraintsConfig(){
        NSLayoutConstraint.activate([
            
            yellowTopView.heightAnchor.constraint(equalToConstant: 200),
            yellowTopView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            yellowTopView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            yellowTopView.topAnchor.constraint(equalTo: self.topAnchor, constant: -20),
            
            letsCookLabel.bottomAnchor.constraint(equalTo: startInsertLabel.topAnchor, constant: -2),
            letsCookLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            startInsertLabel.bottomAnchor.constraint(equalTo: addIngredientTextField.topAnchor, constant: -10),
            startInsertLabel.centerXAnchor.constraint(equalTo: addIngredientTextField.centerXAnchor),
            
            addIngredientTextField.heightAnchor.constraint(equalToConstant: 40),
            addIngredientTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            addIngredientTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            addIngredientTextField.bottomAnchor.constraint(equalTo: yellowTopView.bottomAnchor, constant: -15),
            
            insertedIngredientTableView.topAnchor.constraint(equalTo: yellowTopView.bottomAnchor, constant: 20),
            insertedIngredientTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            insertedIngredientTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            insertedIngredientTableView.bottomAnchor.constraint(equalTo: searchButton.topAnchor, constant: -20),
            
            searchButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -25 ),
            searchButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25),
            searchButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            searchButton.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
}

