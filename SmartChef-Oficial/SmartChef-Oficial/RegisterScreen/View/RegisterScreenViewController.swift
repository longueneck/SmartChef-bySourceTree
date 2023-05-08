import Foundation
import UIKit

class RegisterScreenViewController: UIViewController {
    
    var register: RegisterScreen = RegisterScreen()
    var viewModel: RegisterViewModel = RegisterViewModel()
    
    override func loadView() {
        self.register = RegisterScreen()
        self.view = self.register
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.register.delegate(delegate: self)
        addDelegateToTextFields()
        viewModel.turnButtonOff(button: register.createButton)
        
    }
    
    private func addDelegateToTextFields(){
        register.userTextField.delegate = self
        register.emailTextField.delegate = self
        register.passwordTextfield.delegate = self
        register.confirmPasswordTextfield.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        register.userTextField.resignFirstResponder()
        register.emailTextField.resignFirstResponder()
        register.passwordTextfield.resignFirstResponder()
        register.confirmPasswordTextfield.resignFirstResponder()
    }
    
}

extension RegisterScreenViewController: RegisterScreenProtocol{
    func tapToBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func registerButton() {
        let vc = SucessRegisterViewController()
        vc.recebeDado = register.emailTextField.text ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension RegisterScreenViewController: UITextFieldDelegate{
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if viewModel.validateIsEmpty(user: register.userTextField.text ?? "", email: register.emailTextField.text ?? "", pass: register.passwordTextfield.text ?? "", confirm: register.confirmPasswordTextfield.text ?? ""){
            if viewModel.passIsEqual(pass: register.passwordTextfield.text ?? "", confirm: register.confirmPasswordTextfield.text ?? ""){
                viewModel.passCorrect(textField: register.passwordTextfield)
                viewModel.confirmCorrect(textField: register.confirmPasswordTextfield)
                viewModel.turnButtonOn(button: register.createButton)
            }else{
                viewModel.passWorse(textField: register.passwordTextfield)
                viewModel.confirWorse(textField: register.confirmPasswordTextfield)
                viewModel.turnButtonOff(button: register.createButton)
            }
        }
    }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            textField.layer.borderColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1).cgColor
            
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            textField.layer.borderColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1).cgColor

        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            
        }
    }

