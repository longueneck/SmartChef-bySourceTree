import Foundation
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
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        
        return label
    }()
    
    lazy var buttonTwo: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        button.setImage(UIImage(systemName: String.SymbolMinus), for: .normal)
        button.tintColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
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
        fatalError("init(coder:) has not been implemented")
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
