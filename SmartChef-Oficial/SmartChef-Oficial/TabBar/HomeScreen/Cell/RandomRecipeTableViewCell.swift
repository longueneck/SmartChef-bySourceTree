import UIKit

class RandomRecipeTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: RandomRecipeTableViewCell.self)
    
    var viewModel: HomeViewModel = HomeViewModel()
    
    lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = .moreVisits
        label.font = .sugarFont18
        label.textColor = .brownBase
        return label
    }()
    
    lazy var firstCollectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: .init() )
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clearColor
        collection.layer.shadowColor = UIColor.black.cgColor
        collection.layer.shadowOpacity = 0.1
        collection.layer.shadowOffset = CGSize(width: 0, height: 2)
        collection.layer.shadowRadius = 2
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.delaysContentTouches = false
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collection.register(RecipeScreenCollectionViewCell.self, forCellWithReuseIdentifier: RecipeScreenCollectionViewCell.identifier)
        collection.setCollectionViewLayout(layout, animated: true)
        collection.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        return collection
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
        configDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews() {
        self.addSubview(self.firstLabel)
        self.contentView.addSubview(self.firstCollectionView)
    }
    
    private func configDelegate(){
        firstCollectionView.delegate = self
        firstCollectionView.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        NSLayoutConstraint.activate([
            
            firstLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            firstLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            firstLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            
            firstCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            firstCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            firstCollectionView.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 10),
            firstCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension RandomRecipeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.generateRandomRecipes().count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = 250
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeScreenCollectionViewCell.identifier, for: indexPath) as? RecipeScreenCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setupCell(recipe: viewModel.generateRandomRecipes()[indexPath.row])
        return cell
    }
}
