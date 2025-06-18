import Foundation
import UIKit

public class ButtonView: UIButton {

    // MARK: - Initializers -

    public init(_ buttonColor: UIColor) {
        super.init(frame: .zero)
        self.buttonColor = buttonColor
        setupLayout()
        configure()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
        configure()
    }

    // MARK: - Properties

    private var buttonColor: UIColor = .primary!

    // MARK: - Configuration

    fileprivate func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = buttonColor
        clipsToBounds = true
        layer.cornerRadius = 12
        titleLabel?.font = Typography.body2SemiBold.font
    }

    fileprivate func setupLayout() {
        heightAnchor.constraint(equalToConstant: 56).isActive = true
    }

    // MARK: - Animation

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.25) {
            self.transform = CGAffineTransform(scaleX: 0.97, y: 0.97)
            self.backgroundColor = self.buttonColor.darker(by:10)
            self.titleLabel?.alpha = 0.7
        }
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.25) {
            self.transform = .identity
            self.backgroundColor = self.buttonColor
            self.titleLabel?.alpha = 1
        }
    }
}
