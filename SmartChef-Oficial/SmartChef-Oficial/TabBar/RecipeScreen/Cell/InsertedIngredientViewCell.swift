import UIKit
import UIKit

protocol InsertedIngredientsViewCellProtocol {
    func removeIngredients(index: Int)
}

class IngredientsTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: IngredientsTableViewCell.self)
    
    var ingredientsCellProtocol: InsertedIngredientsViewCellProtocol?
    
    lazy var lbIngredients: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldFont17
        label.textColor = .brownBase
        
        return label
    }()
    
    lazy var buttonTwo: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.backgroundColor = .yellowBase
        button.setImage(UIImage(systemName: .symbolMinus), for: .normal)
        button.tintColor = .brownBase
        button.addTarget(self, action: #selector(removeIngredient(_:)), for: .touchUpInside)
        return button
    }()
    
    func addSubView() {
        self.contentView.addSubview(self.lbIngredients)
        self.contentView.addSubview(self.buttonTwo)
    }
    
    @objc func removeIngredient(_ sender: UIButton){
        ingredientsCellProtocol?.removeIngredients(index: sender.tag)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        addSubView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError(.fatalErrorInit)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            
            lbIngredients.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            lbIngredients.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            buttonTwo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            buttonTwo.centerYAnchor.constraint(equalTo: lbIngredients.centerYAnchor),
            buttonTwo.heightAnchor.constraint(equalToConstant: 20),
            buttonTwo.widthAnchor.constraint(equalToConstant: 20),
        ])
    }
}
