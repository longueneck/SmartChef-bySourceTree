import UIKit

class LoadingViewController: UIViewController {
    private var loadingIndicator: UIActivityIndicatorView!

        override func viewDidLoad() {
            super.viewDidLoad()

            loadingIndicator = UIActivityIndicatorView(style: .large)
            loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
            loadingIndicator.color = .gray

            view.addSubview(loadingIndicator)

            NSLayoutConstraint.activate([
                loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        }

        func showLoading() {
            loadingIndicator.startAnimating()
        }

        func hideLoading() {
            loadingIndicator.stopAnimating()
        }
    }
    
