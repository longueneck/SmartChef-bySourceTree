import UIKit

class LoginScreenViewController: UIViewController {
    
    var loginScreen: LoginScreen?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 255/255, green: 230/255, blue: 181/255, alpha: 1)
        addTfToDelegate()
        self.loginScreen?.delegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        loginScreen?.loginTextField.resignFirstResponder()
        loginScreen?.passwordTextField.resignFirstResponder()
    }
    
    func addTfToDelegate(){
        loginScreen?.loginTextField.delegate = self
        loginScreen?.passwordTextField.delegate = self
    }
}

//-----------------------------------------------------------------------------------------------------------
//MARK: EXTENSION TEXTFIELD DELEGATES

extension LoginScreenViewController: UITextFieldDelegate{
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        self.loginScreen?.ifContain()
        self.loginScreen?.validateWhiteSpace()
        self.loginScreen?.validateTextFields()
        self.loginScreen?.resetTextFIelds()
        
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
    


//-----------------------------------------------------------------------------------------------------------
//MARK: EXTENSION BUTTON PROTOCOL

extension LoginScreenViewController: LoginScreenProtocol{
    func actionRegister() {
        self.navigationController?.pushViewController(RegisterScreenViewController(), animated: true)
    }
    
    func actionButton() {
        self.navigationController?.pushViewController(MyTabBarController(), animated: true)
    }
}
