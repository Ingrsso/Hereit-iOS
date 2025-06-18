import UIKit
import Shared

final class RegisterViewController: UIViewController {

    // MARK: - Properties

    private let viewModel: RegisterViewModel
    

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "계정을 만드세요"
        label.font = Typography.headingH4Bold.font
        label.textAlignment = .center
        return label
    }()

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "회원가입하여 다양한 서비스를 이용하세요!"
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
    
    private lazy var fullNameField: InputFieldView = {
        let field = InputFieldView()
        field.labelText = "이름"
        field.placeholder = "이름을 입력해주세요!"
        return field
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

    private lazy var signupButton: ButtonView = {
        let button = ButtonView()
        button.setTitle("회원가입", for: .normal)
        button.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        return button
    }()


    private lazy var registerAccountButton: UIButton = {
        let button = UIButton()
        

       
        button.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        return button
    }()

    private lazy var loginInputFieldContentStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            fullNameField,
            emailField,
            passwordField,
        ])
        stack.axis = .vertical
        stack.spacing = 16
        stack.alignment = .fill
        return stack
    }()
    
    private lazy var loginButtonContentStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            signupButton,
            registerAccountButton
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

    init(viewModel: RegisterViewModel) {
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
        let fullName = fullNameField.getTextField().text ?? ""
        let email = emailField.getTextField().text ?? ""
        let password = passwordField.getTextField().text ?? ""
       
        viewModel.register(fullName: fullName, email: email, password: password)
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
    return RegisterViewController(viewModel: RegisterViewModel())
}
