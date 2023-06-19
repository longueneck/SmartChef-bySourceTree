
import UIKit

class PrepairViewController: UIViewController {
    
    var loading: Loading?
    var screen: HomeScreen?
    var prepair: PrepairScreen?
    var recipeTextContent: String = ""
    var viewModel: HomeViewModel = HomeViewModel()
    
    override func loadView() {
        self.prepair = PrepairScreen()
        self.view = prepair
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
       
        
    }
 
    
}

