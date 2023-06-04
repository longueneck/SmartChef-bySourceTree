import UIKit

class HomeScreen: UIView {
    
    lazy var yellowSeparatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Color.Global.yellowBase
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        view.layer.shadowRadius = 4
        return view
    }()
    
    lazy var initialLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = String.discoverNewRecipes
        label.font = UIFont(name: String.niceSugarFont, size: 18)
        label.numberOfLines = 0
        label.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return label
    }()
    
    lazy var searchRecipeTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = String.searchForRecipes
        textField.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOpacity = 0.1
        textField.layer.shadowOffset = CGSize(width: 0, height: 2)
        textField.layer.shadowRadius = 2
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 10
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        return textField
    }()
    
    lazy var mainTableView: UITableView = {
        let tableView:UITableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(firstUITableViewCell.self, forCellReuseIdentifier: firstUITableViewCell.identifier)
        tableView.register(secondUITableViewCell.self, forCellReuseIdentifier: secondUITableViewCell.identifier)
        tableView.register(thirdUITableViewCell.self, forCellReuseIdentifier: thirdUITableViewCell.identifier)
        tableView.register(fourthUITableViewCell.self, forCellReuseIdentifier: fourthUITableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.red
        tableView.layer.cornerRadius = 20
        tableView.allowsSelection = false
        tableView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        tableView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setTableViewDelegate(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        mainTableView.delegate = delegate
        mainTableView.dataSource = dataSource
    }
    
    private func addSubViews(){
        self.addSubview(self.yellowSeparatorView)
        self.addSubview(self.initialLabel)
        self.addSubview(self.searchRecipeTextField)
        self.addSubview(self.mainTableView)
    }
    
    private func setConstraints(){
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
        ])
    }
}
