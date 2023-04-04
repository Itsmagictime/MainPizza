import UIKit

protocol CategoriesDelegate: AnyObject {
    func selectedCollectionItem(_ indexPath: Int)
}

class CategoriesCollectionView: UICollectionView {
    
    var categories = ["Пицца", "Комбо", "Десерты", "Напитки"]
    weak var categoriesDelegate: CategoriesDelegate?
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .customGray
        delegate = self
        dataSource = self
        register(CategoriesCell.self, forCellWithReuseIdentifier: CategoriesCell.reuseID)
        contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CategoriesCollectionView : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: CategoriesCell.reuseID, for: indexPath) as! CategoriesCell
        cell.categoriesLabel.text = categories[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screen.width / 4.26, height: screen.height / 25.375)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        categoriesDelegate?.selectedCollectionItem(indexPath.row)
        let selectedCell = cellForItem(at: indexPath) as! CategoriesCell
        selectedCell.categoriesLabel.textColor = .customRed
        selectedCell.backgroundColor = .customRed.withAlphaComponent(0.2)
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let selectedCell = cellForItem(at: indexPath) as! CategoriesCell
        selectedCell.categoriesLabel.textColor = .customRed.withAlphaComponent(0.4)
        selectedCell.backgroundColor = .customGray
    }
    
}
