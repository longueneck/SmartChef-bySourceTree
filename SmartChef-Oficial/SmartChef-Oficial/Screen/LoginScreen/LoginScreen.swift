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
    
    lazy var bgYellow: UIView = {
        let background = UIView()
        
        background.translatesAutoresizingMaskIntoConstraints = false
        background.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
            return background
        }()
    
    lazy var logoInitial: UIImageView = {
       let logoImage = UIImageView()
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(named: "logoBranca.png")
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
        separation.backgroundColor = .white
        separation.layer.cornerRadius = 10
        separation.layer.shadowColor = UIColor.black.cgColor
        separation.layer.shadowOpacity = 0.3
        separation.layer.shadowOffset = CGSize(width: 0, height: 2)
        separation.layer.shadowRadius = 2
            return separation
        }()
    
    lazy var labelLogin: UILabel = {
       let loginText = UILabel()
        
        loginText.translatesAutoresizingMaskIntoConstraints = false
        loginText.text = "Usuário"
        loginText.font = UIFont.boldSystemFont(ofSize: 17)
        loginText.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        
        return loginText
        }()
    
    lazy var tfLogin: UITextField = {
       let login = UITextField()
        
        login.translatesAutoresizingMaskIntoConstraints = false
        login.layer.cornerRadius = 10
        login.textColor = UIColor.black
        login.backgroundColor = .white
        login.layer.borderWidth = 2
        login.layer.borderColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1).cgColor
        login.layer.shadowColor = UIColor.black.cgColor
        login.layer.shadowOpacity = 0.1
        login.layer.shadowOffset = CGSize(width: 0, height: 2)
        login.layer.shadowRadius = 2
        login.keyboardType = .emailAddress
        login.autocapitalizationType = .none
        login.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: login.frame.height))
            login.leftView = paddingView
            login.leftViewMode = .always
            return login
        }()
    
    lazy var labelPassword: UILabel = {
       let password = UILabel()
        
        password.translatesAutoresizingMaskIntoConstraints = false
        password.text = "Senha"
        password.font = UIFont.boldSystemFont(ofSize: 17)
        password.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
            return password
        }()
    
    lazy var tfPassword: UITextField = {
        
       let pass = UITextField()
        
        pass.translatesAutoresizingMaskIntoConstraints = false
        pass.layer.cornerRadius = 10
        pass.backgroundColor = .white
        pass.textColor = UIColor.black
        pass.layer.borderWidth = 2
        pass.layer.borderColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1).cgColor
        pass.layer.shadowColor = UIColor.black.cgColor
        pass.layer.shadowOpacity = 0.1
        pass.layer.shadowOffset = CGSize(width: 0, height: 2)
        pass.layer.shadowRadius = 2
        pass.isSecureTextEntry = true
        pass.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: pass.frame.height))
            pass.leftView = paddingView
            pass.leftViewMode = .always
        
            return pass
        }()
    
    lazy var passReset: UILabel = {
       let reset = UILabel()
        
        reset.translatesAutoresizingMaskIntoConstraints = false
        reset.text = "Recupere sua senha"
        reset.font = UIFont.boldSystemFont(ofSize: 14)
        reset.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
            return reset
        }()

    lazy var loginButton: UIButton = {
       let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.1
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 2
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(tapToLogin), for: .touchUpInside)
        
            return button
        }()

    lazy var txtConectse: UILabel = {
       let reset = UILabel()
        
        reset.translatesAutoresizingMaskIntoConstraints = false
        reset.text = "Ou conecte-se com"
        reset.font = UIFont.boldSystemFont(ofSize: 14)
        reset.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
            return reset
    }()
    


    lazy var appleIcon: UIButton = {
       let apple = UIButton()
        
        apple.translatesAutoresizingMaskIntoConstraints = false
        apple.setTitleColor(UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1), for: .normal)
        apple.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        apple.layer.cornerRadius = 10
        apple.layer.shadowColor = UIColor.black.cgColor
        apple.layer.shadowOpacity = 0.1
        apple.layer.shadowOffset = CGSize(width: 0, height: 2)
        apple.layer.shadowRadius = 2
        apple.setImage(UIImage(named: "appleicon.png"), for: .normal)
            return apple
        }()
    
    lazy var btGoogleIcon: UIButton = {
       let google = UIButton()
        
        google.translatesAutoresizingMaskIntoConstraints = false
        google.setTitleColor(UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1), for: .normal)
        google.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        google.layer.cornerRadius = 10
        google.layer.shadowColor = UIColor.black.cgColor
        google.layer.shadowOpacity = 0.1
        google.layer.shadowOffset = CGSize(width: 0, height: 2)
        google.layer.shadowRadius = 2
        google.setImage(UIImage(named: "googleicon.png"), for: .normal)
            return google
        }()
    
    lazy var btFaceIcon: UIButton = {
       let facebook = UIButton()
        
        facebook.translatesAutoresizingMaskIntoConstraints = false
        facebook.setTitleColor(UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1), for: .normal)
        facebook.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        facebook.layer.cornerRadius = 10
        facebook.layer.shadowColor = UIColor.black.cgColor
        facebook.layer.shadowOpacity = 0.1
        facebook.layer.shadowOffset = CGSize(width: 0, height: 2)
        facebook.layer.shadowRadius = 2
        facebook.setImage(UIImage(named: "faceicon.png"), for: .normal)
            return facebook
        }()
    
    
    lazy var buttonSignIn: UIButton = {
       let entrar = UIButton()
        
        entrar.translatesAutoresizingMaskIntoConstraints = false
        entrar.setTitle("Inscreva-se", for: .normal)
        entrar.setTitleColor(UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1), for: .normal)
        entrar.backgroundColor = .white
        entrar.layer.borderWidth = 2
        entrar.layer.borderColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1).cgColor
        entrar.layer.cornerRadius = 10
        entrar.layer.shadowColor = UIColor.black.cgColor
        entrar.layer.shadowOpacity = 0.1
        entrar.layer.shadowOffset = CGSize(width: 0, height: 2)
        entrar.layer.shadowRadius = 2
        entrar.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        entrar.addTarget(self, action: #selector(registerButton), for: .touchUpInside)
        
            return entrar
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configSuperViews()
        addConstraints()
        configButtonEnable(false)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configSuperViews(){ 
        
        self.addSubview(self.bgYellow)
        self.addSubview(self.logoInitial)
        self.addSubview(self.suspenseView)
        self.addSubview(self.labelLogin)
        self.addSubview(self.tfLogin)
        self.addSubview(self.labelPassword)
        self.addSubview(self.tfPassword)
        self.addSubview(self.passReset)
        self.addSubview(self.loginButton)
        self.addSubview(self.txtConectse)
        self.addSubview(self.appleIcon)
        self.addSubview(self.btGoogleIcon)
        self.addSubview(self.btFaceIcon)
        self.addSubview(self.buttonSignIn)
    }
    
    @objc func tapToLogin(){
        loginScreenProtocol?.actionButton()
    }
    
    @objc func registerButton(){
        loginScreenProtocol?.actionRegister()
    }
    
    
    //MARK: Validando textField isEmpty
    
    
    public func validateTextFields(){
        let email: String = self.tfLogin.text ?? ""
        let pass: String = self.tfPassword.text ?? ""
        
        if !email.isEmpty && !pass.isEmpty{
            self.configButtonEnable(true)
        }else{
            self.configButtonEnable(false)
        }
    }
    
    private func configButtonEnable(_ enable: Bool){
        if enable{
            self.loginButton.alpha = 1.0
            self.loginButton.isEnabled = true
        }else{
            self.loginButton.alpha = 0.5
            self.loginButton.isEnabled = false
        }
    }
    
    //-------------------------------------------------------------------------------------------
    
    func addConstraints(){
        
        NSLayoutConstraint.activate([

        bgYellow.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
        bgYellow.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
        bgYellow.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
        bgYellow.bottomAnchor.constraint(equalTo: self.centerYAnchor),
        
        logoInitial.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
        logoInitial.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
        logoInitial.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
        logoInitial.heightAnchor.constraint(equalToConstant: 150),
        
        suspenseView.topAnchor.constraint(equalTo: logoInitial.bottomAnchor,constant: 20),
        suspenseView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15),
        suspenseView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15),
        suspenseView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),

        labelLogin.topAnchor.constraint(equalTo: suspenseView.topAnchor,constant: 8),
        labelLogin.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25),
        labelLogin.heightAnchor.constraint(equalToConstant: 20),

        tfLogin.topAnchor.constraint(equalTo: labelLogin.bottomAnchor, constant: 6),
        tfLogin.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25),
        tfLogin.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -25),
        tfLogin.heightAnchor.constraint(equalToConstant: 45),

        labelPassword.topAnchor.constraint(equalTo: tfLogin.bottomAnchor, constant: 10),
        labelPassword.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25),
        labelPassword.heightAnchor.constraint(equalToConstant: 20),

        tfPassword.topAnchor.constraint(equalTo: labelPassword.bottomAnchor,constant: 6),
        tfPassword.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25),
        tfPassword.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -25),
        tfPassword.heightAnchor.constraint(equalToConstant: 45),

        passReset.topAnchor.constraint(equalTo: tfPassword.bottomAnchor, constant: 7),
        passReset.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 32),
        passReset.heightAnchor.constraint(equalToConstant: 20),

        loginButton.topAnchor.constraint(equalTo: passReset.bottomAnchor,constant: 10),
        loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25),
        loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -25),
        loginButton.heightAnchor.constraint(equalToConstant: 45),

        txtConectse.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
        txtConectse.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        txtConectse.heightAnchor.constraint(equalToConstant: 20),

        appleIcon.centerXAnchor.constraint(equalTo: txtConectse.centerXAnchor),
        appleIcon.topAnchor.constraint(equalTo: txtConectse.bottomAnchor, constant: 10),
        appleIcon.heightAnchor.constraint(equalToConstant: 64),
        appleIcon.widthAnchor.constraint(equalToConstant: 64),
        
        btFaceIcon.leadingAnchor.constraint(equalTo: suspenseView.leadingAnchor, constant: 15),
        btFaceIcon.centerYAnchor.constraint(equalTo: appleIcon.centerYAnchor),
        btFaceIcon.heightAnchor.constraint(equalToConstant: 64),
        btFaceIcon.widthAnchor.constraint(equalToConstant: 64),
       
        btGoogleIcon.trailingAnchor.constraint(equalTo: suspenseView.trailingAnchor, constant: -15),
        btGoogleIcon.centerYAnchor.constraint(equalTo: appleIcon.centerYAnchor),
        btGoogleIcon.heightAnchor.constraint(equalToConstant: 64),
        btGoogleIcon.widthAnchor.constraint(equalToConstant: 64),
    
        buttonSignIn.bottomAnchor.constraint(equalTo: suspenseView.bottomAnchor,constant: -15),
        buttonSignIn.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25),
        buttonSignIn.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -25),
        buttonSignIn.heightAnchor.constraint(equalToConstant: 45),
        
        ])
    }
}
    
