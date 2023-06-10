
import UIKit

protocol LoginScreenProtocol: AnyObject {
    func actionButton()
    func actionRegister()
}

class LoginScreen: UIView {
    
    weak private var loginScreenProtocol: LoginScreenProtocol?
    
    func delegate(delegate: LoginScreenProtocol){
        self.loginScreenProtocol = delegate
    }
    
    lazy var gbYellowView: UIView = {
        let background = UIView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.backgroundColor = .yellowBase
        return background
    }()
    
    lazy var initialLogoImage: UIImageView = {
        let logoImage = UIImageView()
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage.whiteBrandImage
        logoImage.contentMode = .scaleAspectFit
        logoImage.layer.shadowColor = UIColor.black.cgColor
        logoImage.layer.shadowOpacity = 0.3
        logoImage.layer.shadowOffset = CGSize(width: 0, height: 2)
        logoImage.layer.shadowRadius = 2
        return logoImage
    }()
    
    lazy var suspenseView: UIView = {
        let separation = UIView()
        separation.translatesAutoresizingMaskIntoConstraints = false
        separation.backgroundColor = .whiteBase
        separation.layer.cornerRadius = 10
        separation.layer.shadowColor = UIColor.black.cgColor
        separation.layer.shadowOpacity = 0.3
        separation.layer.shadowOffset = CGSize(width: 0, height: 2)
        separation.layer.shadowRadius = 2
        return separation
    }()
    
    lazy var loginLabel: UILabel = {
        let loginText = UILabel()
        loginText.translatesAutoresizingMaskIntoConstraints = false
        loginText.text = .userText
        loginText.font = .boldFont17
        loginText.textColor = .brownBase
        return loginText
    }()
    
    lazy var loginTextField: UITextField = {
        let login = UITextField()
        login.translatesAutoresizingMaskIntoConstraints = false
        login.layer.cornerRadius = 10
        login.textColor = .blackBase
        login.backgroundColor = .whiteBase
        login.layer.borderWidth = 2
        login.layer.borderColor = UIColor.yellowBaseCG
        login.layer.shadowColor = UIColor.black.cgColor
        login.layer.shadowOpacity = 0.1
        login.layer.shadowOffset = CGSize(width: 0, height: 2)
        login.layer.shadowRadius = 2
        login.keyboardType = .emailAddress
        login.autocapitalizationType = .none
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: login.frame.height))
        login.leftView = paddingView
        login.leftViewMode = .always
        return login
    }()
    
    lazy var passwordLabel: UILabel = {
        let password = UILabel()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.text = .passwordText
        password.font = .boldFont17
        password.textColor = .brownBase
        return password
    }()
    
    lazy var passwordTextField: UITextField = {
        
        let pass = UITextField()
        pass.translatesAutoresizingMaskIntoConstraints = false
        pass.layer.cornerRadius = 10
        pass.backgroundColor = .whiteBase
        pass.textColor = .blackBase
        pass.layer.borderWidth = 2
        pass.layer.borderColor = UIColor.yellowBaseCG
        pass.layer.shadowColor = UIColor.black.cgColor
        pass.layer.shadowOpacity = 0.1
        pass.layer.shadowOffset = CGSize(width: 0, height: 2)
        pass.layer.shadowRadius = 2
        pass.isSecureTextEntry = true
        pass.textColor = .brownBase
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: pass.frame.height))
        pass.leftView = paddingView
        pass.leftViewMode = .always
        return pass
    }()
    
    lazy var resetPassLabel: UILabel = {
        let reset = UILabel()
        reset.translatesAutoresizingMaskIntoConstraints = false
        reset.text = .resetpassword
        reset.font = .boldFont14
        reset.textColor = .brownBase
        return reset
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(.setTitleLoginButton, for: .normal)
        button.setTitleColor(.brownBase, for: .normal)
        button.backgroundColor = .yellowBase
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.1
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 2
        button.titleLabel?.font = .boldFont18
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    lazy var textConectLabel: UILabel = {
        let reset = UILabel()
        reset.translatesAutoresizingMaskIntoConstraints = false
        reset.text = .alternativeConnection
        reset.font = .boldFont14
        reset.textColor = .brownBase
        return reset
    }()
    
    lazy var appleIconImage: UIButton = {
        let apple = UIButton()
        apple.translatesAutoresizingMaskIntoConstraints = false
        apple.setTitleColor(.brownBase, for: .normal)
        apple.backgroundColor = .yellowBase
        apple.layer.cornerRadius = 10
        apple.layer.shadowColor = UIColor.black.cgColor
        apple.layer.shadowOpacity = 0.1
        apple.layer.shadowOffset = CGSize(width: 0, height: 2)
        apple.layer.shadowRadius = 2
        apple.setImage(.appleIconConnect, for: .normal)
        return apple
    }()
    
    lazy var googleIconImage: UIButton = {
        let google = UIButton()
        google.translatesAutoresizingMaskIntoConstraints = false
        google.setTitleColor(.brownBase, for: .normal)
        google.backgroundColor = .yellowBase
        google.layer.cornerRadius = 10
        google.layer.shadowColor = UIColor.black.cgColor
        google.layer.shadowOpacity = 0.1
        google.layer.shadowOffset = CGSize(width: 0, height: 2)
        google.layer.shadowRadius = 2
        google.setImage(.googleIconConnect, for: .normal)
        return google
    }()
    
    lazy var facebookIconImage: UIButton = {
        let facebook = UIButton()
        facebook.translatesAutoresizingMaskIntoConstraints = false
        facebook.setTitleColor(.brownBase, for: .normal)
        facebook.backgroundColor = .yellowBase
        facebook.layer.cornerRadius = 10
        facebook.layer.shadowColor = UIColor.black.cgColor
        facebook.layer.shadowOpacity = 0.1
        facebook.layer.shadowOffset = CGSize(width: 0, height: 2)
        facebook.layer.shadowRadius = 2
        facebook.setImage(.facebookIconConnect, for: .normal)
        return facebook
    }()
    
    lazy var signInButton: UIButton = {
        let entrar = UIButton()
        entrar.translatesAutoresizingMaskIntoConstraints = false
        entrar.setTitle(.signInText, for: .normal)
        entrar.setTitleColor(.brownBase, for: .normal)
        entrar.backgroundColor = .whiteBase
        entrar.layer.borderWidth = 2
        entrar.layer.borderColor = UIColor.yellowBaseCG
        entrar.layer.cornerRadius = 10
        entrar.layer.shadowColor = UIColor.black.cgColor
        entrar.layer.shadowOpacity = 0.1
        entrar.layer.shadowOffset = CGSize(width: 0, height: 2)
        entrar.layer.shadowRadius = 2
        entrar.titleLabel?.font = .boldFont18
        entrar.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return entrar
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configSuperViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configSuperViews() {
        self.addSubview(self.gbYellowView)
        self.addSubview(self.initialLogoImage)
        self.addSubview(self.suspenseView)
        self.addSubview(self.loginLabel)
        self.addSubview(self.loginTextField)
        self.addSubview(self.passwordLabel)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.resetPassLabel)
        self.addSubview(self.loginButton)
        self.addSubview(self.textConectLabel)
        self.addSubview(self.appleIconImage)
        self.addSubview(self.googleIconImage)
        self.addSubview(self.facebookIconImage)
        self.addSubview(self.signInButton)
    }
    
    @objc func tappedLoginButton(){
        loginScreenProtocol?.actionButton()
    }
    
    @objc func tappedRegisterButton(){
        loginScreenProtocol?.actionRegister()
    }
    
    func addConstraints(){
        
        NSLayoutConstraint.activate([
            
            gbYellowView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            gbYellowView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            gbYellowView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            gbYellowView.bottomAnchor.constraint(equalTo: self.centerYAnchor),
            
            initialLogoImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            initialLogoImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            initialLogoImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            initialLogoImage.heightAnchor.constraint(equalToConstant: 150),
            
            suspenseView.topAnchor.constraint(equalTo: initialLogoImage.bottomAnchor,constant: 20),
            suspenseView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15),
            suspenseView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15),
            suspenseView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            loginLabel.topAnchor.constraint(equalTo: suspenseView.topAnchor,constant: 8),
            loginLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25),
            loginLabel.heightAnchor.constraint(equalToConstant: 20),
            
            loginTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 6),
            loginTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25),
            loginTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -25),
            loginTextField.heightAnchor.constraint(equalToConstant: 45),
            
            passwordLabel.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 10),
            passwordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25),
            passwordLabel.heightAnchor.constraint(equalToConstant: 20),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor,constant: 6),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -25),
            passwordTextField.heightAnchor.constraint(equalToConstant: 45),
            
            resetPassLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 7),
            resetPassLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 32),
            resetPassLabel.heightAnchor.constraint(equalToConstant: 20),
            
            loginButton.topAnchor.constraint(equalTo: resetPassLabel.bottomAnchor,constant: 10),
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -25),
            loginButton.heightAnchor.constraint(equalToConstant: 45),
            
            textConectLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
            textConectLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            textConectLabel.heightAnchor.constraint(equalToConstant: 20),
            
            appleIconImage.centerXAnchor.constraint(equalTo: textConectLabel.centerXAnchor),
            appleIconImage.topAnchor.constraint(equalTo: textConectLabel.bottomAnchor, constant: 10),
            appleIconImage.heightAnchor.constraint(equalToConstant: 64),
            appleIconImage.widthAnchor.constraint(equalToConstant: 64),
            
            facebookIconImage.leadingAnchor.constraint(equalTo: suspenseView.leadingAnchor, constant: 15),
            facebookIconImage.centerYAnchor.constraint(equalTo: appleIconImage.centerYAnchor),
            facebookIconImage.heightAnchor.constraint(equalToConstant: 64),
            facebookIconImage.widthAnchor.constraint(equalToConstant: 64),
            
            googleIconImage.trailingAnchor.constraint(equalTo: suspenseView.trailingAnchor, constant: -15),
            googleIconImage.centerYAnchor.constraint(equalTo: appleIconImage.centerYAnchor),
            googleIconImage.heightAnchor.constraint(equalToConstant: 64),
            googleIconImage.widthAnchor.constraint(equalToConstant: 64),
            
            signInButton.bottomAnchor.constraint(equalTo: suspenseView.bottomAnchor,constant: -15),
            signInButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25),
            signInButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -25),
            signInButton.heightAnchor.constraint(equalToConstant: 45),
            
        ])
    }
}

