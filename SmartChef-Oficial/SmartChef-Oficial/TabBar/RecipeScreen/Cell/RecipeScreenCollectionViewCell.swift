import UIKit

class RecipeScreenCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RecipeScreenCollectionViewCell"
    var data: [RecipeModel] = []
    
    lazy var picture: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .blue
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.picture)
        setConstraints()
    }
    
    public func setupCell(data: RecipeModel){
        self.picture.image = UIImage(named: data.image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
        
            picture.topAnchor.constraint(equalTo: self.topAnchor),
            picture.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            picture.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            picture.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
        ])
    }
    
    
}
