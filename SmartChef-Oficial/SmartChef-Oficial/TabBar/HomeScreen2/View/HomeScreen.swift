import UIKit

protocol RecipeScreenProtocol: AnyObject{
    func goToSearch()
}

class HomeScreen: UIView {
    
    weak private var homeScreenProtocol: RecipeScreenProtocol?
    
    func delegate(delegate: RecipeScreenProtocol){
        self.homeScreenProtocol = delegate
    }
    
    lazy var yellowTopView: UIView = {
        let topYellow = UIView()
        topYellow.translatesAutoresizingMaskIntoConstraints = false
        topYellow.backgroundColor = .yellowBase
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
        letsCook.text = .letsCook
        letsCook.textColor = .brownBase
        letsCook.font = .sugarFont24
        return letsCook
    }()
    
    lazy var startInsertLabel: UILabel = {
        let insert = UILabel()
        insert.translatesAutoresizingMaskIntoConstraints = false
        insert.text = .insertIngredient
        insert.textColor = .brownBase
        insert.numberOfLines = 0
        insert.font = .sugarFont17
        return insert
    }()
    
    lazy var addIngredientTextField: UITextField = {
        let add = UITextField()
        add.translatesAutoresizingMaskIntoConstraints = false
        add.backgroundColor = .whiteBase
        add.placeholder = .insertHere
        add.textColor = .brownBase
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
        table.backgroundColor = .whiteBase
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
    
    lazy var scrolView: UIScrollView = {
            let scroll = UIScrollView()
            scroll.translatesAutoresizingMaskIntoConstraints = false
            scroll.isScrollEnabled = true
            return scroll
        }()
    
    lazy var backgroundView: UIView = {
        let white = UIView()
        white.translatesAutoresizingMaskIntoConstraints = false
        white.backgroundColor = .white
        return white
    }()
    
    lazy var howManyTimeSlider: UISlider = {
        let slider = UISlider()
        slider.tintColor = .yellowBase
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        return slider
    }()
    
    lazy var manyPeopleLabel: UILabel = {
        let insert = UILabel()
        insert.translatesAutoresizingMaskIntoConstraints = false
        insert.text = .manyPeople
        insert.textColor = .brownBase
        insert.numberOfLines = 0
        insert.font = .sugarFont17
        return insert
    }()
    
    lazy var manyPeopleSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["1", "2", "3", "4", "+5"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 1
        segmentedControl.layer.cornerRadius = 20
        segmentedControl.backgroundColor = .whiteBase
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.backgroundColor: UIColor.whiteBase], for: .normal)
        segmentedControl.selectedSegmentTintColor = .yellowBase
        let font = UIFont.sugarFont14
        let fontSelected = UIFont.sugarFont20
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.brownBase, NSAttributedString.Key.font: font], for: .normal)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.brownBase, NSAttributedString.Key.font: fontSelected], for: .selected)
        return segmentedControl
    }()
    
    lazy var switchPresentationLabel: UILabel = {
        let insert = UILabel()
        insert.translatesAutoresizingMaskIntoConstraints = false
        insert.text = "O que podemos usar?"
        insert.textColor = .brownBase
        insert.font = .sugarFont17
        return insert
    }()
    
    
    lazy var switchLabel1: UILabel = {
        let insert = UILabel()
        insert.translatesAutoresizingMaskIntoConstraints = false
        insert.text = .switch1
        insert.textColor = .brownBase
        insert.font = .sugarFont14
        return insert
    }()
    
    lazy var mySwitch1: UISwitch = {
        let switchControl = UISwitch()
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        switchControl.isOn = false
        switchControl.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        switchControl.onTintColor = UIColor.yellowBase
        switchControl.thumbTintColor = UIColor.whiteBase
        switchControl.tintColor = .gray
        return switchControl
    }()
    
    lazy var switchLabel2: UILabel = {
        let insert = UILabel()
        insert.translatesAutoresizingMaskIntoConstraints = false
        insert.text = .switch2
        insert.textColor = .brownBase
        insert.font = .sugarFont14
        return insert
    }()
    
    lazy var mySwitch2: UISwitch = {
        let switchControl = UISwitch()
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        switchControl.isOn = false
        switchControl.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        switchControl.onTintColor = UIColor.yellowBase
        switchControl.thumbTintColor = UIColor.whiteBase
        switchControl.tintColor = .gray
        return switchControl
    }()
    
    lazy var switchLabel3: UILabel = {
        let insert = UILabel()
        insert.translatesAutoresizingMaskIntoConstraints = false
        insert.text = .switch3
        insert.textColor = .brownBase
        insert.font = .sugarFont14
        return insert
    }()
    
    lazy var mySwitch3: UISwitch = {
        let switchControl = UISwitch()
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        switchControl.isOn = false
        switchControl.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        switchControl.onTintColor = UIColor.yellowBase
        switchControl.thumbTintColor = UIColor.whiteBase
        switchControl.tintColor = .gray
        return switchControl
    }()
    
    lazy var switchLabel4: UILabel = {
        let insert = UILabel()
        insert.translatesAutoresizingMaskIntoConstraints = false
        insert.text = .switch4
        insert.textColor = .brownBase
        insert.font = .sugarFont14
        return insert
    }()
    
    lazy var mySwitch4: UISwitch = {
        let switchControl = UISwitch()
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        switchControl.isOn = false
        switchControl.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        switchControl.onTintColor = UIColor.yellowBase
        switchControl.thumbTintColor = UIColor.whiteBase
        switchControl.tintColor = .gray
        return switchControl
    }()
    
    lazy var switchLabel5: UILabel = {
        let insert = UILabel()
        insert.translatesAutoresizingMaskIntoConstraints = false
        insert.text = .switch5
        insert.textColor = .brownBase
        insert.font = .sugarFont14
        return insert
    }()
    
    lazy var mySwitch5: UISwitch = {
        let switchControl = UISwitch()
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        switchControl.isOn = false
        switchControl.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        switchControl.onTintColor = UIColor.yellowBase
        switchControl.thumbTintColor = UIColor.whiteBase
        switchControl.tintColor = .gray
        return switchControl
    }()
    
    lazy var switchLabelToAll: UILabel = {
        let insert = UILabel()
        insert.translatesAutoresizingMaskIntoConstraints = false
        insert.text = .switchAll
        insert.textColor = .brownBase
        insert.font = .sugarFont14
        return insert
    }()
    
    lazy var mySwitchAll: UISwitch = {
        let switchControl = UISwitch()
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        switchControl.isOn = false
        switchControl.addTarget(self, action: #selector(allSelectedSwitchs(_:)), for: .valueChanged)
        switchControl.onTintColor = UIColor.yellowBase
        switchControl.thumbTintColor = UIColor.whiteBase
        switchControl.tintColor = .gray
        return switchControl
    }()
    
    lazy var searchButton:UIButton = {
        let search = UIButton()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.backgroundColor = .brownBase
        search.layer.cornerRadius = 10
        search.setTitle(.search, for: .normal)
        search.setTitleColor(.whiteBase, for: .normal)
        search.titleLabel?.font = .sugarFont17
        search.addTarget(self, action: #selector(tappedToSearch), for: .touchUpInside)
        return search
    }()
    
    lazy var searchedTableView:UITableView = {
        let tView:UITableView = UITableView()
        tView.translatesAutoresizingMaskIntoConstraints = false
        tView.register(SearchTextField.self, forCellReuseIdentifier: SearchTextField.identifier)
        tView.layer.cornerRadius = 20
        tView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        tView.backgroundColor = .lightGray
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
        fatalError(.fatalErrorInit)
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
        self.addSubview(self.howManyTimeSlider)
        self.addSubview(self.manyPeopleLabel)
        self.addSubview(self.manyPeopleSegmentedControl)
        self.addSubview(self.insertedIngredientTableView)
        self.addSubview(self.switchPresentationLabel)
        self.addSubview(self.switchLabel1)
        self.addSubview(self.mySwitch1)
        self.addSubview(self.switchLabel2)
        self.addSubview(self.mySwitch2)
        self.addSubview(self.switchLabel3)
        self.addSubview(self.mySwitch3)
        self.addSubview(self.switchLabel4)
        self.addSubview(self.mySwitch4)
        self.addSubview(self.switchLabel5)
        self.addSubview(self.mySwitch5)
        self.addSubview(self.switchLabelToAll)
        self.addSubview(self.mySwitchAll)
        self.addSubview(self.searchButton)
    }
    
    @objc func switchValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            
        } else {
            print("Esta Desligado o Switch")
        }
    }
    
    @objc func allSelectedSwitchs(_ sender: UISwitch) {
        if sender.isOn {
            mySwitch1.setOn(true, animated: true)
            mySwitch2.setOn(true, animated: true)
            mySwitch3.setOn(true, animated: true)
            mySwitch4.setOn(true, animated: true)
            mySwitch5.setOn(true, animated: true)
        } else if sender.isOn == false {
            mySwitch1.setOn(false, animated: true)
            mySwitch2.setOn(false, animated: true)
            mySwitch3.setOn(false, animated: true)
            mySwitch4.setOn(false, animated: true)
            mySwitch5.setOn(false, animated: true)
        }
    }
    
    @objc private func tappedToSearch(){
        homeScreenProtocol?.goToSearch()
    }
    
    func addConstraintsConfig(){
        NSLayoutConstraint.activate([
            
            yellowTopView.topAnchor.constraint(equalTo: self.topAnchor, constant: -20),
            yellowTopView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            yellowTopView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            yellowTopView.bottomAnchor.constraint(equalTo: centerYAnchor),
            
            letsCookLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            letsCookLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            insertedIngredientTableView.topAnchor.constraint(equalTo: letsCookLabel.bottomAnchor, constant: 20),
            insertedIngredientTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            insertedIngredientTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            insertedIngredientTableView.bottomAnchor.constraint(equalTo: startInsertLabel.topAnchor, constant: -20),
            
            startInsertLabel.bottomAnchor.constraint(equalTo: addIngredientTextField.topAnchor, constant: -7),
            startInsertLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
            addIngredientTextField.heightAnchor.constraint(equalToConstant: 40),
            addIngredientTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            addIngredientTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            addIngredientTextField.bottomAnchor.constraint(equalTo: yellowTopView.bottomAnchor, constant: -15),
            
            howManyTimeSlider.topAnchor.constraint(equalTo: yellowTopView.bottomAnchor, constant: 20),
            howManyTimeSlider.leadingAnchor.constraint(equalTo: addIngredientTextField.leadingAnchor),
            howManyTimeSlider.trailingAnchor.constraint(equalTo: addIngredientTextField.trailingAnchor),
            howManyTimeSlider.heightAnchor.constraint(equalToConstant: 20),
            
            manyPeopleLabel.topAnchor.constraint(equalTo: howManyTimeSlider.bottomAnchor, constant: 20),
            manyPeopleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
            manyPeopleSegmentedControl.heightAnchor.constraint(equalToConstant: 45),
            manyPeopleSegmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            manyPeopleSegmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            manyPeopleSegmentedControl.topAnchor.constraint(equalTo: manyPeopleLabel.bottomAnchor, constant: 7),
            
            switchPresentationLabel.topAnchor.constraint(equalTo: manyPeopleSegmentedControl.bottomAnchor, constant: 20),
            switchPresentationLabel.leadingAnchor.constraint(equalTo: leadingAnchor , constant: 25),
                        
            mySwitch1.topAnchor.constraint(equalTo: switchPresentationLabel.bottomAnchor, constant: 7),
            mySwitch1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            switchLabel1.centerYAnchor.constraint(equalTo: mySwitch1.centerYAnchor),
            switchLabel1.leadingAnchor.constraint(equalTo: mySwitch1.trailingAnchor, constant: 7),
            
            mySwitch2.topAnchor.constraint(equalTo: mySwitch1.bottomAnchor, constant: 10),
            mySwitch2.centerXAnchor.constraint(equalTo: mySwitch1.centerXAnchor),
            
            switchLabel2.centerYAnchor.constraint(equalTo: mySwitch2.centerYAnchor),
            switchLabel2.leadingAnchor.constraint(equalTo: mySwitch2.trailingAnchor, constant: 7),
            
            mySwitch3.topAnchor.constraint(equalTo: mySwitch2.bottomAnchor, constant: 10),
            mySwitch3.centerXAnchor.constraint(equalTo: mySwitch2.centerXAnchor),
            
            switchLabel3.centerYAnchor.constraint(equalTo: mySwitch3.centerYAnchor),
            switchLabel3.leadingAnchor.constraint(equalTo: mySwitch3.trailingAnchor, constant: 7),
            
            mySwitch4.centerYAnchor.constraint(equalTo: mySwitch1.centerYAnchor),
            mySwitch4.leadingAnchor.constraint(equalTo: centerXAnchor),
            
            switchLabel4.centerYAnchor.constraint(equalTo: mySwitch4.centerYAnchor),
            switchLabel4.leadingAnchor.constraint(equalTo: mySwitch4.trailingAnchor, constant: 7),
            
            mySwitch5.topAnchor.constraint(equalTo: mySwitch4.bottomAnchor, constant: 10),
            mySwitch5.centerXAnchor.constraint(equalTo: mySwitch4.centerXAnchor),
            
            switchLabel5.centerYAnchor.constraint(equalTo: mySwitch5.centerYAnchor),
            switchLabel5.leadingAnchor.constraint(equalTo: mySwitch5.trailingAnchor, constant: 7),
            
            mySwitchAll.topAnchor.constraint(equalTo: mySwitch5.bottomAnchor, constant: 10),
            mySwitchAll.centerXAnchor.constraint(equalTo: mySwitch5.centerXAnchor),
            
            switchLabelToAll.centerYAnchor.constraint(equalTo: mySwitchAll.centerYAnchor),
            switchLabelToAll.leadingAnchor.constraint(equalTo: mySwitchAll.trailingAnchor, constant: 7),
            
            searchButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -25 ),
            searchButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25),
            searchButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            searchButton.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
}

