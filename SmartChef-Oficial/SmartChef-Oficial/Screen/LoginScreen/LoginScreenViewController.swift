import UIKit

class LoginScreenViewController: UIViewController {
    
    var loginScreen: LoginScreen? //Call the LoginScreen inside the ViewController
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 255/255, green: 230/255, blue: 181/255, alpha: 1)
        addTfToDelegate()
        self.loginScreen?.delegate(delegate: self)
        
    }
    
    func addTfToDelegate(){
        loginScreen?.tfLogin.delegate = self
        loginScreen?.tfPassword.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        loginScreen?.tfLogin.resignFirstResponder()
        loginScreen?.tfPassword.resignFirstResponder()
    }
    
}

extension LoginScreenViewController: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1).cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1).cgColor
        self.loginScreen?.validateTextFields()
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
        self.navigationController?.pushViewController(MyTabBarController(), animated: true)
    }
}
