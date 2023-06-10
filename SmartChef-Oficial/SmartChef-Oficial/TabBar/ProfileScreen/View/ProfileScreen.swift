import UIKit

protocol ProfileScreenProtocol: AnyObject{
    func tapToExit()
    func tapToCancel()
    func tapToSave()
    func tapToChangeImage()
}

class ProfileScreen: UIView {
    
    weak private var profileScreenProtocol: ProfileScreenProtocol?
    
    public func setupDelegate(delegate: ProfileScreenProtocol){
        self.profileScreenProtocol = delegate
    }
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(StringMagica.cancel, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(tappetCancelButton), for: .touchUpInside)
        return button
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(StringMagica.save, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(tappedSaveButton), for: .touchUpInside)
        return button
    }()
    
    lazy var backgroundMainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
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
        image.image = UIImage(named: StringMagica.smile)
        return image
    }()
    
    lazy var backButtom: UIButton = {
        let button = UIButton()
        return button
    }()
    
    lazy var yellowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 20/255, alpha: 1)
        return view
    }()
    
    lazy var ballsImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: StringMagica.levelLabel)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var changerPicButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(StringMagica.changeImage, for: .normal)
        button.setTitleColor(UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(tapchooseImage), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = StringMagica.nameLabel
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        textField.placeholder = StringMagica.enterYourFullName
        textField.layer.cornerRadius = 10
        let paddinView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddinView
        textField.leftViewMode = .always
        return textField
    }()
    
    lazy var pencilImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: StringMagica.pencilImage)
        image.contentMode = .scaleAspectFit
        image.tintColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(editPencil1(tapGestureRecognizer:)))
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(tapGestureRecognizer)
        return image
    }()
    
    lazy var emailLabel: UILabel = {
        let email = UILabel()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.text = StringMagica.emailTitleLabel
        email.font = UIFont.boldSystemFont(ofSize: 16)
        email.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return email
    }()
    
    lazy var emailTextField: UITextField = {
        let email = UITextField()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.backgroundColor = .white
        email.placeholder = StringMagica.emailPlaceholder
        email.layer.cornerRadius = 10
        email.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        let paddinView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: email.frame.height))
        email.leftView = paddinView
        email.leftViewMode = .always
        return email
    }()
    
    lazy var pencilChance2: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: StringMagica.pencilImage)
        image.contentMode = .scaleAspectFit
        image.tintColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(editPencil2(tapGestureRecognizer:)))
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(tapGestureRecognizer)
        return image
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = StringMagica.passwordTitleLabel
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.placeholder = StringMagica.passwordPlaceholder
        textField.layer.cornerRadius = 10
        textField.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        let paddinView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddinView
        textField.leftViewMode = .always
        return textField
    }()
    
    lazy var pencilChance3: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: StringMagica.pencilImage)
        image.contentMode = .scaleAspectFit
        image.tintColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(editPencil3(tapGestureRecognizer:)))
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(tapGestureRecognizer)
        return image
    }()
    
    lazy var exitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(StringMagica.exibTitleButton, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(tappedExitButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        AddViews()
        setConstraint()
        disableAllTextFields()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func AddViews() {
        self.addSubview(self.cancelButton)
        self.addSubview(self.saveButton)
        self.addSubview(self.backgroundMainView)
        self.addSubview(self.profileUserImage)
        self.addSubview(self.yellowView)
        self.addSubview(self.ballsImage)
        self.addSubview(self.changerPicButton)
        self.addSubview(self.nameLabel)
        self.addSubview(self.nameTextField)
        self.addSubview(self.pencilImage)
        self.addSubview(self.emailLabel)
        self.addSubview(self.emailTextField)
        self.addSubview(self.pencilChance2)
        self.addSubview(self.passwordLabel)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.pencilChance3)
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
    
    private func disableAllTextFields() {
        self.nameTextField.isEnabled = false
        self.passwordTextField.isEnabled = false
        self.emailTextField.isEnabled = false
    }
    
    func chooseTextFieldEnable(textField: UITextField) {
        switch textField {
        case self.nameTextField:
            
            self.nameTextField.isEnabled = true
            self.nameTextField.becomeFirstResponder()
            
        case self.emailTextField:
            
            self.emailTextField.isEnabled = true
            self.emailTextField.becomeFirstResponder()
            
        case self.passwordTextField:
            
            self.passwordTextField.isEnabled = true
            self.passwordTextField.becomeFirstResponder()
            
        default:
            textField.isEnabled = false
        }
    }
    
    @objc private func editPencil1(tapGestureRecognizer: UITapGestureRecognizer) {
        chooseTextFieldEnable(textField: self.nameTextField)
    }
    
    @objc private func editPencil2(tapGestureRecognizer: UITapGestureRecognizer) {
        chooseTextFieldEnable(textField: self.emailTextField)
    }
    
    @objc private func editPencil3(tapGestureRecognizer: UITapGestureRecognizer) {
        chooseTextFieldEnable(textField: self.passwordTextField)
    }
    
    @objc private func tappedExitButton() {
        profileScreenProtocol?.tapToExit()
    }
    
    @objc private func tappetCancelButton() {
        profileScreenProtocol?.tapToCancel()
    }
    
    @objc private func tappedSaveButton() {
        profileScreenProtocol?.tapToSave()
    }
    
    @objc private func tapchooseImage() {
        profileScreenProtocol?.tapToChangeImage()
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            
            cancelButton.topAnchor.constraint(equalTo: backgroundMainView.topAnchor),
            cancelButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            saveButton.topAnchor.constraint(equalTo: backgroundMainView.topAnchor),
            saveButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            backgroundMainView.heightAnchor.constraint(equalToConstant: 150),
            backgroundMainView.widthAnchor.constraint(equalToConstant: 150),
            backgroundMainView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            backgroundMainView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            
            profileUserImage.heightAnchor.constraint(equalToConstant: 140),
            profileUserImage.widthAnchor.constraint(equalToConstant: 140),
            profileUserImage.centerXAnchor.constraint(equalTo: backgroundMainView.centerXAnchor),
            profileUserImage.centerYAnchor.constraint(equalTo: backgroundMainView.centerYAnchor),
            
            changerPicButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            changerPicButton.topAnchor.constraint(equalTo: backgroundMainView.bottomAnchor, constant: 10),
            
            yellowView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            yellowView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            yellowView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            yellowView.topAnchor.constraint(equalTo: changerPicButton.bottomAnchor, constant: 30),
            
            ballsImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            ballsImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            ballsImage.centerYAnchor.constraint(equalTo: yellowView.topAnchor, constant: 0),
            ballsImage.heightAnchor.constraint(equalToConstant: 45),
            
            nameLabel.topAnchor.constraint(equalTo: ballsImage.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            nameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            pencilImage.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor, constant: -15),
            pencilImage.centerYAnchor.constraint(equalTo: nameTextField.centerYAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 8),
            emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            pencilChance2.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor, constant: -15),
            pencilChance2.centerYAnchor.constraint(equalTo: emailTextField.centerYAnchor),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 8),
            passwordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            pencilChance3.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: -15),
            pencilChance3.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
            
            exitButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            exitButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
    }
}
