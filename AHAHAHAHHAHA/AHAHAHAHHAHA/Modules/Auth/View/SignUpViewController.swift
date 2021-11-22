//
//  SignUpViewController.swift
//  AHAHAHAHHAHA
//
//  Created by Nikita Sosyuk on 22.11.2021.
//

import UIKit

class SignUpViewController: UIViewController, FlowContronllerable {

    typealias ReturnedValue = Void

    private enum Constants {
        static let stackViewSpacing: CGFloat = 24
        static let buttonCornerRadius: CGFloat = 4
    }

    // MARK: - Internal Properties

    var completionHandler: ((Void) -> ())?

    // MARK: - Private Properties

    private let loginTextField = UITextField()
    private let passwordTextField = UITextField()

    private let submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("next", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = Constants.buttonCornerRadius
        return button
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Constants.stackViewSpacing
        return stackView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addSubviews()
        self.setLayout()
        self.addActions()

        self.view.backgroundColor = .white
        self.loginTextField.placeholder = "Enter login"
        self.passwordTextField.placeholder = "Enter password"
    }

    // MARK: - Private Methods

    private func addSubviews() {
        self.view.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.loginTextField)
        self.stackView.addArrangedSubview(self.passwordTextField)
        self.stackView.addArrangedSubview(self.submitButton)
    }

    private func setLayout() {
        self.stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }

    private func addActions() {
        self.submitButton.addTarget(self, action: #selector(self.submitButtonAction), for: .touchUpInside)
    }

    @objc private func submitButtonAction() {
        guard
            let login = loginTextField.text, !login.isEmpty,
            let password = passwordTextField.text, !password.isEmpty
        else { return }

        self.completionHandler?(())
    }
}

