import UIKit

class MenuViewController: UIViewController, MenuViewDelegate {
   
    override func loadView() {
        super.loadView()
        let menuView = MenuView()
        self.view = menuView
        menuView.delegate = self
        setupViews()
    }
    
    private func setupViews() {
        createCustomNavigationBar()
        let customTitleView = createCustomTitleView(city: "Москва", imageName: "Icon")
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: customTitleView)
    }
    func selectedCollectionItem(_ indexPath: Int, tableView: UITableView) {
        switch indexPath {
        case 0 : tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        case 1 : tableView.scrollToRow(at: IndexPath(row: 3, section: 0), at: .top, animated: true)
        case 2 : tableView.scrollToRow(at: IndexPath(row: 5, section: 0), at: .top, animated: true)
        case 3 : tableView.scrollToRow(at: IndexPath(row: 7, section: 0), at: .top, animated: true)
        default : break
        }
    }
}

