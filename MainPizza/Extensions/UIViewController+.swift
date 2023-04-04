import UIKit

extension UIViewController {
    
    func createCustomNavigationBar() {
        navigationController?.navigationBar.tintColor = .customGray
    }
    func createCustomTitleView(city: String, imageName: String) -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 280, height: 41)
        let image = UIImageView()
        image.image = UIImage(named: imageName)
        image.frame = CGRect(x: 70, y: 15, width: 14, height: 8)
        view.addSubview(image)
        
        let label = UILabel()
        label.text = city
        label.frame = CGRect(x: 5, y: 10, width: 60, height: 14)
        label.font = UIFont(name: "SFUIDisplay-Regular", size: 17)
        label.textColor = .black
        view.addSubview(label)
        return view
    }
}
