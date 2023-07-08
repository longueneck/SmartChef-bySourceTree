
import UIKit
import FirebaseAuth

class LoginScreenViewController: UIViewController {
    
    var viewModel: LoginViewModel = LoginViewModel()
    var loginScreen: LoginScreen = LoginScreen()
    var alert: Alert?
    var auth: Auth = Auth.auth()
    var loading: Loading?
    var profileViewModel: ProfileViewModel = ProfileViewModel()
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightYellow
        self.viewModel = LoginViewModel()
        loading = Loading(viewController: self)
        self.alert = Alert(controller: self)
        loginScreen.delegate(delegate: self)
        profileViewModel.delegate(delegate: self)
        addTfToDelegate()
        viewModel.turnButtonUnEnable(button: loginScreen.loginButton)
        loginScreen.loginTextField.text = "sergio.macedo@gmail.com"
        loginScreen.passwordTextField.text = "123456"
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
                loginScreen.loginTextField.layer.borderColor = UIColor.yellowBaseCG
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string == " " && textField == loginScreen.loginTextField{
            loginScreen.loginTextField.layer.borderColor = UIColor.red.cgColor
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100), execute: {
                self.loginScreen.loginTextField.layer.borderColor = UIColor.yellowBaseCG
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

extension LoginScreenViewController: LoginScreenProtocol{
    func resetPass() {
        self.navigationController?.pushViewController(RecoverViewController(), animated: true)
    }
    
    func actionRegister() {
        self.navigationController?.pushViewController(RegisterScreenViewController(), animated: true)
    }
    
    func actionButton() {
        guard self.loginScreen != nil else {return}
        
        let email = viewModel.getEmail(email: loginScreen.loginTextField)
        let pass = viewModel.getPass(pass: loginScreen.passwordTextField)
        self.loading?.show(message: "< Acordando o Chef >")
        
        self.auth.signIn(withEmail: email, password: pass , completion: { (usuario, error) in
            if error == nil{
                self.loading?.hide()
                if usuario == nil{
                    self.alert?.getAlert(title: .titleAlert, message: .messageAlertTwo)
                }else{
                    self.profileViewModel.loadCurrentUser()
                }
            }else{
                self.loading?.hide()
                self.alert?.getAlert(title: .titleAlert, message: .messageAlertOne)
            }
        })
    }
}

extension LoginScreenViewController : ProfileViewModelProtocol{
    func sucess() {
        self.navigationController?.pushViewController(MyTabBarController(), animated: true)
    }
    
    func Failure() {
        
    }
    
    
}

