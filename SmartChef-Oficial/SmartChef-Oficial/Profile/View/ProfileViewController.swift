import PhotosUI
import UIKit

protocol ProfileViewControllerProtocol: AnyObject{
    
    func tapExit()
}
class ProfileViewController: UIViewController{
    
    weak private var profileViewControllerProtocol: ProfileViewControllerProtocol?
    
    func setupDelegate(delegate: ProfileViewControllerProtocol){
        self.profileViewControllerProtocol = delegate
    }
    
    var profileScreen: ProfileScreen?
    
    override func loadView() {
        self.profileScreen = ProfileScreen()
        self.view = self.profileScreen
        self.view.backgroundColor = .yellowBase
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileScreen?.setupDelegate(delegate: self)
    }
    
    func showPicker(){
        
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 0
                        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        present(picker, animated: true)
               
    }
}

extension ProfileViewController: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1).cgColor
        textField.layer.borderWidth = 2
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1).cgColor
        textField.layer.borderWidth = 0
        textField.isEnabled = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
    }
}

extension ProfileViewController: ProfileScreenProtocol {
     
    func tapToChangeImage() {
        showPicker()
    }
    
    func tapToExit(){
        self.profileViewControllerProtocol?.tapExit()
    }
    
}

extension ProfileViewController: PHPickerViewControllerDelegate, UINavigationControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        if let itemProvider = results.first?.itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
                DispatchQueue.main.async {
                    guard let self = self, let image = image as? UIImage else { return }
                    self.profileScreen?.profileUserImage.image = image
                }
            }
        }
    }
}




