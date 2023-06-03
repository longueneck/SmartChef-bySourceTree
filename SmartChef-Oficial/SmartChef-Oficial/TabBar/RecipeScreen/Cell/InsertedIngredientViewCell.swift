import Foundation
import UIKit

protocol InsertedIngredientsViewCellProtocol {
    func removeIngredients(index: Int)
}

class IngredientsTableViewCell: UITableViewCell{
    
    var ingredientsCellProtocol: InsertedIngredientsViewCellProtocol?
    
    static let identifier = "IngredientsTableViewCell"
    
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

    lazy var lbIngredients:UILabel = {
        let label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.font = UIFont.boldSystemFont(ofSize: 16)
        label1.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        
        return label1
    }()
    
    lazy var buttonTwo:UIButton = {
        let button2 = UIButton()
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.layer.cornerRadius = 10
        button2.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        button2.setImage(UIImage(systemName: "minus.circle"), for: .normal)
        button2.tintColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        button2.addTarget(self, action: #selector(removeIngredient(_:)), for: .touchUpInside)
        return button2
    }()
    
    func addSubView(){
        self.contentView.addSubview(self.lbIngredients)
        self.contentView.addSubview(self.buttonTwo)
    }
    
    @objc func removeIngredient(_ sender: UIButton){
        ingredientsCellProtocol?.removeIngredients(index: sender.tag)
    }
    
    func setConstraints(){
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
