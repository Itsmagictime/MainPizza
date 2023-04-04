import UIKit
import SnapKit

class BannerCell: UICollectionViewCell {
    
    static let reuseID = "BannerCell"
    
    var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubview(image)
        backgroundColor = .customGray
        setupConstraint()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 16
        image.clipsToBounds = false
        self.clipsToBounds = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup constraint
    private func setupConstraint() {
        image.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
