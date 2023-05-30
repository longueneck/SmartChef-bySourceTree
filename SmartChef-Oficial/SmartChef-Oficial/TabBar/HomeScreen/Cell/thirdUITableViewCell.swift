import UIKit

protocol thirdTableViewCellProtocol: AnyObject{
    
    func tapToMain()
}

class thirdUITableViewCell: UITableViewCell {
    
    weak private var viewCellProtocol: thirdTableViewCellProtocol?
    
    func delegate(delegate: thirdTableViewCellProtocol){
        self.viewCellProtocol = delegate
    }
    
    var homeScreen: HomeScreen?
    
    static var identifier = "thirdUITableViewCell"
    
    lazy var myIngredientsButton: UIButton = {
           let ingredients = UIButton()
           ingredients.translatesAutoresizingMaskIntoConstraints = false
           ingredients.layer.cornerRadius = 8
        ingredients.backgroundColor = Color.Global.yellowBase
           ingredients.setTitle("Receitas com meus ingredientes", for: .normal)
           ingredients.setTitleColor(UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1), for: .normal)
           ingredients.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
           ingredients.addTarget(self, action: #selector(goToMain), for: .touchUpInside)
           return ingredients
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
