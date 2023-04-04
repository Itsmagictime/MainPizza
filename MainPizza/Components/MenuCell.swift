import Foundation
import UIKit
import SnapKit

class MenuCell: UITableViewCell {

    // MARK: - Properties
    
    static let reuseID = "MenuCell"
    
    let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
    let name: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "SFUIDisplay-Regular", size: 17)
        return label
    }()
    let detail: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.numberOfLines = 4
        label.font = UIFont(name: "SFUIDisplay-Regular", size: 13)
        return label
    }()
    let button: UIButton = {
        let button = UIButton()
        
        return button
    }()

    // MARK: - Initialiazation
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.setTitleColor(.customRed, for: .normal)
        button.layer.borderColor = UIColor.customRed.cgColor
        self.clipsToBounds = false
    }
    
    // MARK: - Module functions
    
    private func setupViews() {
        addSubviews([button,image,name,detail])
    }
    
    
    // MARK: - Setup constraints
    
    private func setupConstraints() {
        button.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(self).inset(screen.width / 15.625)
            make.height.equalTo(screen.height / 25.375)
            make.width.equalTo(screen.width / 4.31)
        }
        image.snp.makeConstraints { make in
            make.bottom.top.equalTo(self).inset(screen.width / 15.625)
            make.leading.equalTo(self).inset(screen.width / 23.44)
            make.height.equalTo(screen.width / 2.84)
            make.width.equalTo(screen.width / 2.84)
        }
        name.snp.makeConstraints { make in
            make.leading.equalTo(self).inset(screen.width / 1.98)
            make.top.equalTo(self).inset(screen.width / 11.72)
        }
        detail.snp.makeConstraints { make in
            make.leading.equalTo(self).inset(screen.width / 1.98)
            make.trailing.equalTo(self).inset(screen.width / 15.625)
            make.height.equalTo(screen.width / 4.26)
            make.top.equalTo(name).inset(8)
        }
    }
}
