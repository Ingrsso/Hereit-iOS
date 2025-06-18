//
//  Builder.swift
//  UIComponents
//
//  Created by dgsw07 on 6/18/25.
//

import Foundation

protocol Builder: AnyObject {
    var title: String { get }
    var message: String { get }
    func present() -> Self
    
    func setTitle(_ text: String) -> Self
    func setMessage(_ text: String) -> Self
    func addConfirmAction(_ text: String, action: (() -> Void)?) -> Self
    
}
