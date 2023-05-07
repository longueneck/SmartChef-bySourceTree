import UIKit
import Foundation

class LoginViewModel {
    
    public func resetTextFields(emailTextField: UITextField, passTextField: UITextField){
        if emailTextField.state.isEmpty && passTextField.state.isEmpty {
            emailTextField.layer.borderColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1).cgColor
            passTextField.layer.borderColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1).cgColor
        }
    }
    
    public func validateLoginButton(email: String, password: String) -> Bool {
        let isEmailValid = email.contains("@") && email.contains(".com")
        let isPasswordValid = !password.isEmpty
        
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
    
}

