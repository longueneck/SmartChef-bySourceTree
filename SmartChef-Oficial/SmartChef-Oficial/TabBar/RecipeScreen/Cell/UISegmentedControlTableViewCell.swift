import UIKit

class UISegmentedControlTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: UISegmentedControlTableViewCell.self)
    
    lazy var manyPeopleLabel: UILabel = {
        let insert = UILabel()
        insert.translatesAutoresizingMaskIntoConstraints = false
        insert.text = .manyPeople
        insert.textColor = .brownBase
        insert.numberOfLines = 0
        insert.font = .sugarFont17
        return insert
    }()
    
    lazy var manyPeopleSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["1", "2", "3", "4", "+5"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 1
        segmentedControl.layer.cornerRadius = 20
        segmentedControl.backgroundColor = .whiteBase
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.backgroundColor: UIColor.whiteBase], for: .normal)
        segmentedControl.selectedSegmentTintColor = .yellowBase
        let font = UIFont.sugarFont14
        let fontSelected = UIFont.sugarFont20
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.brownBase, NSAttributedString.Key.font: font], for: .normal)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.brownBase, NSAttributedString.Key.font: fontSelected], for: .selected)
        return segmentedControl
    }()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubViews()
        configConstraints()
    }
    
    private func addSubViews() {
        self.addSubview(self.manyPeopleLabel)
        self.addSubview(self.manyPeopleSegmentedControl)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            manyPeopleLabel.topAnchor.constraint(equalTo: bottomAnchor, constant: 20),
            manyPeopleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
            manyPeopleSegmentedControl.heightAnchor.constraint(equalToConstant: 45),
            manyPeopleSegmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            manyPeopleSegmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            manyPeopleSegmentedControl.topAnchor.constraint(equalTo: manyPeopleLabel.bottomAnchor, constant: 7),
        ])
    }
}





