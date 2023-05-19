import UIKit

protocol SucessRegisterScreenProtocol: AnyObject{
    
    func goToLoginScreen()
    
}

class SucessRegisterScreen: UIView {
    
    weak private var sucessRegisterScreenProtocol: SucessRegisterScreenProtocol?
    
    func delegate(delegate: SucessRegisterScreenProtocol){
        self.sucessRegisterScreenProtocol = delegate
    }
    
    var labelBemVindo: UILabel = {
        let welcomeLabel = UILabel()
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.text = "Bem Vindo!"
        welcomeLabel.textColor = UIColor(red: 69/255, green: 48/255, blue: 22/255, alpha: 1)
        welcomeLabel.font = UIFont(name: "Purple Smile.ttf", size: 48)
        welcomeLabel.textAlignment = .center
        return welcomeLabel
    }()
    
    var imageLogo: UIImageView = {
        let imagem = UIImageView()
        imagem.translatesAutoresizingMaskIntoConstraints = false
        imagem.image = UIImage(named: "logoAmarela.png")
        imagem.contentMode = .scaleAspectFit
        
        return imagem
    }()
    
    var messageCreatedAccount: UILabel = {
        let message = UILabel()
        message.translatesAutoresizingMaskIntoConstraints = false
        message.text = "Enviamos seus dados cadastrais para o email abaixo"
        message.textColor = UIColor(red: 69/255, green: 48/255, blue: 22/255, alpha: 1)
        message.font = UIFont.systemFont(ofSize: 17)
        message.numberOfLines = 0
        message.lineBreakMode = .byWordWrapping
        message.textAlignment = .center
        
        message.setContentHuggingPriority(.required, for: .horizontal)
        return message
    }()
    
    var messageEmailSend: UILabel = {
        let messageEmail = UILabel()
        messageEmail.translatesAutoresizingMaskIntoConstraints = false
        messageEmail.text = "exemplo@gmail.com"
        messageEmail.textColor = UIColor(red: 69/255, green: 48/255, blue: 22/255, alpha: 1)
        messageEmail.font = UIFont.boldSystemFont(ofSize: 20)
        messageEmail.textAlignment = .center
        return messageEmail
    }()
    
    var goToLogin: UIButton = {
        let goTo = UIButton()
        goTo.translatesAutoresizingMaskIntoConstraints = false
        goTo.setTitle("Entrar", for: .normal)
        goTo.setTitleColor(UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1), for: .normal)
        goTo.backgroundColor = UIColor(red: 69/255, green: 48/255, blue: 22/255, alpha: 1)
        goTo.layer.cornerRadius = 10
        goTo.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        goTo.layer.shadowColor = UIColor.black.cgColor
        goTo.layer.shadowOpacity = 0.1
        goTo.layer.shadowOffset = CGSize(width: 0, height: 2)
        goTo.layer.shadowRadius = 2
        goTo.addTarget(self, action: #selector(tapToLogin), for: .touchUpInside)
        
        return goTo
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setElements()
        setConstraintsToElements()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setElements(){
        
        self.addSubview(self.labelBemVindo)
        self.addSubview(self.imageLogo)
        self.addSubview(self.messageCreatedAccount)
        self.addSubview(self.messageEmailSend)
        self.addSubview(self.goToLogin)    }
    
    @objc func tapToLogin(){
        sucessRegisterScreenProtocol?.goToLoginScreen()
    }
    
    
    
    func setConstraintsToElements(){
        NSLayoutConstraint.activate([
            
            
            imageLogo.topAnchor.constraint(equalTo: self.topAnchor, constant: 150),
            imageLogo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageLogo.heightAnchor.constraint(equalToConstant: 120),
            imageLogo.widthAnchor.constraint(equalToConstant: 120),
            
            labelBemVindo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            labelBemVindo.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 48),
            labelBemVindo.widthAnchor.constraint(equalToConstant: 330),
            
            messageCreatedAccount.topAnchor.constraint(equalTo: labelBemVindo.bottomAnchor, constant: 40),
            messageCreatedAccount.leadingAnchor.constraint(equalTo: labelBemVindo.leadingAnchor),
            messageCreatedAccount.trailingAnchor.constraint(equalTo: labelBemVindo.trailingAnchor),
            
            messageEmailSend.topAnchor.constraint(equalTo: messageCreatedAccount.bottomAnchor, constant: 48),
            messageEmailSend.leadingAnchor.constraint(equalTo: messageCreatedAccount.leadingAnchor),
            messageEmailSend.trailingAnchor.constraint(equalTo: messageCreatedAccount.trailingAnchor),
            
            
            goToLogin.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,constant: -60),
            goToLogin.leadingAnchor.constraint(equalTo: messageCreatedAccount.leadingAnchor,constant: 0),
            goToLogin.trailingAnchor.constraint(equalTo: messageCreatedAccount.trailingAnchor,constant: 0),
            goToLogin.heightAnchor.constraint(equalToConstant: 45),
            
        ])
    }
    
}

