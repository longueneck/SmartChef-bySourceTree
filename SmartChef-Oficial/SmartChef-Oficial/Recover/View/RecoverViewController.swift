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
        screen?.recoverButton.isEnabled = false
        screen?.recoverButton.alpha = 0.5
        isEmptyEmail()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        screen?.emailTextField.resignFirstResponder()
    }

    func isEmptyEmail(){
        if screen?.emailTextField.text?.isEmpty == false {
            screen?.recoverButton.isEnabled = true
            screen?.recoverButton.alpha = 1.0
        }
        
    }
    
    
}



extension RecoverViewController: RecoverScreenProtocol {
    func tapToBack() {
        self.navigationController?.pushViewController(LoginScreenViewController(), animated: true)
    }
    
    func tappedRecover() {
        print("Clicou aqui")
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
                        self.alert?.getAlertOption(title: "Enviado", message: "Enviamos um email de redefinição de senha \n Verifique sua caixa de entrada", completion: { [weak self] (success) in
                            if success {
                                self?.navigationController?.popToViewController(LoginScreenViewController(), animated: true)
                            }
                        })
                    }
                }
            }
        }
    }
}



  
