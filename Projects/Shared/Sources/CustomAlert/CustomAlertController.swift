//
//  CustomAlertController.swift
//  UIComponents
//
//  Created by dgsw07 on 6/18/25.
//

import UIKit

class CustomAlertController: UIViewController {
    var alertTitle: String?
    var alertMessage: String?
    var confirmAction: Action?
    
    private lazy var alertView = {
        let view = UIStackView()
        view.layer.cornerRadius = 16
        view.backgroundColor = .white
        view.axis = .vertical
        view.alignment = .center
        
        return view
    }()
    
    private lazy var titleLabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        view.textAlignment = .center
        view.text = alertTitle //Title
        
        return view
    }()

    private lazy var messageLabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 12)
        view.textAlignment = .center
        view.text = alertMessage //Message
        
        return view
    }()

    private lazy var confirmButton = {
        let view = UIButton()
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 16
        view.setTitle(confirmAction?.text, for: .normal) //Button Title
        
        return view
    }()
    
    override func viewDidLoad() {
        addTarget()
        layouts()
    }
    
}

extension CustomAlertController {
    
    func layouts() {
        view.addSubview(alertView)
        alertView.snp.makeConstraints {
            $0.width.equalTo(312)
            $0.center.equalToSuperview()
        }
        
        alertView.addArrangedSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.width.equalTo(276)
            $0.centerX.equalToSuperview()
        }
        
        alertView.addArrangedSubview(messageLabel)
        alertView.setCustomSpacing(12, after: titleLabel)
        messageLabel.snp.makeConstraints {
            $0.width.equalTo(276)
            $0.centerX.equalToSuperview()
        }
        
        alertView.addArrangedSubview(confirmButton)
        alertView.setCustomSpacing(24, after: messageLabel)
        confirmButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(276)
            $0.height.equalTo(44)
        }
        
    }
}

extension CustomAlertController {
    
    func addTarget() {
        confirmButton.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
    }
    @objc
    func confirmButtonTapped() {
        confirmAction?.action?() //Button Action
        dismiss(animated: true)
    }
}

