import UIKit

class RegisterViewModel{
    
    public func validateIsEmpty(user: String, email: String, pass: String, confirm: String) -> Bool {
        
        let isUserValid = !user.isEmpty
        let isEmailValid = email.contains("@") && email.contains(".com")
        let isPasswordValid = !pass.isEmpty
        let isConfirmValid = !confirm.isEmpty
        
        return isUserValid && isEmailValid && isPasswordValid && isConfirmValid
    }
    
    public func passIsEqual(pass: String, confirm: String) -> Bool{
        return confirm == pass
    }
    
    public func turnButtonOn(button: UIButton){
        button.isEnabled = true
        button.alpha = 1.0
    }
    
    public func turnButtonOff(button: UIButton){
        button.isEnabled = false
        button.alpha = 0.5
    }
    
    public func passCorrect(textField: UITextField){
        textField.layer.borderColor = UIColor(red: 28/255, green: 155/255, blue: 54/255, alpha: 1).cgColor
    }
    public func confirmCorrect(textField: UITextField){
        textField.layer.borderColor = UIColor(red: 28/255, green: 155/255, blue: 54/255, alpha: 1).cgColor
    }
    public func passWorse(textField: UITextField){
        textField.layer.borderColor = UIColor.red.cgColor
    }
    public func confirWorse(textField: UITextField){
        textField.layer.borderColor = UIColor.red.cgColor
    }

}
