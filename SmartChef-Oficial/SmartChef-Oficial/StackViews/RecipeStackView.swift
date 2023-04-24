
import UIKit


protocol RecipeStackViewProtocol:AnyObject{
    func goToHot()
    func goToBreakfast()
    func goToSnack()
    func goToLunch()
    func goToDessert()
}

class RecipeStackView: UIStackView {
    
    weak private var delegate:RecipeStackViewProtocol?
    
    func delegate(delegate:RecipeStackViewProtocol){
        self.delegate = delegate
    }
    
    lazy var recipeType1: UIButton = {
        let hot = UIButton()
        hot.translatesAutoresizingMaskIntoConstraints = false
        hot.tintColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        hot.layer.cornerRadius = 8
        hot.contentMode = .scaleAspectFit
        hot.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        let buttonImage = UIImage(named: "hot")
        hot.setImage(buttonImage, for: .normal)
        hot.addTarget(self, action: #selector(self.goToHotMeals), for: .touchUpInside)
        
        return hot
    }()
    
    lazy var recipeType2: UIButton = {
        let option1 = UIButton()
        option1.translatesAutoresizingMaskIntoConstraints = false
        option1.tintColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        option1.layer.cornerRadius = 8
        option1.contentMode = .scaleAspectFit
        option1.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        let buttonImage = UIImage(named: "cafe")
        option1.setImage(buttonImage, for: .normal)
        option1.addTarget(self, action: #selector(self.goToBreakfast), for: .touchUpInside)
        
        return option1
    }()
    
    lazy var recipeType3: UIButton = {
        let option2 = UIButton()
        option2.translatesAutoresizingMaskIntoConstraints = false
        option2.tintColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        option2.layer.cornerRadius = 8
        option2.contentMode = .scaleAspectFit
        option2.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        let buttonImage = UIImage(named: "lanche")
        option2.setImage(buttonImage, for: .normal)
        option2.addTarget(self, action: #selector(self.goToSnack), for: .touchUpInside)
        
        return option2
    }()
    
    lazy var recipeType4: UIButton = {
        let option3 = UIButton()
        option3.translatesAutoresizingMaskIntoConstraints = false
        option3.tintColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        option3.layer.cornerRadius = 8
        option3.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        let buttonImage = UIImage(named: "pratos")
        option3.setImage(buttonImage, for: .normal)
        option3.addTarget(self, action: #selector(self.goToLunch), for: .touchUpInside)
        
        return option3
    }()
    
    lazy var recipeType5: UIButton = {
        let option4 = UIButton()
        option4.translatesAutoresizingMaskIntoConstraints = false
        option4.tintColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        option4.layer.cornerRadius = 8
        option4.contentMode = .scaleAspectFit
        option4.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        let buttonImage = UIImage(named: "sobremesa")
        option4.setImage(buttonImage, for: .normal)
        option4.addTarget(self, action: #selector(self.goToDessert), for: .touchUpInside)
        
        return option4
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
        self.addArrangedSubview(self.recipeType1)
        self.addArrangedSubview(self.recipeType2)
        self.addArrangedSubview(self.recipeType3)
        self.addArrangedSubview(self.recipeType4)
        self.addArrangedSubview(self.recipeType5)
    }
    
    @objc private func goToHotMeals(){
        self.delegate?.goToHot()
    }
    
    @objc private func goToBreakfast(){
        self.delegate?.goToBreakfast()
    }
    
    @objc private func goToSnack(){
        self.delegate?.goToSnack()
    }
    
    @objc private func goToLunch(){
        self.delegate?.goToLunch()
    }
    
    @objc private func goToDessert(){
        self.delegate?.goToDessert()
    }
    
    private func addConstraints(){
        
        NSLayoutConstraint.activate([
            
            
            recipeType1.heightAnchor.constraint(equalToConstant: 70),
            recipeType1.widthAnchor.constraint(equalToConstant: 55),
            
            recipeType2.heightAnchor.constraint(equalToConstant: 70),
            recipeType2.widthAnchor.constraint(equalToConstant: 55),
            
            recipeType3.heightAnchor.constraint(equalToConstant: 70),
            recipeType3.widthAnchor.constraint(equalToConstant: 55),
            
            recipeType4.heightAnchor.constraint(equalToConstant: 70),
            recipeType4.widthAnchor.constraint(equalToConstant: 55),
            
            recipeType5.heightAnchor.constraint(equalToConstant: 70),
            recipeType5.widthAnchor.constraint(equalToConstant: 55),
        ])
        
        
    }
}
