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
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .blue
        image.clipsToBounds = true
        
        return image
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        setConstraints()
    }
    
    private func addSubViews(){
        self.contentView.addSubview(self.recipePrepairImage)
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
           
        ])
    }
}

