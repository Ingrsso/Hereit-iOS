import UIKit
import Shared

final class LoginViewController: UIViewController {

    // MARK: - Properties

    private let viewModel: LoginViewModel
    

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "여기야에 오신 것을 환영합니다"
        label.font = Typography.headingH4Bold.font
        label.textAlignment = .center
        return label
    }()

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "로그인하여 다양한 서비스를 이용하세요!"
        label.font = Typography.body3SemiBold.font
        label.textColor = .gray90
        label.textAlignment = .center
        return label
    }()
    
    private lazy var titleAndContentStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            titleLabel,
            subtitleLabel,
        ])
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .fill
        return stack
    }()

    private lazy var emailField: InputFieldView = {
        let field = InputFieldView()
        field.labelText = "이메일"
        field.placeholder = "이메일을 입력해주세요!"
        return field
    }()

    private lazy var passwordField: InputFieldView = {
        let field = InputFieldView()
        field.labelText = "비밀번호"
        field.placeholder = "비밀번호를 입력해주세요!"
        field.getTextField().isSecureTextEntry = true
        return field
    }()

    private lazy var loginButton: ButtonView = {
        let button = ButtonView()
        button.setTitle("로그인", for: .normal)
        button.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        return button
    }()

    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("비밀번호를 잊으셨나요?", for: .normal)
        button.setTitleColor(.alert, for: .normal)
        button.titleLabel?.font = Typography.body3Regular.font
        button.contentHorizontalAlignment = .right
        button.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
        return button
    }()

    private lazy var registerAccountButton: UIButton = {
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
        button.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        return button
    }()

    private lazy var dividerWithTextView: UIView = {
        // MARK: - 라인 생성 -
        let makeLineView: () -> UIView = {
            let view = UIView()
            view.backgroundColor = .line
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }

        let leftLine = makeLineView()
        let rightLine = makeLineView()

        // MARK: - 텍스트 생성 -
        let label: UILabel = {
            let label = UILabel()
            label.text = "또는"
            label.font = Typography.body3Regular.font
            label.textColor = .gray60
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

        // MARK: - 컨테이너 선언 -
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        
        [leftLine, label, rightLine].forEach { container.addSubview($0) }

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: container.centerYAnchor),

            leftLine.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: -8),
            leftLine.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            leftLine.widthAnchor.constraint(equalToConstant: 65),
            leftLine.heightAnchor.constraint(equalToConstant: 1),

            rightLine.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 8),
            rightLine.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            rightLine.widthAnchor.constraint(equalToConstant: 65),
            rightLine.heightAnchor.constraint(equalToConstant: 1)
        ])

        return container
    }()

    private lazy var loginInputFieldContentStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            emailField,
            passwordField,
            forgotPasswordButton,
        ])
        stack.axis = .vertical
        stack.spacing = 16
        stack.alignment = .fill
        return stack
    }()
    
    private lazy var loginButtonContentStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            loginButton,
            registerAccountButton,
            dividerWithTextView
        ])
        stack.axis = .vertical
        stack.spacing = 16
        stack.alignment = .fill
        return stack
    }()

    private lazy var contentStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            titleAndContentStack,
            loginInputFieldContentStack,
            loginButtonContentStack
        ])
        stack.axis = .vertical
        stack.spacing = 28
        stack.alignment = .fill
        return stack
    }()

    
    // MARK: - Init

    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureViews()
        activateConstraints()
    }

    // MARK: - Configure

    private func configureViews() {
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentStack)
    }

    private func activateConstraints() {
        NSLayoutConstraint.activate([
            contentStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            contentStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            contentStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    // MARK: - Actions

    @objc private func didTapLogin() {
        let email = emailField.getTextField().text ?? ""
        let password = passwordField.getTextField().text ?? ""
        print("로그인 버튼 클릭됨. 이메일: \(email), 비밀번호: \(password)")
        viewModel.login(email: email, password: password)
    }

    @objc private func didTapForgotPassword() {
        print("비밀번호 찾기 버튼 클릭됨")
    }

    @objc private func didTapRegister() {
            print("회원가입 버튼 클릭됨")
    }
}

#Preview {
    Pretendard.registerFont()
    return LoginViewController(viewModel: LoginViewModel())
}
