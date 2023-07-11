import UIKit

class RegisterViewModel{
    
    public func validateIsEmpty(user: String, email: String, pass: String, confirm: String) -> Bool {
        
        let isUserValid = !user.isEmpty
        let isEmailValid = !email.isEmpty
        let isExistentEmail = email.contains("@hotmail.com") || email.contains("@gmail.com") || email.contains("@outlook.com") || email.contains("@yahoo.com")
        let isPasswordValid = !pass.isEmpty
        let isValidPass = pass.count >= 8 && confirm.count >= 8
        let isConfirmValid = !confirm.isEmpty
        
        return isUserValid && isEmailValid && isPasswordValid && isConfirmValid && isExistentEmail && isValidPass
    }
    
    public func passIsEqual(pass: String, confirm: String) -> Bool{
        var validation: Bool
        if !pass.isEmpty && !confirm.isEmpty && pass == confirm {
         validation = true
        }else{
            validation = false
        }
        return validation
    }
    
    public func passAndConfirmIsEmpty(pass: String, confirm: String) -> Bool {
        var validation: Bool
        if pass.isEmpty && confirm.isEmpty {
            validation = false
        }else{
            validation = true
        }
        return validation
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
