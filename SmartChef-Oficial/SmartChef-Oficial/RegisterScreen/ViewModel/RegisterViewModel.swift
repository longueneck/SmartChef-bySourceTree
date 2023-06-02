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
    
    public func turnButtonOn(button: UIButton){
        button.isEnabled = true
        button.alpha = 1.0
    }
    
    public func turnButtonOff(button: UIButton){
        button.isEnabled = false
        button.alpha = 0.5
    }
    
    func isTextFieldEmpty(_ textField1: UITextField, textField2: UITextField, textField3: UITextField, textField4: UITextField ) -> Bool {
        return textField1.text == "" && textField2.text == "" && textField3.text == "" && textField4.text == ""
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
    public func passEmpty(textField: UITextField){
        textField.layer.borderColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1).cgColor
    }
    public func confirmEmpty(textField: UITextField){
        textField.layer.borderColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1).cgColor
        
    }
    
    public func getEmail(email: UITextField)-> String{
        return email.text ?? ""
    }
    
    public func getPass(pass: UITextField)-> String{
        return pass.text ?? ""
    }
    
}
