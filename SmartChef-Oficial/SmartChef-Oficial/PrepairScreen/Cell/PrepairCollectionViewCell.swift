import UIKit

struct PrepairRecipes{
    var nameImage: String
}

class PrepairCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: PrepairCollectionViewCell.self)
    var data: [PrepairRecipes] = []

    lazy var recipePrepairImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: String.hamburgerImage)
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .blue
        image.clipsToBounds = true

        return image
    }()
    
        lazy var recipeNameLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = String.nameRecipeLabel
            label.font = UIFont.systemFont(ofSize: 17)
            label.numberOfLines = 0
            label.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
            return label
        }()
    
    lazy var typeRecipeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = String.typeRecipeLabel
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return label
    }()
    
    lazy var timingToCook: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = String.min
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return label
    }()
    
    lazy var descriptionRecipeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = String.descriptonRecipeLabel
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return label
    }()
    
    lazy var ingredientsRecipeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = String.ingredientsRecipeLabel
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return label
    }()
    
    lazy var prepareModeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = String.prepairRecipeLabel
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return label
    }()
    
    lazy var prepairLevelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = String.levelLabel
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        setConstraints()
    }
    
    private func addSubViews(){
        self.contentView.addSubview(self.recipePrepairImage)
        self.contentView.addSubview(self.recipeNameLabel)
        self.contentView.addSubview(self.typeRecipeLabel)
        self.contentView.addSubview(self.timingToCook)
        self.contentView.addSubview(self.descriptionRecipeLabel)
        self.contentView.addSubview(self.ingredientsRecipeLabel)//
        self.contentView.addSubview(self.prepareModeLabel)
        self.contentView.addSubview(self.prepairLevelLabel)
    }

    public func setupCell(data: PrepairRecipes){
        recipePrepairImage.image = UIImage(named: data.nameImage)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setConstraints(){
        NSLayoutConstraint.activate([

            recipePrepairImage.topAnchor.constraint(equalTo: self.topAnchor),
            recipePrepairImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            recipePrepairImage.heightAnchor.constraint(equalToConstant: 200),
            recipePrepairImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            recipeNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            recipeNameLabel.topAnchor.constraint(equalTo: recipePrepairImage.bottomAnchor, constant: 15),
            
            typeRecipeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            typeRecipeLabel.topAnchor.constraint(equalTo: recipeNameLabel.bottomAnchor, constant: 15),
            
            timingToCook.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            timingToCook.topAnchor.constraint(equalTo: typeRecipeLabel.bottomAnchor, constant: 15),
            
            descriptionRecipeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            descriptionRecipeLabel.topAnchor.constraint(equalTo: timingToCook.bottomAnchor, constant: 15),
            
            ingredientsRecipeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            ingredientsRecipeLabel.topAnchor.constraint(equalTo: descriptionRecipeLabel.bottomAnchor, constant: 15),
            
            prepareModeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            prepareModeLabel.topAnchor.constraint(equalTo: ingredientsRecipeLabel.bottomAnchor, constant: 15),
            
            prepairLevelLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            prepairLevelLabel.topAnchor.constraint(equalTo: prepareModeLabel.bottomAnchor, constant: 15),
            
        ])
    }
}

