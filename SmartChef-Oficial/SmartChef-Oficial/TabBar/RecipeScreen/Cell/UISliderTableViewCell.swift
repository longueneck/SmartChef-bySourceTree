import UIKit

class UISliderTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: UISliderTableViewCell.self)
    
    lazy var howManyTimeSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        return slider
    }()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubViews()
        configConstraints()
    }
    
    private func addSubViews() {
        self.addSubview(self.howManyTimeSlider)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            howManyTimeSlider.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            howManyTimeSlider.leadingAnchor.constraint(equalTo: leadingAnchor),
            howManyTimeSlider.trailingAnchor.constraint(equalTo: trailingAnchor),
            howManyTimeSlider.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}
