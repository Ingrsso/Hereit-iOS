


import UIComponents
import DesignSystem
import UIKit

class EnterOTPViewController: UIViewController {
    
    private var viewModel: AuthViewModel
    let email: String
    
    //MARK: title area-
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "인증번호를 입력하세요"
        label.font = Typography.headingH4Bold.font
        label.textAlignment = .center
        return label
    }()
    
    private lazy var subLabel: UILabel = {
        let label = UILabel()
        label.text = "\(email) 로\n4자리 인증코드를 보냈어요"
        label.font = Typography.body3SemiBold.font
        label.textColor = .gray90
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    private lazy var titleStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel,subLabel])
        stack.axis = .vertical
        stack.spacing = 12
        stack.alignment = .fill
        return stack
    }()
    
    //MARK: OTP circle area-
    
    private func setUpCircles() {
        for _ in 0..<4 {
            let circle = UIView()
            circle.widthAnchor.constraint(equalToConstant: 56).isActive = true
            circle.heightAnchor.constraint(equalToConstant: 56).isActive = true
            circle.layer.cornerRadius = 24
            circle.backgroundColor = .gray
            otpCircleStack.addArrangedSubview(circle)
        }
    }
    
    private lazy var otpCircleStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 16
        return stack
    }()
    
    private lazy var otpCircleContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(otpCircleStack)
        
        otpCircleStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            otpCircleStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27),
            otpCircleStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -27),
            otpCircleStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            otpCircleStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
        
        return view
    }()
    
    //MARK: button-
    
    private lazy var continueButton: ButtonView = {
        let button = ButtonView()
        button.setTitle("다음", for: .normal)
        button.addTarget(self, action: #selector(didButtonTap), for: .touchUpInside)
        return button
    }()
    
    //MARK: 맨밑 코드 재전송-
    
    private lazy var codeResendRow: UIButton = {
        let button = UIButton()
        let fullText = "계정이 없으신가요? 회원가입"
        let attrText = NSMutableAttributedString(string: fullText)

        attrText.addAttribute(.foregroundColor, value: UIColor.gray70!, range: NSRange(location: 0, length: fullText.count))
        if let range = fullText.range(of: "회원가입") {
            let nsRange = NSRange(range, in: fullText)
            attrText.addAttribute(.foregroundColor, value: UIColor.alert!, range: nsRange)
        }
        attrText.addAttribute(.font, value: Typography.body3SemiBold.font, range: NSRange(location: 0, length: attrText.length))

        button.setAttributedTitle(attrText, for: .normal)
        button.addTarget(self, action: #selector(didButtonTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var codeResendWrapper: UIView = {
        let view = UIStackView()
        view.addSubview(codeResendRow)
        codeResendRow.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            codeResendRow.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            codeResendRow.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            codeResendRow.topAnchor.constraint(equalTo: view.topAnchor, constant: 20)
        ])
        return view
    }()

    
    private lazy var contentStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            titleStack,
            otpCircleContainer,
            continueButton,
            codeResendWrapper
        ])
        stack.axis = .vertical
        return stack
    }()
    
    init(viewModel: AuthViewModel, email: String) {
        self.viewModel = viewModel
        self.email = email
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureViews()
        setUpCircles()
        layout()
    }
    
    private func configureViews() {
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentStack)
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            contentStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            contentStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            contentStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    //MARK: button actoin-
//    @objc private func didTapLogin() {
//        let fullName = fullNameField.getTextField().text ?? ""
//        let email = emailField.getTextField().text ?? ""
//        let password = passwordField.getTextField().text ?? ""
//       
//        viewModel.signup(fullName: fullName, email: email, password: password)
//    }
    

    @objc private func didButtonTap() {
        print("인증번호 입력")
    }
    
    
}

#Preview {
    FontRegistrar.registerFont()
    return 	EnterOTPViewController(viewModel: AuthViewModel(), email: "example@email.com")
    
}
//
//
//
//init(viewModel: AuthViewModel) {
//    self.viewModel = viewModel
//    super.init(nibName: nil, bundle: nil)
//}
//
//required init?(coder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//}
//
//// MARK: - Lifecycle
//
//override func viewDidLoad() {
//    super.viewDidLoad()
//    view.backgroundColor = .white
//    configureViews()
//    activateConstraints()
//}
