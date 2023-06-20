import UIKit

class PrepairScreen: UIView {
    
    private var textResponse: TextGPTResponseModel?
    
    lazy var recipeImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .white
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.shadowColor = UIColor.black.cgColor
        image.layer.shadowOpacity = 0.2
        image.layer.shadowOffset = CGSize(width: 0, height: 1)
        image.layer.shadowRadius = 2
    return image
    }()
    
    lazy var scrolView: UIScrollView = {
            let scroll = UIScrollView()
            scroll.translatesAutoresizingMaskIntoConstraints = false
            scroll.isScrollEnabled = true
        scroll.backgroundColor = .whiteBase

            return scroll
        }()

        lazy var containerView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .whiteBase

            return view
        }()
    
    lazy var recipeText: UILabel = {
        let image = UILabel()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.textColor = .brownBase
        image.font = UIFont.sugarFont17
        image.numberOfLines = 0
        image.clipsToBounds = true
        image.lineBreakMode = .byWordWrapping
        image.textAlignment = .justified
        
    return image
    }()
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError(.fatalErrorInit)
    }
    
    private func addElements(){
        
        self.addSubview(self.recipeImageView)
        self.addSubview(self.scrolView)
        self.scrolView.addSubview(self.containerView)
        self.containerView.addSubview(self.recipeText)
       
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
        
            recipeImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            recipeImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            recipeImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            recipeImageView.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -30),
            
            scrolView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrolView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrolView.topAnchor.constraint(equalTo: recipeImageView.bottomAnchor),
            scrolView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            containerView.leadingAnchor.constraint(equalTo: scrolView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrolView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: scrolView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrolView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrolView.widthAnchor),
            
            recipeText.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 25),
            recipeText.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            recipeText.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            recipeText.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            
        ])
        scrolView.contentSize = CGSize(width: containerView.frame.size.width, height: recipeText.frame.size.height + 20)
    }
    
}


