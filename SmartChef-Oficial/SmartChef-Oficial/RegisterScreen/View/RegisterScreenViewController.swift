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
        register.turnButtonOff(button: register.createButton)
        self.auth = Auth.auth()
    }
    
    private func addDelegateToTextFields() {
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
        register.confirmCorrect(textField: register.confirmPasswordTextfield)
        register.passCorrect(textField: register.passwordTextfield)
    }

    func passIncorrect(){
        register.confirWorse(textField: register.confirmPasswordTextfield)
        register.passWorse(textField: register.passwordTextfield)
    }

    func passEmpty(){
        register.confirmEmpty(textField: register.confirmPasswordTextfield)
        register.passEmpty(textField: register.passwordTextfield)
    }
}

extension RegisterScreenViewController: RegisterScreenProtocol{
    func tapToBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func registerButton() {

        let vc = SucessRegisterViewController()
        vc.recebeDado = viewModel.getEmail(email: register.emailTextField)
        
        let email: String = viewModel.getEmail(email: register.emailTextField)
        let password: String = viewModel.getPass(pass: register.passwordTextfield)
        
        self.auth?.createUser(withEmail: email , password: password, completion: { result, error in
                
            if error != nil{
                #warning("Colocar os ALERTS depois!!!")
            }else{
                #warning("Colocar os ALERTS depois!!!")
                self.navigationController?.pushViewController(vc, animated: true)
            }
        })
    }
}

extension RegisterScreenViewController: UITextFieldDelegate{
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if viewModel.validateIsEmpty(user: register.userTextField.text ?? "", email: register.emailTextField.text ?? "", pass: register.passwordTextfield.text ?? "",
                                     confirm: register.confirmPasswordTextfield.text ?? "") {
            
            register.turnButtonOn(button: register.createButton)
            
            if viewModel.passIsEqual(
                pass: register.passwordTextfield.text ?? "",
                confirm: register.confirmPasswordTextfield.text ?? "") {
                passCorrect()
                
            }else if !viewModel.passIsEqual(pass: register.passwordTextfield.text ?? "", confirm: register.confirmPasswordTextfield.text ?? "") {
                
                passIncorrect()
                register.turnButtonOff(button: register.createButton)
                
            }else if register.isTextFieldEmpty(register.userTextField, textField2: register.emailTextField, textField3: register.passwordTextfield, textField4: register.confirmPasswordTextfield) {
                
                register.emailTextField.layer.borderColor = UIColor.lightYellowCG
                
            }else{
                passEmpty()
            }
        }else{
            register.turnButtonOff(button: register.createButton)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
          
        if string == " " && textField == register.userTextField || string == " " && textField == register.emailTextField || string == " " && textField == register.passwordTextfield || string == " " && textField == register.confirmPasswordTextfield{
              textField.layer.borderColor = UIColor.red.cgColor
               DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100), execute: {
                   textField.layer.borderColor = UIColor.lightYellowCG
               })
               return false
           }
           return true
       }
    
        func textFieldDidBeginEditing(_ textField: UITextField) {
            textField.layer.borderColor = UIColor.brownBaseCG
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            textField.layer.borderColor = UIColor.yellowBaseCG
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
        }
    }
    

