import UIKit

protocol RegisterScreenProtocol: AnyObject{
    
    func registerButton()
    func tapToBack()
    
}

class RegisterScreen: UIView {
    
    weak private var registerScreenProtocol: RegisterScreenProtocol?
    
    func delegate(delegate: RegisterScreenProtocol){
        self.registerScreenProtocol = delegate
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrowshape.turn.up.backward.fill"), for: .normal)
        button.tintColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        button.addTarget(self, action: #selector(tapToBack), for: .touchUpInside)
        return button
    }()
    
    lazy var createAccountLabel: UILabel = {
        let welcome = UILabel()
        welcome.translatesAutoresizingMaskIntoConstraints = false
        welcome.text = "Crie sua conta >"
        welcome.font = UIFont(name: "Nice Sugar", size: 24)
        welcome.textColor = UIColor(red: 255/255, green: 177/255, blue: 20/255, alpha: 1)
        return welcome
    }()
    
    lazy var textPresentLabel: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Cozinhe com ingredientes da sua dispensa"
        text.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        text.font = UIFont(name: "Nice Sugar", size: 14)
        return text
    }()
    
    lazy var usernameLabel: UILabel = {
        let textPresentation = UILabel()
        textPresentation.translatesAutoresizingMaskIntoConstraints = false
        textPresentation.text = "Nome de usuário"
        textPresentation.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        textPresentation.font = UIFont.systemFont(ofSize: 17)
        return textPresentation
    }()
    
    lazy var userTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.backgroundColor = .white
        textfield.layer.borderColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1).cgColor
        textfield.layer.borderWidth = 2
        textfield.borderStyle = .roundedRect
        textfield.layer.cornerRadius = 10
        textfield.layer.shadowColor = UIColor.black.cgColor
        textfield.layer.shadowOpacity = 0.1
        textfield.layer.shadowOffset = CGSize(width: 0, height: 2)
        textfield.layer.shadowRadius = 2
        textfield.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return textfield
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "E-mail"
        label.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.backgroundColor = .white
        textfield.layer.borderColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1).cgColor
        textfield.layer.borderWidth = 2
        textfield.layer.cornerRadius = 10
        textfield.layer.shadowColor = UIColor.black.cgColor
        textfield.layer.shadowOpacity = 0.1
        textfield.layer.shadowOffset = CGSize(width: 0, height: 2)
        textfield.layer.shadowRadius = 2
        textfield.borderStyle = .roundedRect
        textfield.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        textfield.autocapitalizationType = .sentences
        textfield.keyboardType = .emailAddress
        return textfield
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Senha"
        label.textColor = UIColor(red: 69/255, green: 48/255, blue: 22/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    lazy var passwordTextfield: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.backgroundColor = .white
        textfield.layer.borderColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1).cgColor
        textfield.layer.borderWidth = 2
        textfield.layer.cornerRadius = 10
        textfield.layer.shadowColor = UIColor.black.cgColor
        textfield.layer.shadowOpacity = 0.1
        textfield.layer.shadowOffset = CGSize(width: 0, height: 2)
        textfield.layer.shadowRadius = 2
        textfield.borderStyle = .roundedRect
        textfield.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return textfield
    }()
    
    lazy var confirmPasswordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Confirmar senha"
        label.textColor = UIColor(red: 69/255, green: 48/255, blue: 22/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    lazy var confirmPasswordTextfield: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.backgroundColor = .white
        textfield.layer.borderColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1).cgColor
        textfield.layer.borderWidth = 2
        textfield.layer.cornerRadius = 10
        textfield.layer.shadowColor = UIColor.black.cgColor
        textfield.layer.shadowOpacity = 0.1
        textfield.layer.shadowOffset = CGSize(width: 0, height: 2)
        textfield.layer.shadowRadius = 2
        textfield.borderStyle = .roundedRect
        textfield.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return textfield
    }()
    
    lazy var createButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Criar conta", for: .normal)
        button.setTitleColor(UIColor(red: 69/255, green: 48/255, blue: 22/255, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.1
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 2
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(tapToRegister), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setConstraints()
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        self.addSubview(backButton)
        self.addSubview(createAccountLabel)
        self.addSubview(textPresentLabel)
        self.addSubview(usernameLabel)
        self.addSubview(userTextField)
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextfield)
        self.addSubview(confirmPasswordLabel)
        self.addSubview(confirmPasswordTextfield)
        self.addSubview(createButton)
    }
    
    @objc func tapToRegister(){
        registerScreenProtocol?.registerButton()
    }
    
    @objc func tapToBack(){
        registerScreenProtocol?.tapToBack()

    }
    
   
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            backButton.heightAnchor.constraint(equalToConstant: 50),
            backButton.widthAnchor.constraint(equalToConstant: 50),
            
            createAccountLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 80),
            createAccountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            
            textPresentLabel.topAnchor.constraint(equalTo: createAccountLabel.bottomAnchor, constant: 5),
            textPresentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            
            usernameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            usernameLabel.topAnchor.constraint(equalTo: textPresentLabel.bottomAnchor, constant: 25),
            
            userTextField.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 5),
            userTextField.heightAnchor.constraint(equalToConstant: 45),
            userTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            userTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            
            emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            emailLabel.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 10),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5),
            emailTextField.heightAnchor.constraint(equalToConstant: 45),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            
            passwordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            
            passwordTextfield.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            passwordTextfield.heightAnchor.constraint(equalToConstant: 45),
            passwordTextfield.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            passwordTextfield.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            
            confirmPasswordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            confirmPasswordLabel.topAnchor.constraint(equalTo: passwordTextfield.bottomAnchor, constant: 15),
            
            confirmPasswordTextfield.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor, constant: 5),
            confirmPasswordTextfield.heightAnchor.constraint(equalToConstant: 45),
            confirmPasswordTextfield.leadingAnchor.constraint(equalTo: passwordTextfield.leadingAnchor),
            confirmPasswordTextfield.trailingAnchor.constraint(equalTo: passwordTextfield.trailingAnchor),
            
            createButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25),
            createButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -25),
            createButton.heightAnchor.constraint(equalToConstant: 45),
            createButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            
            
        ])
    }
    
}
