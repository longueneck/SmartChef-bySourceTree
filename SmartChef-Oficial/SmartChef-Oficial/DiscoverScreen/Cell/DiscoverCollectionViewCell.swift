
import UIKit

class DiscoverCollectionViewCell: UICollectionViewCell{
    
    static let identifier = "DiscoverCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        addConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var viewGLobal: UIView = {
        let name = UIView()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.backgroundColor = .white
        name.layer.borderWidth = 1
        name.layer.borderColor = UIColor(red: 209/255, green: 209/255, blue: 209/255, alpha: 1).cgColor
        name.layer.cornerRadius = 10
        
        return name
    }()
    
    lazy var imageRecipe: UIImageView = {
        let name = UIImageView()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.image = UIImage(named: "pao")
        name.layer.cornerRadius = 10
        name.contentMode = .scaleAspectFill
        name.clipsToBounds = true
        
        return name
    }()
    
    lazy var lbIngredients:UILabel = {
        let label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.text = "Nome da Receita"
        label1.font = UIFont.boldSystemFont(ofSize: 16)
        label1.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        
        return label1
    }()
    
    lazy var stack1: StarsStackView = {
        let stack = StarsStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 1
        
        return stack
    }()
    
    lazy var bookMark:UIButton = {
        let button2 = UIButton()
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.setImage(UIImage(systemName: "fork.knife"), for: .normal)
        button2.tintColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        
        return button2
    }()

    
    lazy var timerImage:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "timer")
        image.tintColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        return image
    }()
    
    lazy var lbTimer:UILabel = {
        let lbtimer = UILabel()
        lbtimer.translatesAutoresizingMaskIntoConstraints = false
        lbtimer.text = "40min"
        lbtimer.font = UIFont.boldSystemFont(ofSize: 16)
        lbtimer.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        
        return lbtimer
    }()
    
    func configShadow(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 3
        self.layer.masksToBounds = false
    }
    
    func addSubView(){
        self.contentView.addSubview(self.viewGLobal)
        self.contentView.addSubview(self.lbIngredients)
        self.contentView.addSubview(self.bookMark)
        self.contentView.addSubview(self.imageRecipe)
        self.contentView.addSubview(self.timerImage)
        self.contentView.addSubview(self.lbTimer)
        self.contentView.addSubview(self.stack1)
        
    }
    
    
    
    func addConstraints(){
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
        bookMark.heightAnchor.constraint(equalToConstant: 35),
        bookMark.widthAnchor.constraint(equalToConstant: 35),
        
        
        ])
    }
}

