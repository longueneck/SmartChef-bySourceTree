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
        label.text = 
        label.font = UIFont(name: "Nice Sugar", size: 18)
        label.numberOfLines = 0
        label.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return label
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
        tView.register(thirdUITableViewCell.self, forCellReuseIdentifier: thirdUITableViewCell.identifier)
        tView.register(fourthUITableViewCell.self, forCellReuseIdentifier: fourthUITableViewCell.identifier)
        tView.separatorStyle = .none
        tView.backgroundColor = UIColor.red
        tView.layer.cornerRadius = 20
        tView.allowsSelection = false
        tView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        tView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        return tView
    }()
       
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
                        
        ])
    }
    
}
