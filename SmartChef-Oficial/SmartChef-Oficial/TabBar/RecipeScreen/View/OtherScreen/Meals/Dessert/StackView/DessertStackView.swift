import UIKit

class DessertStackView: UIStackView {

        lazy var hotRecipe1: UIButton = {
            let option1 = UIButton()
            option1.translatesAutoresizingMaskIntoConstraints = false
            option1.tintColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
            option1.layer.cornerRadius = 8
            option1.clipsToBounds = true
            option1.imageView?.contentMode = .scaleAspectFill
            option1.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
            let buttonImage = UIImage(named: "suco")
            option1.setImage(buttonImage, for: .normal)
            
            return option1
        }()
        
        lazy var hotRecipe2: UIButton = {
            let option2 = UIButton()
            option2.translatesAutoresizingMaskIntoConstraints = false
            option2.tintColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
            option2.layer.cornerRadius = 8
            option2.imageView?.contentMode = .scaleAspectFill
            option2.clipsToBounds = true
            option2.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
            let buttonImage = UIImage(named: "cha")
            option2.setImage(buttonImage, for: .normal)
            
            return option2
        }()
        
        lazy var hotRecipe3: UIButton = {
            let option3 = UIButton()
            option3.translatesAutoresizingMaskIntoConstraints = false
            option3.tintColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
            option3.layer.cornerRadius = 8
            option3.imageView?.contentMode = .scaleAspectFill
            option3.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
            option3.clipsToBounds = true
            let buttonImage = UIImage(named: "expresso")
            option3.setImage(buttonImage, for: .normal)
            
            return option3
        }()
        
        lazy var hotRecipe4: UIButton = {
            let option4 = UIButton()
            option4.translatesAutoresizingMaskIntoConstraints = false
            option4.tintColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
            option4.layer.cornerRadius = 8
            option4.imageView?.contentMode = .scaleAspectFill
            option4.clipsToBounds = true
            option4.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
            let buttonImage = UIImage(named: "refrigerante")
            option4.setImage(buttonImage, for: .normal)
            
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
            self.addArrangedSubview(self.hotRecipe1)
            self.addArrangedSubview(self.hotRecipe2)
            self.addArrangedSubview(self.hotRecipe3)
            self.addArrangedSubview(self.hotRecipe4)
        }
        
        func addConstraints(){
            
            NSLayoutConstraint.activate([
                
                hotRecipe1.heightAnchor.constraint(equalToConstant: 70),
                hotRecipe1.widthAnchor.constraint(equalToConstant: 55),
                
                hotRecipe2.heightAnchor.constraint(equalToConstant: 70),
                hotRecipe2.widthAnchor.constraint(equalToConstant: 55),
                
                hotRecipe3.heightAnchor.constraint(equalToConstant: 70),
                hotRecipe3.widthAnchor.constraint(equalToConstant: 55),
                
                hotRecipe4.heightAnchor.constraint(equalToConstant: 70),
                hotRecipe4.widthAnchor.constraint(equalToConstant: 55),
            
            ])
        }
    }

    


