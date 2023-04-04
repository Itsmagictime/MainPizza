import Foundation
import UIKit
import SnapKit

protocol MenuViewDelegate: AnyObject {
    func selectedCollectionItem(_ indexPath: Int, tableView : UITableView)
}

class MenuView : UIView {
    // MARK: - Properties
    private let minConstraintConstant: CGFloat = 0
    private let maxConstraintConstant: CGFloat = 120
    private var previousContentOffsetY: CGFloat = 0
    private var animatedConstraint: NSLayoutConstraint?
    let screen = UIScreen.main.bounds
    var items = [Model]()
    var tableView = UITableView()
    var bannersCollection = BannersCollectionView()
    var categoriesCollection = CategoriesCollectionView()
    weak var delegate: MenuViewDelegate?

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Module function
    
    private func setupViews() {
        items = MenuService.shared.getData()
        backgroundColor = .customGray
        addSubview(bannersCollection)
        setupTableView()
        addSubview(categoriesCollection)
        categoriesCollection.categoriesDelegate = self
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .customGray
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MenuCell.self, forCellReuseIdentifier: MenuCell.reuseID)
        addSubview(tableView)
    }
    
  

    //MARK: - Setup constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            bannersCollection.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            bannersCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bannersCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bannersCollection.heightAnchor.constraint(equalToConstant: 120)
        ])
        animatedConstraint = tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: maxConstraintConstant)

        NSLayoutConstraint.activate([
            animatedConstraint!,
            tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

}

extension MenuView : UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.reuseID) as? MenuCell else {
            fatalError("Can't dequeue cell")
        }
        cell.button.setTitle(items[indexPath.row].price, for: .normal)
        cell.detail.text = items[indexPath.row].detail
        cell.name.text = items[indexPath.row].name
        cell.image.downloadedFrom(link: items[indexPath.row].image)
        cell.button.layer.cornerRadius = 15
        cell.button.layer.borderWidth = 1
        cell.button.layer.borderColor = CGColor(red: 253, green: 58, blue: 105, alpha: 1)
        cell.button.titleLabel?.textColor = .customRed
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        screen.height / 4.5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        categoriesCollection
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        60
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentContentOffsetY = scrollView.contentOffset.y
        let scrollDiff = currentContentOffsetY - previousContentOffsetY

        // Верхняя граница начала bounce эффекта
        let bounceBorderContentOffsetY = -scrollView.contentInset.top

        let contentMovesUp = scrollDiff > 0 && currentContentOffsetY > bounceBorderContentOffsetY
        let contentMovesDown = scrollDiff < 0 && currentContentOffsetY < bounceBorderContentOffsetY

        let currentConstraintConstant = animatedConstraint!.constant
        var newConstraintConstant = currentConstraintConstant

        if contentMovesUp {
            // Уменьшаем константу констрэйнта
            newConstraintConstant = max(currentConstraintConstant - scrollDiff, minConstraintConstant)
        } else if contentMovesDown {
            // Увеличиваем константу констрэйнта
            newConstraintConstant = min(currentConstraintConstant - scrollDiff, maxConstraintConstant)
        }

        // Меняем высоту и запрещаем скролл, только в случае изменения константы
        if newConstraintConstant != currentConstraintConstant {
            animatedConstraint?.constant = newConstraintConstant
            scrollView.contentOffset.y = previousContentOffsetY
        }

        // Процент завершения анимации
        let animationCompletionPercent = (maxConstraintConstant - currentConstraintConstant) / (maxConstraintConstant - minConstraintConstant)
        //progressView.progress = Float(animationCompletionPercent)

        previousContentOffsetY = scrollView.contentOffset.y
    }
    
}

extension MenuView : CategoriesDelegate {
    func selectedCollectionItem(_ indexPath: Int) {
        delegate?.selectedCollectionItem(indexPath, tableView: tableView)
    }
}

