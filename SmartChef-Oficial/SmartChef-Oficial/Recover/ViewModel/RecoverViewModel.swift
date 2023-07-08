import Foundation

class RecoverViewModel{
    
    public func validateIsEmpty(user: String, email: String, pass: String, confirm: String) -> Bool {
        
        let isEmailValid = email.isEmpty

        return isEmailValid
    }
    
}
