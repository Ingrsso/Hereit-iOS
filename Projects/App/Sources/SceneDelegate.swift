import UIKit
import Shared
import Presentation

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // MARK: - Tuist 디자인 시스템 폰트 등록 - 
        FontRegistrar.registerFont()

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene

        
        window?.rootViewController = LoginScene.create()
        window?.makeKeyAndVisible()
    }
}
