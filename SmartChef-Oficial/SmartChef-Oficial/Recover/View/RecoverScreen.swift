//
//  RecoverScreen.swift
//  SmartChef-Oficial
//
//  Created by Kevin Longue on 05/07/23.
//

import UIKit

protocol RecoverScreenProtocol: AnyObject {
    func tappedRecover()
}

class RecoverScreen: UIView {

    weak private var delegate: RecoverScreenProtocol?
    
    public func setDelegate(delegate: RecoverScreenProtocol) {
        self.delegate = delegate
    }
    
    lazy var emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Digite seu email"
        textfield.backgroundColor = .white
        textfield.keyboardType = .default
        textfield.autocorrectionType = .no
        return textfield
    }()

    lazy var recoverButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitle("Recuperar", for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(tappedRecoverButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedRecoverButton() {
        self.delegate?.tappedRecover()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    private func addElements() {
        self.addSubview(emailTextField)
        self.addSubview(recoverButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            recoverButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            recoverButton.heightAnchor.constraint(equalToConstant: 40),
            recoverButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            recoverButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }
}
