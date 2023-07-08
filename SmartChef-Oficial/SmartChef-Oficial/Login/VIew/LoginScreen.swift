import UIKit

protocol LoginScreenProtocol: AnyObject {
    func actionButton()
    func actionRegister()
    func resetPass()
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
    
    lazy var resetPassLabel: UIButton = {
        let reset = UIButton()
        reset.translatesAutoresizingMaskIntoConstraints = false
        reset.setTitle(.resetpassword, for: .normal)
        reset.titleLabel?.font = UIFont.boldFont14
        reset.setTitleColor(.brownBase, for: .normal)
        reset.addTarget(self, action: #selector(tapToResetPass), for: .touchUpInside)
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
    
    lazy var autentitacionView: UIView = {
        let separation = UIView()
        separation.translatesAutoresizingMaskIntoConstraints = false
        separation.backgroundColor = .whiteBase
        separation.layer.cornerRadius = 10
        return separation
    }()
    
    lazy var googleIconImage: UIButton = {
        let google = UIButton()
        google.translatesAutoresizingMaskIntoConstraints = false
        google.backgroundColor = .white
        google.layer.cornerRadius = 20
        google.layer.shadowColor = UIColor.black.cgColor
        google.layer.shadowOpacity = 0.1
        google.layer.shadowOffset = CGSize(width: 0, height: 2)
        google.layer.shadowRadius = 2
        google.setBackgroundImage(.googleIconConnect, for: .normal)
        google.contentMode = .scaleAspectFill
        return google
    }()

    lazy var facebookIconImage: UIButton = {
        let facebook = UIButton()
        facebook.translatesAutoresizingMaskIntoConstraints = false
        facebook.backgroundColor = .whiteBase
        facebook.layer.cornerRadius = 20
        facebook.layer.shadowColor = UIColor.black.cgColor
        facebook.layer.shadowOpacity = 0.1
        facebook.layer.shadowOffset = CGSize(width: 0, height: 2)
        facebook.layer.shadowRadius = 2
        facebook.setImage(.facebookIconConnect, for: .normal)
        facebook.contentMode = .scaleAspectFit
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
        fatalError(.fatalErrorInit)
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
        self.addSubview(self.autentitacionView)
        self.addSubview(self.textConectLabel)
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
    
    @objc func tapToResetPass(){
        loginScreenProtocol?.resetPass()
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
            
            resetPassLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 2),
            resetPassLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25),
            resetPassLabel.heightAnchor.constraint(equalToConstant: 20),
            
            loginButton.topAnchor.constraint(equalTo: resetPassLabel.bottomAnchor,constant: 10),
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -25),
            loginButton.heightAnchor.constraint(equalToConstant: 45),
            
            autentitacionView.topAnchor.constraint(equalTo: loginButton.bottomAnchor),
            autentitacionView.leadingAnchor.constraint(equalTo: suspenseView.leadingAnchor),
            autentitacionView.trailingAnchor.constraint(equalTo: suspenseView.trailingAnchor),
            autentitacionView.bottomAnchor.constraint(equalTo: signInButton.topAnchor),
            
            textConectLabel.bottomAnchor.constraint(equalTo: googleIconImage.topAnchor, constant: -10),
            textConectLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            textConectLabel.heightAnchor.constraint(equalToConstant: 20),

            facebookIconImage.trailingAnchor.constraint(equalTo: autentitacionView.centerXAnchor, constant: -20),
            facebookIconImage.centerYAnchor.constraint(equalTo: autentitacionView.centerYAnchor,constant: 15),
            facebookIconImage.heightAnchor.constraint(equalToConstant: 40),
            facebookIconImage.widthAnchor.constraint(equalToConstant: 40),
            
            googleIconImage.leadingAnchor.constraint(equalTo: autentitacionView.centerXAnchor, constant: 20),
            googleIconImage.centerYAnchor.constraint(equalTo: autentitacionView.centerYAnchor,constant: 15),
            googleIconImage.heightAnchor.constraint(equalToConstant: 40),
            googleIconImage.widthAnchor.constraint(equalToConstant: 40),
            
            signInButton.bottomAnchor.constraint(equalTo: suspenseView.bottomAnchor,constant: -15),
            signInButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25),
            signInButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -25),
            signInButton.heightAnchor.constraint(equalToConstant: 45),
            
        ])
    }
}

