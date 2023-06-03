import UIKit

struct PrepairRecipes{
    var nameImage: String
}

protocol PrepairCollectionViewCellProtocol{
    func tapToSaveFavorite()
}

class PrepairCollectionViewCell: UICollectionViewCell {

    static let identifier = "PrepairCollectionViewCell"
    var data: [PrepairRecipes] = []

    lazy var recipePrepairImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "hamburger")
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .blue
        image.clipsToBounds = true

        return image
    }()
    
    lazy var favorite: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = Color.Global.yellowBase
        
        button.clipsToBounds = true
        return button
    }()
    
        lazy var recipeNameLabel: UILabel = {
            let page = UILabel()
            page.translatesAutoresizingMaskIntoConstraints = false
            page.text = "Name Recipe"
            page.font = UIFont(name: "Nice Sugar", size: 20)
            page.numberOfLines = 0
            page.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
            return page
        }()
    
    lazy var typeRecipeLabel: UILabel = {
        let page = UILabel()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.text = "Type Recipe"
        page.font = UIFont.systemFont(ofSize: 17)
        page.numberOfLines = 0
        page.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return page
    }()
    
    lazy var timingToCook: UILabel = {
        let page = UILabel()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.text = "40 min"
        page.font = UIFont.systemFont(ofSize: 17)
        page.numberOfLines = 0
        page.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return page
    }()
    
    lazy var descriptionRecipeLabel: UILabel = {
        let page = UILabel()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.text = "Description Recipe"
        page.font = UIFont.systemFont(ofSize: 17)
        page.numberOfLines = 0
        page.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return page
    }()
    
    lazy var ingredientsRecipeLabel: UILabel = {
        let page = UILabel()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.text = "Array of Ingredients Recipe"
        page.font = UIFont.systemFont(ofSize: 17)
        page.numberOfLines = 0
        page.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return page
    }()
    
    lazy var prepareModeLabel: UILabel = {
        let page = UILabel()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.text = "Modo de Preparo:\n1. Comece pela massa da pizza, preparando uma massa macia e elástica. Amasse os ingredientes, como farinha de trigo, água, fermento, sal e um toque de azeite. Deixe a massa descansar e crescer por um tempo.\n2. Em seguida, abra a massa em formato circular, usando as mãos ou um rolo de macarrão. A espessura vai depender do seu gosto pessoal, se prefere uma massa fina e crocante ou mais grossa e fofinha.\n3. Prepare o molho de tomate, usando tomates frescos maduros, alho, azeite, sal e uma pitada de açúcar para equilibrar a acidez. Cozinhe os ingredientes em fogo baixo até obter um molho encorpado e saboroso.\n4. Espalhe o molho de tomate sobre a massa, deixando uma borda livre para formar a crosta da pizza.\n5. Cubra a pizza com fatias generosas de queijo muçarela, que irá derreter e criar uma cobertura deliciosa.\n6. Leve a pizza ao forno pré-aquecido em temperatura alta por cerca de 15 minutos, ou até que a massa esteja dourada e o queijo derretido e levemente gratinado.\n7. Retire a pizza do forno e finalize com folhas frescas de manjericão, que trarão um aroma e sabor irresie trigo, água, fermento, sal e um toque de azeite. Deixe a massa descansar e crescer por um tempo.\n2. Em seguida, abra a massa em formato circular, usando as mãos ou um rolo de macarrão. A espessura vai depender do seu gosto pessoal, se prefere uma massa fina e crocante ou mais grossa e fofinha.\n3. Prepare o molho de tomate, usando tomates frescos maduros, alho, azeite, sal e uma pitada de açúcar para equilibrar a acidez. Cozinhe os ingredientes em fogo baixo até obter um molho encorpe trigo, água, fermento, sal e um toque de azeite. Deixe a massa descansar e crescer por um tempo.\n2. Em seguida, abra a massa em formato circular, usando as mãos ou um rolo de macarrão. A espessura vai depender do seu gosto pessoal, se prefere uma massa fina e crocante ou mais grossa e fofinha.\n3. Prepare o molho de tomate, usando tomates frescos maduros, alho, azeite, sal e uma pitada de açúcar para equilibrar a acidez. Cozinhe os ingredientes em fogo baixo até obter um molho encorp"
        page.font = UIFont.systemFont(ofSize: 17)
        page.numberOfLines = 0
        page.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return page
    }()
    
    lazy var prepairLevelLabel: UILabel = {
        let page = UILabel()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.text = "Level"
        page.font = UIFont.systemFont(ofSize: 17)
        page.numberOfLines = 0
        page.textColor = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        return page
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        setConstraints()
    }
    
    func addSubViews(){
        self.contentView.addSubview(self.recipePrepairImage)
        self.contentView.addSubview(self.recipeNameLabel)
        self.contentView.addSubview(self.favorite)
        self.contentView.addSubview(self.typeRecipeLabel)
        self.contentView.addSubview(self.timingToCook)
        self.contentView.addSubview(self.descriptionRecipeLabel)
        self.contentView.addSubview(self.ingredientsRecipeLabel)
        self.contentView.addSubview(self.prepareModeLabel)
        self.contentView.addSubview(self.prepairLevelLabel)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setupCell(data: PrepairRecipes){
        self.recipePrepairImage.image = UIImage(named: data.nameImage)
    }

    @objc func tapToFavorite(){
        if favorite.isSelected{
            favorite.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
            favorite.isSelected = true
        }else{
            favorite.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
            favorite.isSelected = false
        }
    }

    private func setConstraints(){
        NSLayoutConstraint.activate([

            recipePrepairImage.topAnchor.constraint(equalTo: topAnchor),
            recipePrepairImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            recipePrepairImage.heightAnchor.constraint(equalToConstant: 200),
            recipePrepairImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            recipeNameLabel.topAnchor.constraint(equalTo: recipePrepairImage.bottomAnchor, constant: 15),
            recipeNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
            favorite.topAnchor.constraint(equalTo: recipePrepairImage.bottomAnchor, constant: 15),
            favorite.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            favorite.widthAnchor.constraint(equalToConstant: 30),
            favorite.heightAnchor.constraint(equalToConstant: 30),
            
            typeRecipeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            typeRecipeLabel.topAnchor.constraint(equalTo: recipeNameLabel.bottomAnchor, constant: 15),
            
            timingToCook.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            timingToCook.topAnchor.constraint(equalTo: typeRecipeLabel.bottomAnchor, constant: 15),
            
            descriptionRecipeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            descriptionRecipeLabel.topAnchor.constraint(equalTo: timingToCook.bottomAnchor, constant: 15),
            
            ingredientsRecipeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            ingredientsRecipeLabel.topAnchor.constraint(equalTo: descriptionRecipeLabel.bottomAnchor, constant: 15),
            
            prepareModeLabel.topAnchor.constraint(equalTo: ingredientsRecipeLabel.bottomAnchor, constant: 15),
            prepareModeLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            prepareModeLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
//            prepairLevelLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            prepairLevelLabel.topAnchor.constraint(equalTo: prepareModeLabel.bottomAnchor, constant: 15),
            
            
        ])
    }


}

