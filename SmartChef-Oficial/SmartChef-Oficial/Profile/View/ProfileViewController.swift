import PhotosUI
import UIKit
import Firebase
protocol ProfileViewControllerProtocol: AnyObject{
    
    func tapExit()
}
class ProfileViewController: UIViewController{
    
    weak private var profileViewControllerProtocol: ProfileViewControllerProtocol?
    private var firestore = Firestore.firestore()
    private var auth = Auth.auth()
    private var profileScreen: ProfileScreen? = ProfileScreen()
    private var idUserLogged: String?

    func setupDelegate(delegate: ProfileViewControllerProtocol){
        self.profileViewControllerProtocol = delegate
    }
    
    required init(_ name: String?) {
        super.init(nibName: nil, bundle: nil)
        profileScreen?.nameLabel.text = name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = self.profileScreen
        self.view.backgroundColor = .yellowBase
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        if let id = self.auth.currentUser?.uid {
            self.idUserLogged = id
            getUserInfo()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileScreen?.setupDelegate(delegate: self)
    }
    
    private func getUserInfo() {
        guard let idUserLogged = self.idUserLogged else { return }
        let user = self.firestore.collection("user").document(idUserLogged)
        
        user.getDocument(completion: { snapshot, error in
            if let error = error {
                print("Error fetching user data: \(error)")
            }
            
            if let data = snapshot?.data() {
                let name = data["nome"] as? String
                
                guard let profileScreen = self.profileScreen else {return}
                profileScreen.nameLabel.text  = name ?? ""
            }
        })
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


extension ProfileViewController: ProfileScreenProtocol {
     
    func tapToChangeImage() {
        showPicker()
    }
    
    func tapToExit(){
        self.profileViewControllerProtocol?.tapExit()
    }
    
    func tapToDelete() {
        Alert(controller: self).getAlertOption(title: "Alerta", message: "Deseja realmente excluir sua conta? Após confirmação, seus dados serão deletados e não será possível recuperá-los.") {option in
            if option {
             //   self.firestore.collection("User").document().delete()
            }
        }
    }
}


