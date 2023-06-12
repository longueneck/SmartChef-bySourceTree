import UIKit

protocol DrinkStackViewProtocol{
    
}

class DrinksStackView: UIStackView {
    
    lazy var drinkRecipe1Button: UIButton = {
        let hot = UIButton()
        hot.translatesAutoresizingMaskIntoConstraints = false
        hot.tintColor = .brownBase
        hot.layer.cornerRadius = 8
        hot.clipsToBounds = true
        hot.imageView?.contentMode = .scaleAspectFill
        hot.backgroundColor = .yellowBase
        hot.addTarget(self, action: #selector(goToDrink1), for: .touchUpInside)

        return hot
    }()
    
    lazy var drink2: UIButton = {
        let option1 = UIButton()
        option1.translatesAutoresizingMaskIntoConstraints = false
        option1.tintColor = .brownBase
        option1.layer.cornerRadius = 8
        option1.imageView?.contentMode = .scaleAspectFill
        option1.clipsToBounds = true
        option1.backgroundColor = .yellowBase
        return option1
    }()
    
    lazy var drink3: UIButton = {
        let option2 = UIButton()
        option2.translatesAutoresizingMaskIntoConstraints = false
        option2.tintColor = .brownBase
        option2.layer.cornerRadius = 8
        option2.imageView?.contentMode = .scaleAspectFill
        option2.backgroundColor = .yellowBase
        option2.clipsToBounds = true
        return option2
    }()
    
    lazy var drink4: UIButton = {
        let option3 = UIButton()
        option3.translatesAutoresizingMaskIntoConstraints = false
        option3.tintColor = .brownBase
        option3.layer.cornerRadius = 8
        option3.imageView?.contentMode = .scaleAspectFill
        option3.clipsToBounds = true
        option3.backgroundColor = .yellowBase
        return option3
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        addConstraints()
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews(){
        self.addArrangedSubview(self.drinkRecipe1Button)
        self.addArrangedSubview(self.drink2)
        self.addArrangedSubview(self.drink3)
        self.addArrangedSubview(self.drink4)
    }
    
    @objc func goToDrink1(){
                
    }
    
    func addConstraints(){
        
        NSLayoutConstraint.activate([
            
            drinkRecipe1Button.heightAnchor.constraint(equalToConstant: 70),
            drinkRecipe1Button.widthAnchor.constraint(equalToConstant: 55),
            
            drink2.heightAnchor.constraint(equalToConstant: 70),
            drink2.widthAnchor.constraint(equalToConstant: 55),
            
            drink3.heightAnchor.constraint(equalToConstant: 70),
            drink3.widthAnchor.constraint(equalToConstant: 55),
            
            drink4.heightAnchor.constraint(equalToConstant: 70),
            drink4.widthAnchor.constraint(equalToConstant: 55),
        
        ])
    }
}
