
import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell{
    
    static let identifier = String(describing: FavoriteCollectionViewCell.self)
    
    lazy var viewGLobal: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 209/255, green: 209/255, blue: 209/255, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var imageRecipe: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: StringMagica.expressImage)
        image.layer.cornerRadius = 10
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    lazy var lbIngredients: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = StringMagica.favoriteRecipes
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return label
    }()
    
    lazy var stack1: StarsStackView = {
        let stack = StarsStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 1
        return stack
    }()
    
    lazy var bookMark: UIButton = {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: StringMagica.heartFill, withConfiguration: UIImage.SymbolConfiguration(scale: .large))
        config.imagePlacement = .all
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isSelected = true
        button.tintColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        button.addTarget(self, action: #selector(tapToSaveFavorite), for: .touchUpInside)
        return button
    }()
    
    lazy var timerImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: StringMagica.timeImage)
        image.tintColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        return image
    }()
    
    lazy var lbTimer: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = StringMagica.min
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return label
    }()
    
    func configShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 3
        self.layer.masksToBounds = false
    }
    
    private func addSubView() {
        self.contentView.addSubview(self.viewGLobal)
        self.contentView.addSubview(self.lbIngredients)
        self.contentView.addSubview(self.bookMark)
        self.contentView.addSubview(self.imageRecipe)
        self.contentView.addSubview(self.timerImage)
        self.contentView.addSubview(self.lbTimer)
        self.contentView.addSubview(self.stack1)
    }
    
    @objc private func tapToSaveFavorite() {
        if bookMark.isSelected {
            bookMark.configuration?.image = UIImage(systemName: StringMagica.heart)
            bookMark.backgroundColor = .none
            bookMark.isSelected = false
        } else {
            bookMark.configuration?.image = UIImage(systemName: StringMagica.heartFill)
            bookMark.isSelected = true
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            viewGLobal.topAnchor.constraint(equalTo: self.topAnchor),
            viewGLobal.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            viewGLobal.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewGLobal.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            imageRecipe.widthAnchor.constraint(equalToConstant: 80),
            imageRecipe.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            imageRecipe.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            imageRecipe.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            imageRecipe.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            lbIngredients.leadingAnchor.constraint(equalTo: imageRecipe.trailingAnchor, constant: 7),
            lbIngredients.topAnchor.constraint(equalTo: imageRecipe.topAnchor),
            
            stack1.bottomAnchor.constraint(equalTo: imageRecipe.bottomAnchor,constant: -8),
            stack1.leadingAnchor.constraint(equalTo: imageRecipe.trailingAnchor, constant: 8),
            stack1.widthAnchor.constraint(equalToConstant: 100),
            stack1.heightAnchor.constraint(equalToConstant: 18),
            
            timerImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            timerImage.leadingAnchor.constraint(equalTo: imageRecipe.trailingAnchor,constant: 7),
            
            lbTimer.leadingAnchor.constraint(equalTo: timerImage.trailingAnchor, constant: 3),
            lbTimer.centerYAnchor.constraint(equalTo: timerImage.centerYAnchor),
            
            bookMark.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            bookMark.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            bookMark.heightAnchor.constraint(equalToConstant: 50),
            bookMark.widthAnchor.constraint(equalToConstant: 35),
        ])
    }
}

