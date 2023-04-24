import Foundation
import UIKit

protocol MainScreenProtocol: AnyObject{
    func goToSearch()
}

class MainScreen: UIView {
    
    weak private var mainScreenProtocol: MainScreenProtocol?
    
    func delegate(delegate: MainScreenProtocol){
        self.mainScreenProtocol = delegate
    }
    
    lazy var userPhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "sorria")
        
        return imageView
    }()
    
    lazy var label1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "<Let's cook?>"
        label.textColor = .white
        label.font = UIFont(name: "Nice Sugar", size: 24)
        
        return label
    }()
    
    lazy var label2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Insert your ingredients"
        label.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        label.numberOfLines = 0
        label.font = UIFont(name: "Nice Sugar", size: 16)
        
        return label
    }()
    
    lazy var tfIngredients: UITextField = {
        let add = UITextField()
        add.translatesAutoresizingMaskIntoConstraints = false
        add.backgroundColor = .white
        add.placeholder = "Insert here"
        add.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        add.layer.cornerRadius = 10
        add.layer.shadowColor = UIColor.black.cgColor
        add.layer.shadowOpacity = 0.1
        add.layer.shadowOffset = CGSize(width: 0, height: 2)
        add.layer.shadowRadius = 2
        add.keyboardType = .default
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: add.frame.height))
        add.leftView = paddingView
        add.leftViewMode = .always
        
        return add
    }()
    
    lazy var tableView: UITableView = {
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
    
    lazy var underView: UIView = {
        let underV = UIView()
        underV.translatesAutoresizingMaskIntoConstraints = false
        underV.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        underV.layer.cornerRadius = 20
        underV.layer.shadowColor = UIColor.black.cgColor
        underV.layer.shadowOpacity = 0.2
        underV.layer.shadowOffset = CGSize(width: 0, height: 1)
        underV.layer.shadowRadius = 2
        
        return underV
    }()
    
    lazy var bachgroundWhite: UIView = {
        let white = UIView()
        white.translatesAutoresizingMaskIntoConstraints = false
        white.backgroundColor = .white
        
        return white
    }()
    
    lazy var buttonSearch:UIButton = {
        let search = UIButton()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.layer.borderWidth = 2
        search.layer.borderColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1).cgColor
        search.layer.cornerRadius = 10
        search.setTitle("Search", for: .normal)
        search.setTitleColor(UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1), for: .normal)
        search.addTarget(self, action: #selector(tappedToSearch), for: .touchUpInside)
        return search
    }()
    
    //-------------------------------------------------------------------------------------------------------------
    //MARK: TableView que vai ser criada quando comecarmos a pesquisa
    
    lazy var searchTableView:UITableView = {
        let tView:UITableView = UITableView()
        tView.translatesAutoresizingMaskIntoConstraints = false
        tView.register(SearchedFieldTableView.self, forCellReuseIdentifier: SearchedFieldTableView.identifier)
        tView.layer.cornerRadius = 20
        tView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
//        tView.layer.borderWidth = 2
        tView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        return tView
    }()
    
    //-------------------------------------------------------------------------------------------------------------
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        setElements()
        addConstraintsConfig()
     
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSearchTableView() {
        
        self.addSubview(searchTableView)
        
        NSLayoutConstraint.activate([
            
            searchTableView.topAnchor.constraint(equalTo: tfIngredients.bottomAnchor,constant: 16),
            searchTableView.leadingAnchor.constraint(equalTo: tfIngredients.leadingAnchor,constant: 0),
            searchTableView.trailingAnchor.constraint(equalTo: tfIngredients.trailingAnchor, constant: 0),
            searchTableView.heightAnchor.constraint(equalToConstant: 280),
        ])
    }
    
    func removeSearchTableView() {
            searchTableView.removeFromSuperview()
        }
    
    //-------------------------------------------------------------------------------------------------------------
    //MARK: CONFIGURANDO TableView Delegate e DataSource
    public func setupCategoriesTableViewDelegate(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        searchTableView.delegate = delegate
        searchTableView.dataSource = dataSource
    }
   
    //MARK: CONFIGURANDO TableView Delegate e DataSource
    public func addTableViewDelegate(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    //-------------------------------------------------------------------------------------------------------------
    //-------------------------------------------------------------------------------------------------------------
    
    func setElements(){
        self.addSubview(self.underView)
        self.addSubview(self.label1)
        self.addSubview(self.label2)
        self.addSubview(self.tfIngredients)
        self.addSubview(self.bachgroundWhite)
        self.addSubview(self.tableView)
        self.addSubview(self.buttonSearch)
    }
    //-------------------------------------------------------------------------------------------------------------
    //MARK: Metods OBJC to Buttons
    @objc private func tappedToSearch(){
        mainScreenProtocol?.goToSearch()
    }
    
    
    func addConstraintsConfig(){
        NSLayoutConstraint.activate([
            
            underView.heightAnchor.constraint(equalToConstant: 200),
            underView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            underView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            underView.topAnchor.constraint(equalTo: self.topAnchor, constant: -20),
            
            label1.bottomAnchor.constraint(equalTo: label2.topAnchor, constant: -2),
            label1.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            label2.bottomAnchor.constraint(equalTo: tfIngredients.topAnchor, constant: -10),
            label2.centerXAnchor.constraint(equalTo: tfIngredients.centerXAnchor),
            
            tfIngredients.heightAnchor.constraint(equalToConstant: 40),
            tfIngredients.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            tfIngredients.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            tfIngredients.bottomAnchor.constraint(equalTo: underView.bottomAnchor, constant: -15),
            
            tableView.topAnchor.constraint(equalTo: underView.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            tableView.bottomAnchor.constraint(equalTo: buttonSearch.topAnchor, constant: -20),
                        
            buttonSearch.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -25 ),
            buttonSearch.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25),
            buttonSearch.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            buttonSearch.heightAnchor.constraint(equalToConstant: 45),
            
        ])
    }
    
}

