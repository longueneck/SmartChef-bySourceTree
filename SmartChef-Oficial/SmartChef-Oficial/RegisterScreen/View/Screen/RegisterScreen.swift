import UIKit

protocol RegisterScreenProtocol: AnyObject{
    
    func registerButton()
    
}

class RegisterScreen: UIView {
    
    weak private var registerScreenProtocol: RegisterScreenProtocol?
    
    func delegate(delegate: RegisterScreenProtocol){
        self.registerScreenProtocol = delegate
    }
    
    let labelCreate: UILabel = {
        let welcome = UILabel()
        welcome.translatesAutoresizingMaskIntoConstraints = false
        welcome.text = "Crie sua conta >"
        welcome.font = UIFont(name: "Nice Sugar", size: 24)
        welcome.textColor = UIColor(red: 255/255, green: 177/255, blue: 20/255, alpha: 1)
        return welcome
    }()
    
    let labelTextPresentation: UILabel = {
        let textPresentation = UILabel()
        textPresentation.translatesAutoresizingMaskIntoConstraints = false
        textPresentation.text = "Cozinhe com ingredientes da sua dispensa"
        textPresentation.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        textPresentation.font = UIFont(name: "Nice Sugar", size: 14)
        return textPresentation
    }()
    
    let logoChar: UIImageView = {
        let char = UIImageView()
        char.translatesAutoresizingMaskIntoConstraints = false
        char.image = UIImage(named: "logo1.png")
        char.contentMode = .scaleAspectFit
        return char
    }()
    
    
    let logoName: UIImageView = {
        let nameLogo = UIImageView()
        nameLogo.translatesAutoresizingMaskIntoConstraints = false
        nameLogo.image = UIImage(named: "Group 120.png")
        nameLogo.contentMode = .scaleAspectFit
        
        return nameLogo
    }()
    
    let labelUserName: UILabel = {
        let textPresentation = UILabel()
        textPresentation.translatesAutoresizingMaskIntoConstraints = false
        textPresentation.text = "Nome de usuário"
        textPresentation.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        textPresentation.font = UIFont.systemFont(ofSize: 17)
        return textPresentation
    }()
    
    let tfUser: UITextField = {
        let userTf = UITextField()
        userTf.translatesAutoresizingMaskIntoConstraints = false
        userTf.backgroundColor = .white
        userTf.layer.borderColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1).cgColor
        userTf.layer.borderWidth = 2
        userTf.layer.cornerRadius = 10
        userTf.layer.shadowColor = UIColor.black.cgColor
        userTf.layer.shadowOpacity = 0.1
        userTf.layer.shadowOffset = CGSize(width: 0, height: 2)
        userTf.layer.shadowRadius = 2
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: userTf.frame.height))
        userTf.leftView = paddingView
        userTf.leftViewMode = .always
        userTf.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        
        return userTf
    }()
    
    let labelEmail: UILabel = {
        let email = UILabel()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.text = "E-mail"
        email.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        email.font = UIFont.systemFont(ofSize: 17)
        return email
    }()
    
    let tfEmail: UITextField = {
        let tfEmail = UITextField()
        tfEmail.translatesAutoresizingMaskIntoConstraints = false
        tfEmail.backgroundColor = .white
        tfEmail.layer.borderColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1).cgColor
        tfEmail.layer.borderWidth = 2
        tfEmail.layer.cornerRadius = 10
        tfEmail.layer.shadowColor = UIColor.black.cgColor
        tfEmail.layer.shadowOpacity = 0.1
        tfEmail.layer.shadowOffset = CGSize(width: 0, height: 2)
        tfEmail.layer.shadowRadius = 2
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tfEmail.frame.height))
        tfEmail.leftView = paddingView
        tfEmail.leftViewMode = .always
        tfEmail.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        tfEmail.autocapitalizationType = .sentences
        tfEmail.keyboardType = .emailAddress
        
        return tfEmail
    }()
    
    let labelPassword: UILabel = {
        let pass = UILabel()
        pass.translatesAutoresizingMaskIntoConstraints = false
        pass.text = "Senha"
        pass.textColor = UIColor(red: 69/255, green: 48/255, blue: 22/255, alpha: 1)
        pass.font = UIFont.systemFont(ofSize: 17)
        return pass
    }()
    
    let tfPass: UITextField = {
        let tfpass = UITextField()
        tfpass.translatesAutoresizingMaskIntoConstraints = false
        tfpass.backgroundColor = .white
        tfpass.layer.borderColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1).cgColor
        tfpass.layer.borderWidth = 2
        tfpass.layer.cornerRadius = 10
        tfpass.layer.shadowColor = UIColor.black.cgColor
        tfpass.layer.shadowOpacity = 0.1
        tfpass.layer.shadowOffset = CGSize(width: 0, height: 2)
        tfpass.layer.shadowRadius = 2
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tfpass.frame.height))
        tfpass.leftView = paddingView
        tfpass.leftViewMode = .always
        tfpass.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return tfpass
    }()
    
    let buttonCreate: UIButton = {
        let create = UIButton()
        
        create.translatesAutoresizingMaskIntoConstraints = false
        create.setTitle("Criar conta", for: .normal)
        create.setTitleColor(UIColor(red: 69/255, green: 48/255, blue: 22/255, alpha: 1), for: .normal)
        create.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        create.layer.cornerRadius = 10
        create.layer.shadowColor = UIColor.black.cgColor
        create.layer.shadowOpacity = 0.1
        create.layer.shadowOffset = CGSize(width: 0, height: 2)
        create.layer.shadowRadius = 2
        create.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        create.addTarget(self, action: #selector(createButton), for: .touchUpInside)
    
        return create
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        setConstraints()
        configButtonEnable(false)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews(){ //Function to set contraints for all the elements
        
        self.addSubview(self.labelCreate)
        self.addSubview(self.labelTextPresentation)
        self.addSubview(self.logoChar)
        self.addSubview(self.logoName)
        self.addSubview(self.labelUserName)
        self.addSubview(self.tfUser)
        self.addSubview(self.labelEmail)
        self.addSubview(self.tfEmail)
        self.addSubview(self.labelPassword)
        self.addSubview(self.tfPass)
        self.addSubview(self.buttonCreate)
        
    }
    
    @objc func createButton(){
        registerScreenProtocol?.registerButton()
    }
    
    public func validateTextFields(){
        let name: String = self.tfUser.text ?? ""
        let email: String = self.tfEmail.text ?? ""
        let pass: String = self.tfPass.text ?? ""
        
        if !name.isEmpty && !email.isEmpty && !pass.isEmpty{
            self.configButtonEnable(true)
        }else{
            self.configButtonEnable(false)
        }
    }
    
    private func configButtonEnable(_ enable: Bool){
        if enable{
            self.buttonCreate.alpha = 1.0
            self.buttonCreate.isEnabled = true
        }else{
            self.buttonCreate.alpha = 0.5
            self.buttonCreate.isEnabled = false
        }
    }
    
    func setConstraints(){
        
        NSLayoutConstraint.activate([
            
            labelCreate.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            labelCreate.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            
            labelTextPresentation.topAnchor.constraint(equalTo: labelCreate.bottomAnchor, constant: 5),
            labelTextPresentation.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            
            logoChar.topAnchor.constraint(equalTo: labelTextPresentation.bottomAnchor, constant: 30),
            logoChar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            logoChar.heightAnchor.constraint(equalToConstant: 100),
            logoChar.widthAnchor.constraint(equalToConstant: 100),
            
            logoName.leadingAnchor.constraint(equalTo: logoChar.trailingAnchor, constant: 0),
            logoName.centerYAnchor.constraint(equalTo: logoChar.centerYAnchor),
            logoName.leadingAnchor.constraint(equalTo: logoChar.trailingAnchor, constant: 7),
            logoName.heightAnchor.constraint(equalToConstant: 100),
            logoName.widthAnchor.constraint(equalToConstant: 130),
            
            labelUserName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            labelUserName.topAnchor.constraint(equalTo: logoChar.bottomAnchor, constant: 25),
            
            tfUser.topAnchor.constraint(equalTo: labelUserName.bottomAnchor, constant: 5),
            tfUser.heightAnchor.constraint(equalToConstant: 45),
            tfUser.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            tfUser.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            
            labelEmail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            labelEmail.topAnchor.constraint(equalTo: tfUser.bottomAnchor, constant: 10),
            
            tfEmail.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 5),
            tfEmail.heightAnchor.constraint(equalToConstant: 45),
            tfEmail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            tfEmail.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            
            labelPassword.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            labelPassword.topAnchor.constraint(equalTo: tfEmail.bottomAnchor, constant: 15),
            
            tfPass.topAnchor.constraint(equalTo: labelPassword.bottomAnchor, constant: 5),
            tfPass.heightAnchor.constraint(equalToConstant: 45),
            tfPass.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            tfPass.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            
            buttonCreate.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25),
            buttonCreate.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -25),
            buttonCreate.heightAnchor.constraint(equalToConstant: 45),
            buttonCreate.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -30),

        ])
    }
}
