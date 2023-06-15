import UIKit

class PrepairScreen: UIView {
    
    lazy var recipeImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .red
    return image
    }()
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError(.fatalErrorInit)
    }
    
}
