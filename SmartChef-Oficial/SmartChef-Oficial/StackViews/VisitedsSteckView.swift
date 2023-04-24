import UIKit

class VisitedsSteckView: UIStackView {

    lazy var visited1: UIButton = {
        let hot = UIButton()
        hot.translatesAutoresizingMaskIntoConstraints = false
        hot.tintColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        hot.layer.cornerRadius = 8
        hot.clipsToBounds = true
        hot.imageView?.contentMode = .scaleAspectFill
        hot.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        let buttonImage = UIImage(named: "suco")
        hot.setImage(buttonImage, for: .normal)
        
        return hot
    }()
    
    lazy var visited2: UIButton = {
        let option1 = UIButton()
        option1.translatesAutoresizingMaskIntoConstraints = false
        option1.tintColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        option1.layer.cornerRadius = 8
        option1.imageView?.contentMode = .scaleAspectFill
        option1.clipsToBounds = true
        option1.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        let buttonImage = UIImage(named: "cha")
        option1.setImage(buttonImage, for: .normal)
        
        return option1
    }()
    
    lazy var visited3: UIButton = {
        let option2 = UIButton()
        option2.translatesAutoresizingMaskIntoConstraints = false
        option2.tintColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        option2.layer.cornerRadius = 8
        option2.imageView?.contentMode = .scaleAspectFill
        option2.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        option2.clipsToBounds = true
        let buttonImage = UIImage(named: "expresso")
        option2.setImage(buttonImage, for: .normal)
        
        return option2
    }()
    
    lazy var visited4: UIButton = {
        let option3 = UIButton()
        option3.translatesAutoresizingMaskIntoConstraints = false
        option3.tintColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        option3.layer.cornerRadius = 8
        option3.imageView?.contentMode = .scaleAspectFill
        option3.clipsToBounds = true
        option3.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        let buttonImage = UIImage(named: "refrigerante")
        option3.setImage(buttonImage, for: .normal)
        
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
        self.addArrangedSubview(self.visited1)
        self.addArrangedSubview(self.visited2)
        self.addArrangedSubview(self.visited3)
        self.addArrangedSubview(self.visited4)
    }
    
    func addConstraints(){
        
        NSLayoutConstraint.activate([
            
            visited1.heightAnchor.constraint(equalToConstant: 70),
            visited1.widthAnchor.constraint(equalToConstant: 55),
            
            visited2.heightAnchor.constraint(equalToConstant: 70),
            visited2.widthAnchor.constraint(equalToConstant: 55),
            
            visited3.heightAnchor.constraint(equalToConstant: 70),
            visited3.widthAnchor.constraint(equalToConstant: 55),
            
            visited4.heightAnchor.constraint(equalToConstant: 70),
            visited4.widthAnchor.constraint(equalToConstant: 55),
        
        ])
    }
}
