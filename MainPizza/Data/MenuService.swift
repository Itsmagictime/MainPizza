import Foundation

class MenuService {
    
    static let shared = MenuService()
    
    func getData() -> [Model]{
        let url = Bundle.main.url(forResource: "ItemsData", withExtension: "json")!
        let menuData = try! Data(contentsOf: url)
        guard let menuItems = try? JSONDecoder().decode([Model].self, from: menuData) else {
            fatalError("Can't convert")
        }
        return menuItems
    }
}
