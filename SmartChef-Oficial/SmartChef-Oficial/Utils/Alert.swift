import UIKit

class Alert: NSObject{
    
    var controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func getAlert(title: String, message: String, completion: ((Bool)-> Void)? = nil){
        let alerControlller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelar = UIAlertAction(title: .ok, style: .cancel) { acao in completion?(true)
        }
        alerControlller.addAction(cancelar)
        self.controller.present(alerControlller, animated: true)
    }
    
    public func getAlertOption(title: String, message: String, completion : ((Bool)-> Void)? = nil){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { action in
            completion?(true)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { action in
            completion?(false)
        }
        alertController.addAction(ok)
        alertController.addAction(cancel)
        self.controller.present(alertController, animated: true)
    }
}
