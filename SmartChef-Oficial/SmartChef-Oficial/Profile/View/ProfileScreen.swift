import UIKit

protocol ProfileScreenProtocol: AnyObject{
    func tapToExit()
    func tapToChangeImage()
    func tapToDelete()
}

class ProfileScreen: UIView {
    
    weak private var profileScreenProtocol: ProfileScreenProtocol?
    
    public func setupDelegate(delegate: ProfileScreenProtocol){
        self.profileScreenProtocol = delegate
    }
    
    lazy var whiteContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .whiteBase
        view.layer.cornerRadius = 180
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowRadius = 2
        return view
    }()
    
    lazy var backgroundMainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .whiteBase
        view.layer.cornerRadius = 75
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowRadius = 2
        return view
    }()
    
    lazy var profileUserImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 70
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: .smile)
        return image
    }()
    
    lazy var underChangeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .whiteBase
        view.layer.cornerRadius = 15
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowRadius = 2
        return view
    }()

    
    lazy var changerPicButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "camera.circle.fill"), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.tintColor = UIColor.yellowBase
        button.addTarget(self, action: #selector(tapchooseImage), for: .touchUpInside)
        
        return button
    }()
    
    lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Olá,"
        label.font = .sugarFont24
        label.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .sugarFont20
        label.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return label
    }()
 
    
    lazy var deleteAccountButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Deletar Conta", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.whiteBase, for: .normal)
        button.backgroundColor = .brownBase
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tappedDeleteAccount), for: .touchUpInside)
        return button
    }()
    
    lazy var exitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(.exibTitleButton, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(tappedExitButton), for: .touchUpInside)
        return button
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        AddViews()
        setConstraint()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError(.fatalErrorInit)
    }
    
    private func AddViews() {
        
        self.addSubview(self.whiteContainer)
        self.addSubview(self.backgroundMainView)
        self.addSubview(self.profileUserImage)
        self.addSubview(self.underChangeView)
        self.addSubview(self.changerPicButton)
        self.addSubview(self.helloLabel)
        self.addSubview(self.nameLabel)
        self.addSubview(self.deleteAccountButton)
        self.addSubview(self.exitButton)
        
        subviews.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        guard let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardHeight = keyboardSize.cgRectValue.height
        
        UIView.animate(withDuration: 0.3) {
            self.frame.origin.y = -(keyboardHeight / 2)
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        UIView.animate(withDuration: 0.3) {
            self.frame.origin.y = 0
        }
    }
    
    @objc private func tappedExitButton() {
        profileScreenProtocol?.tapToExit()
    }
    
    @objc private func tappedDeleteAccount() {
        profileScreenProtocol?.tapToDelete()
    }
    
    @objc private func tapchooseImage() {
        profileScreenProtocol?.tapToChangeImage()
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
        
            whiteContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 200),
            whiteContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -30),
            whiteContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 30),
            whiteContainer.topAnchor.constraint(equalTo: topAnchor, constant: 150),
            
            backgroundMainView.heightAnchor.constraint(equalToConstant: 150),
            backgroundMainView.widthAnchor.constraint(equalToConstant: 150),
            backgroundMainView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            backgroundMainView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            
            profileUserImage.heightAnchor.constraint(equalToConstant: 140),
            profileUserImage.widthAnchor.constraint(equalToConstant: 140),
            profileUserImage.centerXAnchor.constraint(equalTo: backgroundMainView.centerXAnchor),
            profileUserImage.centerYAnchor.constraint(equalTo: backgroundMainView.centerYAnchor),
    
            underChangeView.heightAnchor.constraint(equalToConstant: 30),
            underChangeView.widthAnchor.constraint(equalToConstant: 30),
            underChangeView.centerXAnchor.constraint(equalTo: profileUserImage.centerXAnchor, constant: 50),
            underChangeView.centerYAnchor.constraint(equalTo: profileUserImage.centerYAnchor, constant: 50),
            
            changerPicButton.centerXAnchor.constraint(equalTo: underChangeView.centerXAnchor),
            changerPicButton.centerYAnchor.constraint(equalTo: underChangeView.centerYAnchor),
            changerPicButton.heightAnchor.constraint(equalToConstant: 25),
            changerPicButton.widthAnchor.constraint(equalToConstant: 25),
            
            helloLabel.topAnchor.constraint(equalTo: profileUserImage.bottomAnchor, constant: 45),
            helloLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
        
            nameLabel.bottomAnchor.constraint(equalTo: helloLabel.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: helloLabel.trailingAnchor, constant: 5),
            
            deleteAccountButton.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 20),
            deleteAccountButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            deleteAccountButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            deleteAccountButton.heightAnchor.constraint(equalToConstant: 35),
            
            exitButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            exitButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
    }
}
