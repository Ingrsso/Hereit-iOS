import UIKit
import SnapKit
import DesignSystem

public class InputTextField: UITextField {

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }

    convenience init(isSecureEntry: Bool = false,
                     keyboardType: UIKeyboardType = .default,
                     returnKeyType: UIReturnKeyType = .done) {
        self.init(frame: .zero)
        self.isSecureTextEntry = isSecureEntry
        self.keyboardType = keyboardType
        self.returnKeyType = returnKeyType
        self.autocapitalizationType = .none
    }

    // MARK: - Configuration

    private func configure() {
        self.backgroundColor = .additionalBackground
        
        self.attributedPlaceholder = NSAttributedString(string: "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray60!])

        
        self.font = Typography.body3SemiBold.font
        
    
        self.autocorrectionType = .no
        self.clearButtonMode = .whileEditing

        self.keyboardType = .default
        self.returnKeyType = .done
        
        self.autocapitalizationType = .none
    }
    
    // MARK: - Add Padding
    
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
    }

    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
    }

    public override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
    }


    // MARK: - Bind

    func bind() {
        // 필요한 바인딩 코드 작성
    }
}

public class InputFieldView: UIView {
    private let label = UILabel()
    private let textField = InputTextField()

    public var placeholder: String? {
        didSet {
            textField.placeholder = placeholder
        }
    }

    public var labelText: String? {
        didSet {
            label.text = labelText
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        addSubview(label)
        addSubview(textField)

        label.numberOfLines = 0
        label.textColor = .gray100
        label.font = Typography.body3SemiBold.font

        
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 13

        label.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }

        textField.snp.makeConstraints { maker in
            maker.top.equalTo(label.snp.bottom).offset(8)
            maker.height.equalTo(52)
            maker.leading.trailing.bottom.equalToSuperview()
        }
    }

    public func getTextField() -> InputTextField {
        return textField
    }
}

