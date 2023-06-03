import UIKit

class RecommendDrinkTableViewCell: UITableViewCell {
    
    var viewModel: HomeViewModel = HomeViewModel()
    
    static var identifier = "RecommendDrinkTableViewCell"
    
    lazy var firstLabel: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Experimente estas bebidas"
        text.font = UIFont(name: "Nice Sugar", size: 18)
        text.textColor = Color.Global.brownBase
    return text
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
        self.addSubview(self.firstLabel)
        self.contentView.addSubview(self.oneCollectionView)

        configDelegate()
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

extension RecommendDrinkTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.generateRandomRecipes().count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width * 0.7
        let height = collectionView.frame.height * 1
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DrinkCollectionViewCell.identifier, for: indexPath) as? DrinkCollectionViewCell
        cell?.setupCell(recipe: viewModel.generateRandomRecipes()[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
}
