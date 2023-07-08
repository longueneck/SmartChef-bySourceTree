import UIKit
import Firebase

class RecoverViewController: UIViewController {
    
    var screen: RecoverScreen = RecoverScreen()
    var alert: Alert?
    var viewModel: RecoverViewModel?
    
    override func loadView() {
        screen = RecoverScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellowBase
        screen.setDelegate(delegate: self)
        screen.turnButtonOff(button: screen.recoverButton)
        setDelegate()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        screen.emailTextField.resignFirstResponder()
    }
    
    func setDelegate(){
        screen.emailTextField.delegate = self
    }
}

extension RecoverViewController: RecoverScreenProtocol {
    func tapToBack() {
        self.navigationController?.pushViewController(LoginScreenViewController(), animated: true)
    }
    
    func tappedRecover() {
        guard let email = screen.emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !email.isEmpty else {
            return
        }
        
        Auth.auth().fetchSignInMethods(forEmail: email) { [weak self] signInMethods, error in
            guard let self = self else { return }
            
            Alert(controller: self).getAlertOption(title: .registerTitleAlertSucess, message: .registerMessageAlertSucess){
                action in
                if action {
                    self.navigationController?.pushViewController(LoginScreenViewController(), animated: true)
                }
            }
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
                        
                    }
                }
            }
        }
    }
}

extension RecoverViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let emailTextField = screen.emailTextField.text ?? ""
        if emailTextField.isEmpty {
            screen.turnButtonOff(button: screen.recoverButton)
        }else{
            screen.turnButtonOn(button: screen.recoverButton)
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1).cgColor
        textField.layer.borderWidth = 2
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1).cgColor
        textField.layer.borderWidth = 0
        textField.isEnabled = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
    }
    
}




