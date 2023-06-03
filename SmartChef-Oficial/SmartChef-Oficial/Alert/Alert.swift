import Foundation
import UIKit

class Alert: NSObject{
    
    var controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func getAlert(title: String, message: String, completion: (()-> Void)? = nil){
        let alerControlller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelar = UIAlertAction(title: String.ok, style: .cancel) { acao in completion?()
        }
        alerControlller.addAction(cancelar)
        self.controller.present(alerControlller, animated: true)
    }
}
