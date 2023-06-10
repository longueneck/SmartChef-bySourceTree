import UIKit

class SearchTextField: UITableViewCell {
    
    static var identifier = String(describing: SearchTextField.self)
    
    lazy var searchedIngredientLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
        setConstraints()
        backgroundColor = .lightGray
    }
    
    private func addSubViews() {
        contentView.addSubview(searchedIngredientLabel)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            searchedIngredientLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 8),
            searchedIngredientLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -8),
            searchedIngredientLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 8),
            searchedIngredientLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -8)
        ])
    }
}

