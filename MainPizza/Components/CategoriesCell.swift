import UIKit
import SnapKit

class CategoriesCell: UICollectionViewCell {
    
    static let reuseID = "CategoriesCell"
    
    let categoriesLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "sf-ui-display-black", size: 1)
        label.textColor = .customRed.withAlphaComponent(0.4)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubview(categoriesLabel)
        backgroundColor = .customGray
        setupConstraint()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 16
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.customRed.withAlphaComponent(0.4).cgColor
        self.clipsToBounds = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup constraint
    private func setupConstraint() {
        categoriesLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
