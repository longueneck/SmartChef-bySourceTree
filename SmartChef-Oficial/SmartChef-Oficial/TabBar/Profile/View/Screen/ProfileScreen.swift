import UIKit

protocol ProfileScreenProtocol: AnyObject{
    
    func tapToExit()
    func tapToCancel()
    func tapToSave()
}

class ProfileScreen: UIView {
    
    weak private var profileScreenProtocol: ProfileScreenProtocol?
    
    func setupDelegate(delegate: ProfileScreenProtocol){
        self.profileScreenProtocol = delegate
    }
    
    lazy var cancelButton: UIButton = {
        let cancel = UIButton()
        cancel.translatesAutoresizingMaskIntoConstraints = false
        cancel.setTitle("Cancelar", for: .normal)
        cancel.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        cancel.setTitleColor(UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1), for: .normal)
        cancel.addTarget(self, action: #selector(tappetCancelButton), for: .touchUpInside)
        return cancel
    }()
    
    lazy var saveButton: UIButton = {
        let save = UIButton()
        save.translatesAutoresizingMaskIntoConstraints = false
        save.setTitle("Salvar", for: .normal)
        save.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        save.setTitleColor(UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1), for: .normal)
        save.addTarget(self, action: #selector(tappedSaveButton), for: .touchUpInside)
        
        return save
    }()
    
    lazy var viewBG: UIView = {
        let bg = UIView()
        bg.translatesAutoresizingMaskIntoConstraints = false
        bg.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        bg.layer.cornerRadius = 75
        bg.layer.shadowColor = UIColor.black.cgColor
        bg.layer.shadowOpacity = 0.3
        bg.layer.shadowOffset = CGSize(width: 0, height: 3)
        bg.layer.shadowRadius = 2
        
        return bg
    }()
    
    lazy var userPhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 70
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "sorria")
        
        return imageView
    }()
    
    lazy var backButtom: UIButton = {
        let back = UIButton()

        return back
    }()
    
    lazy var bgYellow: UIView = {
        let bg = UIView()
        bg.translatesAutoresizingMaskIntoConstraints = false
        bg.backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 20/255, alpha: 1)
        
        return bg
    }()
    
    lazy var imageBalls: UIImageView = {
        let balls = UIImageView()
        balls.translatesAutoresizingMaskIntoConstraints = false
        balls.image = UIImage(named: "balls2")
        balls.contentMode = .scaleAspectFit
        
        return balls
    }()
    
    lazy var changePic: UILabel = {
        let change = UILabel()
        change.translatesAutoresizingMaskIntoConstraints = false
        change.text = "Alterar imagem de perfil"
        change.font = UIFont.boldSystemFont(ofSize: 11)
        change.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        
        return change
    }()
    
    lazy var lbName: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Nome"
        name.font = UIFont.boldSystemFont(ofSize: 16)
        name.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        
        return name
    }()
    
    lazy var tfName: UITextField = {
        let tfname = UITextField()
        tfname.translatesAutoresizingMaskIntoConstraints = false
        tfname.backgroundColor = .white
        tfname.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        tfname.text = "Kevin Longue"
        tfname.layer.cornerRadius = 10
        let paddinView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tfname.frame.height))
        tfname.leftView = paddinView
        tfname.leftViewMode = .always
        return tfname
    }()
    
    lazy var pencilChance: UIImageView = {
        let pencil = UIImageView()
        pencil.translatesAutoresizingMaskIntoConstraints = false
        pencil.image = UIImage(systemName: "pencil")
        pencil.contentMode = .scaleAspectFit
        pencil.tintColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        
        return pencil
    }()
    
    lazy var lbEmail: UILabel = {
        let email = UILabel()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.text = "Email"
        email.font = UIFont.boldSystemFont(ofSize: 16)
        email.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        
        return email
    }()
    
    lazy var tfEmail: UITextField = {
        let email = UITextField()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.backgroundColor = .white
        email.text = "exemplo123@gmail.com"
        email.layer.cornerRadius = 10
        email.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        let paddinView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: email.frame.height))
        email.leftView = paddinView
        email.leftViewMode = .always
        
        return email
    }()
    
    lazy var pencilChance2: UIImageView = {
        let pencil = UIImageView()
        pencil.translatesAutoresizingMaskIntoConstraints = false
        pencil.image = UIImage(systemName: "pencil")
        pencil.contentMode = .scaleAspectFit
        pencil.tintColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        
        return pencil
    }()
    
    lazy var lbPass: UILabel = {
        let email = UILabel()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.text = "Senha"
        email.font = UIFont.boldSystemFont(ofSize: 16)
        email.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        
        return email
    }()
    
    lazy var tfPass: UITextField = {
        let email = UITextField()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.backgroundColor = .white
        email.text = "*********"
        email.layer.cornerRadius = 10
        email.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        let paddinView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: email.frame.height))
        email.leftView = paddinView
        email.leftViewMode = .always
        
        return email
    }()
    
    lazy var pencilChance3: UIImageView = {
        let pencil = UIImageView()
        pencil.translatesAutoresizingMaskIntoConstraints = false
        pencil.image = UIImage(systemName: "pencil")
        pencil.contentMode = .scaleAspectFit
        pencil.tintColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        
        return pencil
    }()
    
    lazy var exitButton: UIButton = {
        
        let cancel = UIButton()
        cancel.translatesAutoresizingMaskIntoConstraints = false
        cancel.setTitle("Sair", for: .normal)
        cancel.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        cancel.setTitleColor(UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1), for: .normal)
        cancel.addTarget(self, action: #selector(tappedExitButton), for: .touchUpInside)
        
        return cancel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        funcAddViews()
        funcAddConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func funcAddViews(){
        
        self.addSubview(self.cancelButton)
        self.addSubview(self.saveButton)
        self.addSubview(self.viewBG)
        self.addSubview(self.userPhoto)
        self.addSubview(self.bgYellow)
        self.addSubview(self.imageBalls)
        self.addSubview(self.changePic)
        self.addSubview(self.lbName)
        self.addSubview(self.tfName)
        self.addSubview(self.pencilChance)
        self.addSubview(self.lbEmail)
        self.addSubview(self.tfEmail)
        self.addSubview(self.pencilChance2)
        self.addSubview(self.lbPass)
        self.addSubview(self.tfPass)
        self.addSubview(self.pencilChance3)
        self.addSubview(self.exitButton)

        subviews.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    @objc func tappedExitButton(){
        profileScreenProtocol?.tapToExit()
    }
    
    @objc func tappetCancelButton(){
        profileScreenProtocol?.tapToCancel()
    }
    
    @objc func tappedSaveButton(){
        profileScreenProtocol?.tapToSave()
    }
    
    private func funcAddConstraint(){
        NSLayoutConstraint.activate([
            
            cancelButton.topAnchor.constraint(equalTo: viewBG.topAnchor),
            cancelButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            saveButton.topAnchor.constraint(equalTo: viewBG.topAnchor),
            saveButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        
            viewBG.heightAnchor.constraint(equalToConstant: 150),
            viewBG.widthAnchor.constraint(equalToConstant: 150),
            viewBG.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            viewBG.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            
            userPhoto.heightAnchor.constraint(equalToConstant: 140),
            userPhoto.widthAnchor.constraint(equalToConstant: 140),
            userPhoto.centerXAnchor.constraint(equalTo: viewBG.centerXAnchor),
            userPhoto.centerYAnchor.constraint(equalTo: viewBG.centerYAnchor),
            
            changePic.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            changePic.topAnchor.constraint(equalTo: viewBG.bottomAnchor, constant: 10),
            
            bgYellow.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            bgYellow.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            bgYellow.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            bgYellow.topAnchor.constraint(equalTo: changePic.bottomAnchor, constant: 30),
            
            imageBalls.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            imageBalls.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            imageBalls.centerYAnchor.constraint(equalTo: bgYellow.topAnchor, constant: 0),
            imageBalls.heightAnchor.constraint(equalToConstant: 45),
            
            lbName.topAnchor.constraint(equalTo: imageBalls.bottomAnchor, constant: 5),
            lbName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            
            tfName.topAnchor.constraint(equalTo: lbName.bottomAnchor, constant: 8),
            tfName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            tfName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            tfName.heightAnchor.constraint(equalToConstant: 40),
            
            pencilChance.trailingAnchor.constraint(equalTo: tfName.trailingAnchor, constant: -15),
            pencilChance.centerYAnchor.constraint(equalTo: tfName.centerYAnchor),
            
            lbEmail.topAnchor.constraint(equalTo: tfName.bottomAnchor, constant: 8),
            lbEmail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            
            tfEmail.topAnchor.constraint(equalTo: lbEmail.bottomAnchor, constant: 8),
            tfEmail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            tfEmail.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            tfEmail.heightAnchor.constraint(equalToConstant: 40),
            
            pencilChance2.trailingAnchor.constraint(equalTo: tfEmail.trailingAnchor, constant: -15),
            pencilChance2.centerYAnchor.constraint(equalTo: tfEmail.centerYAnchor),
            
            lbPass.topAnchor.constraint(equalTo: tfEmail.bottomAnchor, constant: 8),
            lbPass.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            
            tfPass.topAnchor.constraint(equalTo: lbPass.bottomAnchor, constant: 8),
            tfPass.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            tfPass.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            tfPass.heightAnchor.constraint(equalToConstant: 40),
            
            pencilChance3.trailingAnchor.constraint(equalTo: tfPass.trailingAnchor, constant: -15),
            pencilChance3.centerYAnchor.constraint(equalTo: tfPass.centerYAnchor),
            
            exitButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            exitButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -30)
            
        ])
    }
}
