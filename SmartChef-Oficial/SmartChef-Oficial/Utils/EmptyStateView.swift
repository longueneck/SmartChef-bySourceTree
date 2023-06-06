import UIKit
class EmptyStateView: UIView {
    
    let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            
            imageView.image = UIImage(named: "logo") //preciso mudar a imagem depois
            return imageView
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
        }
    
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
        
        private func setupViews() {
            addSubview(imageView)
            
            NSLayoutConstraint.activate([
                imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
                imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
                imageView.widthAnchor.constraint(equalToConstant: 200),
                imageView.heightAnchor.constraint(equalToConstant: 200)
            ])
        }

    
}
