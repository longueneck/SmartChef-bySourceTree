import UIKit

class SnackCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SnackCollectionViewCell"
    var data: [SnackRecipe] = []
    
    lazy var images: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "hamburger")
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .blue
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.images)
        setConstraints()
    }
    
    public func setupCell(data: SnackRecipe){
        self.images.image = UIImage(named: data.nameImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
        
            images.topAnchor.constraint(equalTo: self.topAnchor),
            images.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            images.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            images.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
        ])
    }
    
    
}
