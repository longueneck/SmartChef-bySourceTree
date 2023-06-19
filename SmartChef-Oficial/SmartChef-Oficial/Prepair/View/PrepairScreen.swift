import UIKit

class PrepairScreen: UIView {
    
    private var textResponse: TextGPTResponseModel?
    
    lazy var recipeImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .red
    return image
    }()
    
    lazy var recipeText: UILabel = {
        let image = UILabel()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.textColor = .red
        image.text = "Kevin"
        
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
//        self.addSubview(self.recipeImageView)
        self.addSubview(self.recipeText)
    }
//
//    func setText(text: ){
//        recipeText.text = text
//    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
        
            recipeText.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            recipeText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            recipeText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -20),
            recipeText.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
}

