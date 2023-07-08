
import UIKit

protocol RecoverScreenProtocol: AnyObject {
    func tappedRecover()
    func tapToBack()
}

class RecoverScreen: UIView {

    weak private var delegate: RecoverScreenProtocol?
    
    public func setDelegate(delegate: RecoverScreenProtocol) {
        self.delegate = delegate
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrowshape.turn.up.left.fill"), for: .normal)
        button.tintColor = .brownBase
        button.addTarget(self, action: #selector(tapToBack), for: .touchUpInside)
        return button
    }()
    
    lazy var resetPassLabel: UILabel = {
        let textReset = UILabel()
        textReset.translatesAutoresizingMaskIntoConstraints = false
        textReset.text = "Insira abaixo o e-mail no qual deseja redefinir a senha "
        textReset.textColor = .brownBase
        textReset.font = UIFont.sugarFont17
        textReset.numberOfLines = 0
        return textReset
    }()
    
    lazy var emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Digite seu email"
        textfield.backgroundColor = .white
        textfield.keyboardType = .emailAddress
        textfield.autocapitalizationType = .none
        textfield.layer.cornerRadius = 12
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
        textfield.leftView = paddingView
        textfield.leftViewMode = .always
        return textfield
    }()

    lazy var recoverButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitle("Enviar", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.sugarFont17
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(tappedRecoverButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tapToBack(){
        self.delegate?.tapToBack()
    }
    
    @objc func tappedRecoverButton() {
        self.delegate?.tappedRecover()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    private func addElements() {
        self.addSubview(backButton)
        self.addSubview(resetPassLabel)
        self.addSubview(emailTextField)
        self.addSubview(recoverButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError(.fatalErrorInit)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
            resetPassLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -20),
            resetPassLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            resetPassLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            recoverButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -40),
            recoverButton.heightAnchor.constraint(equalToConstant: 40),
            recoverButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            recoverButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
        ])
    }
}
