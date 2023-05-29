import UIKit

class firstUITableViewCell: UITableViewCell {
    
    var homeScreen: HomeScreen?
    
    static var identifier = "firstUITableViewCell"
    
    lazy var typeRecipeStackView: RecipeStackView = {
        let stack = RecipeStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 12
        return stack
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.addSubview(self.typeRecipeStackView)
        NSLayoutConstraint.activate([
            typeRecipeStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            typeRecipeStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            typeRecipeStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            typeRecipeStackView.heightAnchor.constraint(equalToConstant: 65)
        ])
    }
}
