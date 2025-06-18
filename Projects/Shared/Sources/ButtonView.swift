import Foundation
import UIKit

public class ButtonView: UIButton {
    // MARK: - Initializers -

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
        setupLayout()

    }
    
    fileprivate func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .primary
        clipsToBounds = true
        layer.cornerRadius = 12
        titleLabel?.font = Typography.headingH6SemiBold.font

    }

    fileprivate func setupLayout() {
        heightAnchor.constraint(equalToConstant: 56).isActive = true
    }
}

