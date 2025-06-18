//
//  AlertConcreteBuilder.swift
//  UIComponents
//
//  Created by dgsw07 on 6/18/25.
//

import Foundation
import UIKit

class AlertConcreteBuilder: Builder {
    
    var title: String = ""
    var message: String = ""
    private var addConfirmAction: Action?
    
    private let alertViewController = CustomAlertController()
    private var rootViewController: UIViewController?

        init(_ viewController: UIViewController) {
        rootViewController = viewController
    }
    
    func setTitle(_ text: String) -> Self {
        title = text
        return self
    }
    
    func setMessage(_ text: String) -> Self {
        message = text
        return self
    }
    
    func addConfirmAction(_ text: String, action: (() -> Void)?) -> Self {
        addConfirmAction = Action(text: text, action: action)
        return self
    }
    
        @discardableResult
    func present() -> Self {
        alertViewController.alertTitle = title
        alertViewController.alertMessage = message
        alertViewController.confirmAction = addConfirmAction
        alertViewController.modalPresentationStyle = .overFullScreen
        alertViewController.modalTransitionStyle = .crossDissolve
        rootViewController?.present(alertViewController, animated: true)
        
        return self
    }
    
}
