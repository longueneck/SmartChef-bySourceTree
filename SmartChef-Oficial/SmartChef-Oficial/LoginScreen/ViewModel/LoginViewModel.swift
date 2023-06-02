import UIKit
import Foundation

class LoginViewModel {
    
    public func resetTextFields(emailTextField: UITextField, passTextField: UITextField){
        if emailTextField.state.isEmpty && passTextField.state.isEmpty {
            emailTextField.layer.borderColor = ProjectColor.globalCGColor.yellowBase
            passTextField.layer.borderColor = ProjectColor.globalCGColor.yellowBase
        }
    }
    
    public func validateLoginButton(email: String, password: String) -> Bool {
        let isEmailValid = email.contains("@") && email.contains(".com")
        let isPasswordValid = !password.isEmpty
        print(email)
        return isEmailValid && isPasswordValid
    }
    
    public func validateWhiteSpace(textField: UITextField) -> Bool {
        let trimmedText = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        return trimmedText.isEmpty
    }
    
    public func turnButtonEnable(button: UIButton){
        button.isEnabled = true
        button.alpha = 1.0
    }
    
    public func turnButtonUnEnable(button: UIButton){
        button.isEnabled = false
        button.alpha = 0.5
    }
    
    func isTextFieldEmpty(_ textField: UITextField) -> Bool {
        return textField.text == ""
        }
    
    public func getEmail(email: UITextField)-> String{
        return email.text ?? ""
    }
    
    public func getPass(pass: UITextField)-> String{
        return pass.text ?? ""
    }
    
    public func resetDataTextField(email: UITextField, pass: UITextField){
        email.text = ""
        pass.text = ""
    
    }
    
    public func resetData(view: UIView){
        view.reloadInputViews()
    }
    
}

