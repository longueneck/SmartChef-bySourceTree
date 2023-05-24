import Foundation
import UIKit
import FirebaseAuth

class RegisterScreenViewController: UIViewController {
    
    var auth: Auth?
    
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
        self.auth = Auth.auth()
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
    
    func passCorrect(){
        viewModel.confirmCorrect(textField: register.confirmPasswordTextfield)
        viewModel.passCorrect(textField: register.passwordTextfield)
    }
    
    func passIncorrect(){
        viewModel.confirWorse(textField: register.confirmPasswordTextfield)
        viewModel.passWorse(textField: register.passwordTextfield)
    }
    
    func passEmpty(){
        viewModel.confirmEmpty(textField: register.confirmPasswordTextfield)
        viewModel.passEmpty(textField: register.passwordTextfield)
    }
}

extension RegisterScreenViewController: RegisterScreenProtocol{
    func tapToBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func registerButton() {
        
        let email: String = self.register.emailTextField.text ?? ""
        let password: String = self.register.passwordTextfield.text ?? ""
        
        let vc = SucessRegisterViewController()
        vc.recebeDado = register.emailTextField.text ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
        self.auth?.createUser(withEmail: email , password: password, completion: { result, error in
                
            if error != nil{
                print("Erro ao cadastrar")
            }else{
                print("Sucesso ao cadastrar")
            }
        
        })
        
        
        
    }
}

extension RegisterScreenViewController: UITextFieldDelegate{
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if viewModel.validateIsEmpty(user: register.userTextField.text ?? "", email: register.emailTextField.text ?? "", pass: register.passwordTextfield.text ?? "", confirm: register.confirmPasswordTextfield.text ?? ""){
            viewModel.turnButtonOn(button: register.createButton)
            if viewModel.passIsEqual(pass: register.passwordTextfield.text ?? "", confirm: register.confirmPasswordTextfield.text ?? ""){
                passCorrect()
            }else if !viewModel.passIsEqual(pass: register.passwordTextfield.text ?? "", confirm: register.confirmPasswordTextfield.text ?? ""){
                passIncorrect()
                viewModel.turnButtonOff(button: register.createButton)
            }else if viewModel.isTextFieldEmpty(register.userTextField, textField2: register.emailTextField, textField3: register.passwordTextfield, textField4: register.confirmPasswordTextfield){
                register.emailTextField.layer.borderColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1).cgColor
            }else{
                passEmpty()
            }
        }else{
            viewModel.turnButtonOff(button: register.createButton)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
          
        if string == " " && textField == register.userTextField || string == " " && textField == register.emailTextField || string == " " && textField == register.passwordTextfield || string == " " && textField == register.confirmPasswordTextfield{
              textField.layer.borderColor = UIColor.red.cgColor
               DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100), execute: {
                        textField.layer.borderColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1).cgColor
               })
               return false
           }
           return true
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
    

