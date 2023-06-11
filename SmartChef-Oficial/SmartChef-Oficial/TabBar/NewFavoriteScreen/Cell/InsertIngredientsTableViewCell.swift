import UIKit

protocol thirdTableViewCellProtocol: AnyObject {
    func tapToMain()
}

class InsertIngredientsTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: InsertIngredientsTableViewCell.self)
    
    weak private var viewCellProtocol: thirdTableViewCellProtocol?
    
    func delegate(delegate: thirdTableViewCellProtocol){
        self.viewCellProtocol = delegate
    }
    
    var homeScreen: NewFavoriteScreen?
    
    lazy var myIngredientsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.backgroundColor = .yellowBase
        button.setTitle(.recipeIngredientsTitle, for: .normal)
        button.setTitleColor(.brownBase, for: .normal)
        button.titleLabel?.font = .boldFont17
        button.addTarget(self, action: #selector(goToMain), for: .touchUpInside)
        return button
    }()
    
    @objc func goToMain() {
        viewCellProtocol?.tapToMain()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubViews()
        configConstraints()
    }
    
    private func addSubViews() {
        self.addSubview(self.myIngredientsButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            myIngredientsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            myIngredientsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            myIngredientsButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            myIngredientsButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}
