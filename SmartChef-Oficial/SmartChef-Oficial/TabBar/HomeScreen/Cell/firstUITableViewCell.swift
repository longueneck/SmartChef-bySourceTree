import UIKit

protocol FirstUITableViewCellProtocol: AnyObject{
    
    func goToAnotherScreen()
    
}

class FirstUITableViewCell: UITableViewCell {
    
    public weak var delegate: FirstUITableViewCellProtocol?
    
    static var identifier = "firstUITableViewCell"
    
    lazy var firstLabel: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Categorias"
        text.font = UIFont(name: "Nice Sugar", size: 18)
        text.textColor = Color.Global.brownBase
    return text
    }()
    
    var typeRecipeStackView: RecipeStackView = {
        let stack = RecipeStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 12
        return stack
    }()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.addSubview(self.firstLabel)
        self.addSubview(self.typeRecipeStackView)
        self.typeRecipeStackView.delegate(delegate: self)
        NSLayoutConstraint.activate([
            
            firstLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            firstLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            firstLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            
            typeRecipeStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            typeRecipeStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            typeRecipeStackView.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 10),
            typeRecipeStackView.heightAnchor.constraint(equalToConstant: 65)
        ])
    }
}

extension FirstUITableViewCell: RecipeStackViewProtocol{
    func tapGoToTypeRecipe() {
        print("FDPPPPP")
        delegate?.goToAnotherScreen()
    }
    
    
    
}
