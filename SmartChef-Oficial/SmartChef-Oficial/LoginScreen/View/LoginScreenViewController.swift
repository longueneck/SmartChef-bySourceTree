
import UIKit
import FirebaseAuth


class LoginScreenViewController: UIViewController {
    
    var viewModel: LoginViewModel = LoginViewModel()
    var loginScreen: LoginScreen = LoginScreen()
    var alert: Alert?
    var auth: Auth = Auth.auth()
    
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(red: 255/255, green: 230/255, blue: 181/255, alpha: 1)
        self.viewModel = LoginViewModel()
        self.alert = Alert(controller: self)

        loginScreen.delegate(delegate: self)
        addTfToDelegate()
        viewModel.turnButtonUnEnable(button: loginScreen.loginButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        viewModel.resetData(view: loginScreen)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.resetDataTextField(email: loginScreen.loginTextField, pass: loginScreen.passwordTextField)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        loginScreen.loginTextField.resignFirstResponder()
        loginScreen.passwordTextField.resignFirstResponder()
    }
    
    func addTfToDelegate(){
        loginScreen.loginTextField.delegate = self
        loginScreen.passwordTextField.delegate = self
    }
}

extension LoginScreenViewController: UITextFieldDelegate{
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        

        if viewModel.validateLoginButton(email: viewModel.getEmail(email: loginScreen.loginTextField), password: viewModel.getPass(pass: loginScreen.passwordTextField)){

            viewModel.turnButtonEnable(button: loginScreen.loginButton)
        }else{
            viewModel.turnButtonUnEnable(button: loginScreen.loginButton)
            if viewModel.isTextFieldEmpty(loginScreen.loginTextField){
                loginScreen.loginTextField.layer.borderColor = ProjectColor.globalCGColor.yellowBase
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        
        if string == " " && textField == loginScreen.loginTextField{
            loginScreen.loginTextField.layer.borderColor = UIColor.red.cgColor
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100), execute: {
                self.loginScreen.loginTextField.layer.borderColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1).cgColor
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

extension LoginScreenViewController: LoginScreenProtocol{
    func actionRegister() {
        
        self.navigationController?.pushViewController(RegisterScreenViewController(), animated: true)
    }
    
    func actionButton() {
        
        guard self.loginScreen != nil else {return}
        
        let email = viewModel.getEmail(email: loginScreen.loginTextField)
        let pass = viewModel.getPass(pass: loginScreen.passwordTextField)
        
        self.auth.signIn(withEmail: email, password: pass , completion: { (usuario, error) in
            if error != nil{
                self.alert?.getAlert(title: "Atenção", message: "Email e/ou senha incorretos, tente novamente")
            }else{
                if usuario == nil{
                    self.alert?.getAlert(title: "Atenção", message: "Por favor, insira seu email e tente novamente")
                }else{
                    self.navigationController?.pushViewController(MyTabBarController(), animated: true)
                }
            }
            
        }
        )
    }

}

