import Foundation
import UIKit

class SucessRegisterViewController: UIViewController {
    
    var sucess: SucessRegisterScreen?
    
    override func loadView() {
        self.sucess = SucessRegisterScreen()
        self.view = self.sucess
        self.sucess?.delegate(delegate: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}

extension SucessRegisterViewController: SucessRegisterScreenProtocol{
    
    func goToLoginScreen() {
        self.navigationController?.pushViewController(LoginScreenViewController(), animated: true)
    }
    

    
}
