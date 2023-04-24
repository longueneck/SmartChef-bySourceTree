import Foundation
import UIKit

class RegisterScreenViewController: UIViewController {
    
    var register: RegisterScreen?
    
    override func loadView() {
        self.register = RegisterScreen() //Dizendo que a propria register vai receber a RegisterScreen
        self.view = self.register //Dizendo que a propria view vai ser a propria register que recebeu os elementos da RegisterScreen()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.register?.delegate(delegate: self)
        addDelegateToTextFields()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func addDelegateToTextFields(){
        register?.tfUser.delegate = self
        register?.tfEmail.delegate = self
        register?.tfPass.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        register?.tfUser.resignFirstResponder()
        register?.tfEmail.resignFirstResponder()
        register?.tfPass.resignFirstResponder()
    }
    
}

extension RegisterScreenViewController: RegisterScreenProtocol{
   
    
    func registerButton() {
        self.navigationController?.pushViewController(SucessRegisterViewController(), animated: true)
    }
}

extension RegisterScreenViewController: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1).cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1).cgColor
        self.register?.validateTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
