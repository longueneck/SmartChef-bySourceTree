import UIKit

class RegisterViewModel{
    
    public func validateIsEmpty(user: String, email: String, pass: String, confirm: String) -> Bool {
        
        let isUserValid = !user.isEmpty
        let isEmailValid = !email.isEmpty
        let isEmailCorrect = email.contains("@") && email.contains(".com")
        let isPasswordValid = !pass.isEmpty
        let isConfirmValid = !confirm.isEmpty
        
        return isUserValid && isEmailValid && isEmailCorrect && isPasswordValid && isConfirmValid
    }
    
    public func validateEmailCorrect(textField: String) -> Bool{
        let emailCorrect = textField.contains("@") && textField.contains(".com")
        return emailCorrect
    }
    
    public func passIsEqual(pass: String, confirm: String) -> Bool{
        return pass == confirm
    }
    
    public func getEmail(email: UITextField)-> String{
        return email.text ?? ""
    }
    
    public func getPass(pass: UITextField)-> String{
        return pass.text ?? ""
    }
    
    public func getName(name: UITextField)-> String{
        return name.text ?? ""
    }
}
