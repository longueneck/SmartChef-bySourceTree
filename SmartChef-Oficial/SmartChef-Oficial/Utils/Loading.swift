import UIKit

final class Loading {
    
    private var viewController: UIViewController
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.brownBase
        
        return view
    }()
    private lazy var activityIndicatorView : UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.color = .gray
        activityIndicatorView.style = .large
        return activityIndicatorView
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .yellowBase
        label.font = .sugarFont24
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    private func addElements() {
        containerView.addSubview(activityIndicatorView)
        containerView.addSubview(messageLabel)
        viewController.view.addSubview(containerView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
        
            containerView.topAnchor.constraint(equalTo: viewController.view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor),
            
            activityIndicatorView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
            messageLabel.topAnchor.constraint(equalTo: activityIndicatorView.bottomAnchor, constant: 20),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
        ])
    }
    
    public func show(message: String? = nil) {
        addElements()
        configConstraints()
        messageLabel.text = message
        messageLabel.isHidden = message == nil
        activityIndicatorView.startAnimating()
    }
    
    public func hide() {
        activityIndicatorView.stopAnimating()
        containerView.removeFromSuperview()
    }


}
