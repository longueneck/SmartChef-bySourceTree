//
//  RecoverViewController.swift
//  SmartChef-Oficial
//
//  Created by Kevin Longue on 05/07/23.
//

import UIKit

class RecoverViewController: UIViewController {

    var screen: RecoverScreen?
    
    override func loadView() {
        screen = RecoverScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightYellow
        screen?.setDelegate(delegate: self)
    }
  
}

extension RecoverViewController: RecoverScreenProtocol {
    func tappedRecover() {
        print("DEU BOM")
    }
}
