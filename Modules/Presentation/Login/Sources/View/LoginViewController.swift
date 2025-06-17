import UIKit
import UIComponents
import SnapKit
import DesignSystem

final class LoginViewController: UIViewController {
    private let viewModel: LoginViewModel

    private let stackView = UIStackView()
    private let emailTextField = InputFieldView()
    private let passwordTextField = InputFieldView()
    private let loginButton = ButtonView()

    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        bind()
    }

    private func setupUI() {
        view.backgroundColor = .white

        let titleLabel = UILabel()
        titleLabel.text = "여기야에 오신 것을 환영합니다"
        titleLabel.font = Typography.headingH4Bold.font
        titleLabel.textAlignment = .center

        let contentLabel = UILabel()
        contentLabel.text = "로그인하여 다양한 서비스를 이용하세요!"
        contentLabel.font = Typography.body3SemiBold.font
        contentLabel.textColor = .gray90
        contentLabel.textAlignment = .center

        let titleStack = UIStackView(arrangedSubviews: [titleLabel, contentLabel])
        titleStack.axis = .vertical
        titleStack.spacing = 8

        emailTextField.labelText = "이메일"
        emailTextField.placeholder = "이메일을 입력해주세요!"

        passwordTextField.labelText = "비밀번호"
        passwordTextField.placeholder = "비밀번호를 입력해주세요!"
        passwordTextField.getTextField().isSecureTextEntry = true

        loginButton.setTitle("로그인", for: .normal)
        

        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .fill
        stackView.distribution = .fill

        [titleStack, emailTextField, passwordTextField, loginButton].forEach {
            stackView.addArrangedSubview($0)
        }

        view.addSubview(stackView)
    }

    private func setupConstraints() {
        stackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.centerY.equalToSuperview()
        }
    }

    private func bind() {
        loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
    }

    @objc private func didTapLogin() {
        viewModel.login(
            email: emailTextField.getTextField().text ?? "",
            password: passwordTextField.getTextField().text ?? ""
        )
    }
}

// MARK: - Preview -
#Preview {
    FontRegistrar.registerFont()
    return LoginViewController(viewModel: LoginViewModel());
}
