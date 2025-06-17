import UIKit

public enum LoginScene {
    public static func create() -> UIViewController {
        let viewModel = LoginViewModel()
        let viewController = LoginViewController(viewModel: viewModel)
        return viewController
    }
}
