import UIKit

struct PrepairRecipes{
    var nameImage: String
}

class PrepairCollectionViewCell: UICollectionViewCell {

    static let identifier = "PrepairCollectionViewCell"
    var data: [PrepairRecipes] = []

    lazy var recipePrepairImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "hamburger")
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .blue
        image.clipsToBounds = true

        return image
    }()
    
        lazy var recipeNameLabel: UILabel = {
            let page = UILabel()
            page.translatesAutoresizingMaskIntoConstraints = false
            page.text = "Name Recipe"
            page.font = UIFont.systemFont(ofSize: 17)
            page.numberOfLines = 0
            page.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
            return page
        }()
    
    lazy var typeRecipeLabel: UILabel = {
        let page = UILabel()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.text = "Type Recipe"
        page.font = UIFont.systemFont(ofSize: 17)
        page.numberOfLines = 0
        page.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return page
    }()
    
    lazy var timingToCook: UILabel = {
        let page = UILabel()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.text = "40 min"
        page.font = UIFont.systemFont(ofSize: 17)
        page.numberOfLines = 0
        page.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return page
    }()
    
    lazy var descriptionRecipeLabel: UILabel = {
        let page = UILabel()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.text = "Description Recipe"
        page.font = UIFont.systemFont(ofSize: 17)
        page.numberOfLines = 0
        page.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return page
    }()
    
    lazy var ingredientsRecipeLabel: UILabel = {
        let page = UILabel()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.text = "Array of Ingredients Recipe"
        page.font = UIFont.systemFont(ofSize: 17)
        page.numberOfLines = 0
        page.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return page
    }()
    
    lazy var prepareModeLabel: UILabel = {
        let page = UILabel()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.text = "Prepair Mode Recipe"
        page.font = UIFont.systemFont(ofSize: 17)
        page.numberOfLines = 0
        page.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return page
    }()
    
    lazy var prepairLevelLabel: UILabel = {
        let page = UILabel()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.text = "Level"
        page.font = UIFont.systemFont(ofSize: 17)
        page.numberOfLines = 0
        page.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return page
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        setConstraints()
    }
    
    func addSubViews(){
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
        self.recipePrepairImage.image = UIImage(named: data.nameImage)
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

