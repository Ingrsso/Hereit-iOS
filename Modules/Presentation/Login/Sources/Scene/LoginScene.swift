import UIKit

public enum LoginScene {
    public static func create() -> UIViewController {
        let viewModel = AuthViewModel()
        let viewController = LoginViewController(viewModel: viewModel)
        return viewController
    }
}
