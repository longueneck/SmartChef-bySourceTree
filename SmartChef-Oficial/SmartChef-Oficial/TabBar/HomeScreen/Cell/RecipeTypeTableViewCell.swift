import UIKit

protocol firstUITableViewCellProtocol{
    func goToAhotherView()
}

class RecipeTypeTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: RecipeTypeTableViewCell.self)
    
    var delegate: firstUITableViewCellProtocol?
    
    var homeScreen: HomeScreen?
    var stackView: RecipeStackView?
    
    lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = .categoriasLabel
        label.font = .sugarFont18
        label.textColor = .brownBase
        return label
    }()
    
    lazy var typeRecipeStackView: RecipeStackView = {
        let stack = RecipeStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 12
        return stack
    }()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        typeRecipeStackView.delegate = self
        addSubViews()
        configConstraints()
    }
    
    private func addSubViews() {
        self.addSubview(self.firstLabel)
        self.addSubview(self.typeRecipeStackView)
    }
    
    private func configConstraints() {
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

extension RecipeTypeTableViewCell: RecipeStackViewDelegate{
    func tapGoToTypeRecipe() {
        delegate?.goToAhotherView()
    }
}
