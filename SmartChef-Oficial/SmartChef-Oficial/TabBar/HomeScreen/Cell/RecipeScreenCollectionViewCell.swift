import UIKit

class RecipeScreenCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RecipeScreenCollectionViewCell"
    var data: [Recipes] = []
    
    lazy var picture: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill


        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.picture)
        setConstraints()
    }
    
    public func setupCell(recipe: Recipes){
        self.picture.image = UIImage(named: recipe.image)
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
        
            picture.topAnchor.constraint(equalTo:topAnchor),
            picture.leadingAnchor.constraint(equalTo:leadingAnchor),
            picture.bottomAnchor.constraint(equalTo:bottomAnchor),
            picture.trailingAnchor.constraint(equalTo:trailingAnchor),
            
        ])
    }
}
