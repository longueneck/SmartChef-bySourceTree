import UIKit

protocol thirdTableViewCellProtocol: AnyObject {
    func tapToMain()
}

class thirdUITableViewCell: UITableViewCell {
    
    static var identifier = String(describing: thirdUITableViewCell.self)
    
    weak private var viewCellProtocol: thirdTableViewCellProtocol?
    
    func delegate(delegate: thirdTableViewCellProtocol){
        self.viewCellProtocol = delegate
    }
    
    var homeScreen: HomeScreen?
    
    lazy var myIngredientsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.backgroundColor = Color.Global.yellowBase
        button.setTitle("Receitas com meus ingredientes", for: .normal)
        button.setTitleColor(UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(goToMain), for: .touchUpInside)
        return button
    }()
    
    @objc func goToMain(){
        viewCellProtocol?.tapToMain()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.addSubview(self.myIngredientsButton)
        NSLayoutConstraint.activate([
            myIngredientsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            myIngredientsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            myIngredientsButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            myIngredientsButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}
