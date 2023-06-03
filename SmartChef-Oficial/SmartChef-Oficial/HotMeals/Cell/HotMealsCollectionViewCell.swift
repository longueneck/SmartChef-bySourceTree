import UIKit

struct HotRecipes{
    var nameImage: String
}

class HotMealsCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: HotMealsCollectionViewCell.self)
    
    var data: [HotRecipes] = []

    lazy var images: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: String.hamburgerImage)
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .blue

        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.images)
        setConstraints()
    }

    public func setupCell(data: HotRecipes){
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
