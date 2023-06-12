

import UIKit

class StarsStackView: UIStackView {
    
    lazy var star1: UIButton = {
        let star = UIButton()
        star.translatesAutoresizingMaskIntoConstraints = false
        star.setImage(UIImage(systemName: "star.fill"), for: .normal)
        star.tintColor = UIColor(red: 255/255, green: 177/255, blue: 20/255, alpha: 1)
        return star
    }()
    
    lazy var star2: UIButton = {
        let star = UIButton()
        star.translatesAutoresizingMaskIntoConstraints = false
        star.setImage(UIImage(systemName: "star.fill"), for: .normal)
        star.tintColor = UIColor(red: 255/255, green: 177/255, blue: 20/255, alpha: 1)
        return star
    }()
    
    lazy var star3: UIButton = {
        let star = UIButton()
        star.translatesAutoresizingMaskIntoConstraints = false
        star.setImage(UIImage(systemName: "star.fill"), for: .normal)
        star.tintColor = UIColor(red: 255/255, green: 177/255, blue: 20/255, alpha: 1)
        return star
    }()
    
    lazy var star4: UIButton = {
        let star = UIButton()
        star.translatesAutoresizingMaskIntoConstraints = false
        star.setImage(UIImage(systemName: "star.fill"), for: .normal)
        star.tintColor = UIColor(red: 255/255, green: 177/255, blue: 20/255, alpha: 1)
        return star
    }()
    
    lazy var star5: UIButton = {
        let star = UIButton()
        star.translatesAutoresizingMaskIntoConstraints = false
        star.setImage(UIImage(systemName: "star.fill"), for: .normal)
        star.tintColor = UIColor(red: 255/255, green: 177/255, blue: 20/255, alpha: 1)
        
        return star
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addElements()
        setupElements()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements(){
        
        self.addArrangedSubview(self.star1)
        self.addArrangedSubview(self.star2)
        self.addArrangedSubview(self.star3)
        self.addArrangedSubview(self.star4)
        self.addArrangedSubview(self.star5)
    }
    
    private func setupElements(){
        NSLayoutConstraint.activate([
            
            star1.heightAnchor.constraint(equalToConstant: 30),
            star1.widthAnchor.constraint(equalToConstant: 30),
            
            star2.heightAnchor.constraint(equalToConstant: 30),
            star2.widthAnchor.constraint(equalToConstant: 30),
            
            star3.heightAnchor.constraint(equalToConstant: 30),
            star3.widthAnchor.constraint(equalToConstant: 30),
        
            star4.heightAnchor.constraint(equalToConstant: 30),
            star4.widthAnchor.constraint(equalToConstant: 30),
            
            star5.heightAnchor.constraint(equalToConstant: 30),
            star5.widthAnchor.constraint(equalToConstant: 30),
        
        ])
    }
}
