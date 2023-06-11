import UIKit

class SucessRegisterViewController: UIViewController {
    
    var sucess: SucessRegisterScreen?
    var recipe: NewFavoriteScreen?
    var recebeDado: String = ""
    
    override func loadView() {
        self.sucess = SucessRegisterScreen()
        self.view = self.sucess
        self.sucess?.delegate(delegate: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        sucess?.messageEmailSend.text = recebeDado
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}


extension SucessRegisterViewController: SucessRegisterScreenProtocol{
    
    func goToLoginScreen() {
        navigationController?.popToRootViewController(animated: true)
    }
    

    
}
