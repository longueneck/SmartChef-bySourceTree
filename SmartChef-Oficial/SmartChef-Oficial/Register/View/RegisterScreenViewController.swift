import UIKit
import FirebaseAuth
import Firebase

protocol RegisterScreenViewControllerProtocol: AnyObject {
    func registerAccount()
}


class RegisterScreenViewController: UIViewController {
    
    var auth: Auth?
    var register: RegisterScreen = RegisterScreen()
    var viewModel: RegisterViewModel = RegisterViewModel()
    var firestore = Firestore.firestore()
    weak var delegate : RegisterScreenViewControllerProtocol?
    
    public func delegate(delegate : RegisterScreenViewControllerProtocol?){
        self.delegate = delegate
    }
    
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

    @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
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
        let name: String = viewModel.getName(name: register.userTextField)
        
        self.auth?.createUser(withEmail: email , password: password, completion: { result, error in
            // Firestore Call to FrameWork
            if error == nil{
                if let idUser = result?.user.uid{
                    self.firestore.collection("user").document(idUser).setData([
                        "nome": name,
                        "email": email,
                        "id":idUser
                    ])
                }
                Alert(controller: self).getAlert(title: "Sucesso", message: "Usuário cadastrado com sucesso"){
                    action in
                    if action {
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                }
            }else{
                Alert(controller: self).getAlert(title: "Ops, Houve um erro", message: error?.localizedDescription ?? "")
            }
        })
    }
}

extension RegisterScreenViewController: UITextFieldDelegate{
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if viewModel.validateIsEmpty(user: register.userTextField.text ?? "", email: register.emailTextField.text ?? "", pass: register.passwordTextfield.text ?? "",
                                     confirm: register.confirmPasswordTextfield.text ?? "") {
            register.turnButtonOn(button: register.createButton)
            
            if viewModel.passIsEqual(pass: register.passwordTextfield.text ?? "", confirm: register.confirmPasswordTextfield.text ?? "") {
                passCorrect()
                
            }else if !viewModel.passIsEqual(pass: register.passwordTextfield.text ?? "", confirm: register.confirmPasswordTextfield.text ?? "") {
                
                register.confirmPasswordTextfield.layer.borderColor = UIColor.redIncorrectCG
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


