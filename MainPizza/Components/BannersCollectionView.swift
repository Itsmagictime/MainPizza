import UIKit

class BannersCollectionView: UICollectionView {
    
    var banners = ["Баннер", "Баннер", "Баннер"]
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = .customGray
        delegate = self
        dataSource = self
        register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.reuseID)
        contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BannersCollectionView : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        banners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: BannerCell.reuseID, for: indexPath) as! BannerCell
        cell.image.image = UIImage(named: banners[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screen.width / 1.25, height: screen.height / 7.25)
    }
}
