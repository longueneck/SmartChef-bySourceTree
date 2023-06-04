import UIKit

class fourthUITableViewCell: UITableViewCell {
    
    static var identifier = String(describing: fourthUITableViewCell.self)
    
    var viewModel: HomeViewModel = HomeViewModel()
    
    lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = String.tryTheseDrinks
        label.font = UIFont(name: String.niceSugarFont, size: 18)
        label.textColor = Color.Global.brownBase
        return label
    }()
    
    
    lazy var oneCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: .init())
        collection.register(DrinkCollectionViewCell.self, forCellWithReuseIdentifier: DrinkCollectionViewCell.identifier)
        collection.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        collection.layer.shadowOffset = CGSize(width: 0, height: 2)
        collection.layer.shadowRadius = 2
        collection.layer.shadowOpacity = 0.1
        collection.layer.shadowColor = UIColor.black.cgColor
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.setCollectionViewLayout(layout, animated: true)
        collection.showsHorizontalScrollIndicator = false
        collection.showsVerticalScrollIndicator = false
        collection.delaysContentTouches = false
        return collection
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
        configDelegate()
    }
    
    private func addSubViews() {
        self.addSubview(self.firstLabel)
        self.contentView.addSubview(self.oneCollectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configDelegate(){
        oneCollectionView.delegate = self
        oneCollectionView.dataSource = self
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        configConstraints()
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            firstLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            firstLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            firstLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            
            oneCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            oneCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            oneCollectionView.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 10),
            oneCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

extension fourthUITableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.generateRandomRecipes().count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = 250
//        let height = collectionView.frame.height
        return CGSize(width: width, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DrinkCollectionViewCell.identifier, for: indexPath) as? DrinkCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setupCell(recipe: viewModel.generateRandomRecipes()[indexPath.row])
        return cell
    }
}
