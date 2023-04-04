import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        tabBar.tintColor = .customRed
    }
    
    private func generateTabBar() {
        viewControllers = [
        generateVC(viewController: MenuViewController(), title: "Меню", image: UIImage(named: "Menu")),
        generateVC(viewController: MenuViewController(), title: "Контакты", image: UIImage(named: "Contacts")),
        generateVC(viewController: MenuViewController(), title: "Профиль", image: UIImage(named: "Profile")),
        generateVC(viewController: MenuViewController(), title: "Корзина", image: UIImage(named: "Basket"))
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UINavigationController {
        viewController.tabBarItem.image = image
        viewController.tabBarItem.title = title
        let navVC = UINavigationController(rootViewController: viewController)
        return navVC
    }
}
