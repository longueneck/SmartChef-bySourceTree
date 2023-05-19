import UIKit

protocol ProfileScreenProtocol: AnyObject{
    
    func tapToExit()
    func tapToCancel()
    func tapToSave()
    func tapToChangeImage()
}

class ProfileScreen: UIView {
    
    weak private var profileScreenProtocol: ProfileScreenProtocol?
    
    func setupDelegate(delegate: ProfileScreenProtocol){
        self.profileScreenProtocol = delegate
    }
    
    lazy var cancelButton: UIButton = {
        let cancel = UIButton()
        cancel.translatesAutoresizingMaskIntoConstraints = false
        cancel.setTitle("Cancelar", for: .normal)
        cancel.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        cancel.setTitleColor(UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1), for: .normal)
        cancel.addTarget(self, action: #selector(tappetCancelButton), for: .touchUpInside)
        return cancel
    }()
    
    lazy var saveButton: UIButton = {
        let save = UIButton()
        save.translatesAutoresizingMaskIntoConstraints = false
        save.setTitle("Salvar", for: .normal)
        save.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        save.setTitleColor(UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1), for: .normal)
        save.addTarget(self, action: #selector(tappedSaveButton), for: .touchUpInside)
        return save
    }()
    
    lazy var backgroundMainView: UIView = {
        let bg = UIView()
        bg.translatesAutoresizingMaskIntoConstraints = false
        bg.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        bg.layer.cornerRadius = 75
        bg.layer.shadowColor = UIColor.black.cgColor
        bg.layer.shadowOpacity = 0.3
        bg.layer.shadowOffset = CGSize(width: 0, height: 3)
        bg.layer.shadowRadius = 2
        return bg
    }()
    
    lazy var profileUserImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 70
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "sorria")
        return imageView
    }()
    
    lazy var backButtom: UIButton = {
        let back = UIButton()
        return back
    }()
    
    lazy var yellowView: UIView = {
        let bg = UIView()
        bg.translatesAutoresizingMaskIntoConstraints = false
        bg.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 20/255, alpha: 1)
        return bg
    }()
    
    lazy var ballsImage: UIImageView = {
        let balls = UIImageView()
        balls.translatesAutoresizingMaskIntoConstraints = false
        balls.image = UIImage(named: "balls2")
        balls.contentMode = .scaleAspectFit
        return balls
    }()
    
    lazy var changerPicButton: UIButton = {
        let change = UIButton()
        change.translatesAutoresizingMaskIntoConstraints = false
        change.setTitle("Alterar imagem", for: .normal)
        change.setTitleColor(UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1), for: .normal)
        change.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        change.addTarget(self, action: #selector(tapchooseImage), for: .touchUpInside)
        change.layer.cornerRadius = 10
        return change
    }()
    
    
    lazy var nameLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Nome"
        name.font = UIFont.boldSystemFont(ofSize: 16)
        name.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return name
    }()
    
    lazy var nameTextField: UITextField = {
        let tfname = UITextField()
        tfname.translatesAutoresizingMaskIntoConstraints = false
        tfname.backgroundColor = .white
        tfname.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        tfname.placeholder = "Insira seu nome completo"
        tfname.layer.cornerRadius = 10
        let paddinView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tfname.frame.height))
        tfname.leftView = paddinView
        tfname.leftViewMode = .always
        return tfname
    }()
    
    
    lazy var pencilImage: UIImageView = {
        let pencil = UIImageView()
        pencil.translatesAutoresizingMaskIntoConstraints = false
        pencil.image = UIImage(systemName: "pencil")
        pencil.contentMode = .scaleAspectFit
        pencil.tintColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(editPencil1(tapGestureRecognizer:)))
        pencil.isUserInteractionEnabled = true
        pencil.addGestureRecognizer(tapGestureRecognizer)
        
        return pencil
    }()
    
    lazy var emailLabel: UILabel = {
        let email = UILabel()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.text = "Email"
        email.font = UIFont.boldSystemFont(ofSize: 16)
        email.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        
        return email
    }()
    
    lazy var emailTextField: UITextField = {
        let email = UITextField()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.backgroundColor = .white
        email.placeholder = "Insira seu Email"
        email.layer.cornerRadius = 10
        email.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        let paddinView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: email.frame.height))
        email.leftView = paddinView
        email.leftViewMode = .always
        
        return email
    }()
    
    lazy var pencilChance2: UIImageView = {
        let pencil = UIImageView()
        pencil.translatesAutoresizingMaskIntoConstraints = false
        pencil.image = UIImage(systemName: "pencil")
        pencil.contentMode = .scaleAspectFit
        pencil.tintColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(editPencil2(tapGestureRecognizer:)))
        pencil.isUserInteractionEnabled = true
        pencil.addGestureRecognizer(tapGestureRecognizer)
        
        return pencil
    }()
    
    lazy var passwordLabel: UILabel = {
        let email = UILabel()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.text = "Senha"
        email.font = UIFont.boldSystemFont(ofSize: 16)
        email.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        
        return email
    }()
    
    lazy var passwordTextField: UITextField = {
        let email = UITextField()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.backgroundColor = .white
        email.placeholder = "Insira sua senha"
        email.layer.cornerRadius = 10
        email.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        let paddinView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: email.frame.height))
        email.leftView = paddinView
        email.leftViewMode = .always
        
        return email
    }()
    
    lazy var pencilChance3: UIImageView = {
        let pencil = UIImageView()
        pencil.translatesAutoresizingMaskIntoConstraints = false
        pencil.image = UIImage(systemName: "pencil")
        pencil.contentMode = .scaleAspectFit
        pencil.tintColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(editPencil3(tapGestureRecognizer:)))
        pencil.isUserInteractionEnabled = true
        pencil.addGestureRecognizer(tapGestureRecognizer)
        return pencil
    }()
    
    lazy var exitButton: UIButton = {
        
        let cancel = UIButton()
        cancel.translatesAutoresizingMaskIntoConstraints = false
        cancel.setTitle("Sair", for: .normal)
        cancel.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        cancel.setTitleColor(UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1), for: .normal)
        cancel.addTarget(self, action: #selector(tappedExitButton), for: .touchUpInside)
        
        return cancel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        funcAddViews()
        funcAddConstraint()
        disableAllTextFields()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func funcAddViews(){
        
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
    
    
    func disableAllTextFields(){
        self.nameTextField.isEnabled = false
        self.passwordTextField.isEnabled = false
        self.emailTextField.isEnabled = false
    }
    
    func chooseTextFieldEnable(textField: UITextField){
        switch textField{
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
    
    
    @objc func editPencil1(tapGestureRecognizer: UITapGestureRecognizer) {
        chooseTextFieldEnable(textField: self.nameTextField)
    }
    
    @objc func editPencil2(tapGestureRecognizer: UITapGestureRecognizer) {
        chooseTextFieldEnable(textField: self.emailTextField)
    }
    
    @objc func editPencil3(tapGestureRecognizer: UITapGestureRecognizer) {
        chooseTextFieldEnable(textField: self.passwordTextField)
    }
    
    @objc func tappedExitButton(){
        profileScreenProtocol?.tapToExit()
    }
    
    @objc func tappetCancelButton(){
        profileScreenProtocol?.tapToCancel()
    }
    
    @objc func tappedSaveButton(){
        profileScreenProtocol?.tapToSave()
    }
    
    @objc func tapchooseImage(){
        profileScreenProtocol?.tapToChangeImage()
    }
    
    private func funcAddConstraint(){
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
