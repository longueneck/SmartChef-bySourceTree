//
//  Alert.swift
//  SmartChef-Oficial
//
//  Created by Gabriel Mors  on 26/04/23.
//

import UIKit

class Alert {
    
    var controller: UIViewController?
    
    init(controller: UIViewController? = nil) {
        self.controller = controller
    }
    
    public func createAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel) { acao in
            completion?()
        }
        alertController.addAction(ok)
        self.controller?.present(alertController, animated: true)
    }

}
