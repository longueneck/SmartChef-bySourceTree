//
//  RecoverViewController.swift
//  SmartChef-Oficial
//
//  Created by Kevin Longue on 05/07/23.
//

import UIKit
import Firebase

class RecoverViewController: UIViewController {

    var screen: RecoverScreen?
    var alert: Alert?
    
    override func loadView() {
        screen = RecoverScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellowBase
        screen?.setDelegate(delegate: self)
    }
  
}

extension RecoverViewController: RecoverScreenProtocol {
    func tappedRecover() {
        guard let email = screen?.emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !email.isEmpty else {
                    return
                }
                
                Auth.auth().fetchSignInMethods(forEmail: email) { [weak self] signInMethods, error in
                    guard let self = self else { return }
                    
                    if let error = error {
                        print("Erro ao verificar os métodos de login:", error.localizedDescription)
                        self.alert?.getAlert(title: "Erro", message: "Erro ao buscar email")
                    } else if let signInMethods = signInMethods, signInMethods.isEmpty {
                        self.alert?.getAlert(title:"Erro", message: "Erro ao buscar email")
                    } else {
                        Auth.auth().sendPasswordReset(withEmail: email) { [weak self] error in
                            guard let self = self else { return }
                            
                            if let error = error {
                                print("Erro ao enviar o link de redefinição de senha:", error.localizedDescription)
                                self.alert?.getAlert(title: "Erro", message: "Erro ao buscar email")
                            } else {
                                self.alert?.getAlert(title: "Enviado", message: "Enviado com sucesso. Verifique seu email na sua caixa de entrada.")
                            }
                        }
                    }
                }
    }
}
