import UIKit

class SearchedFieldTableView: UITableViewCell {
    
    static var identifier = "CategoryUITableViewCell"
    
    lazy var searchedItem:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        

        return label
    }()

    override func awakeFromNib() {
       
        super.awakeFromNib()

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(searchedItem)
        backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        NSLayoutConstraint.activate([
            searchedItem.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 8),
            searchedItem.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -8),
            searchedItem.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 8),
            searchedItem.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -8)
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
       
    }
    
}

