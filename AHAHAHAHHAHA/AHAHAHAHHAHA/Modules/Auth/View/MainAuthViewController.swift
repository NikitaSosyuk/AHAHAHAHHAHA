//
//  MainAuthViewController.swift
//  AHAHAHAHHAHA
//
//  Created by Nikita Sosyuk on 22.11.2021.
//

import UIKit
import SnapKit

enum AuthButtonType {
    case signIn
    case signUp
}

class MainAuthViewController: UIViewController, FlowContronllerable {

    typealias ReturnedValue = AuthButtonType


    private enum Constants {
        static let stackViewSpacing: CGFloat = 24
        static let buttonCornerRadius: CGFloat = 4
    }

    // MARK: - Internal Properties

    var completionHandler: ((AuthButtonType) -> ())?

    // MARK: - Private Properties

    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("SignIn", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = Constants.buttonCornerRadius
        return button
    }()

    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("SignUp", for: .normal)
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
        self.setupNavigationBar()
        self.addActions()

        self.view.backgroundColor = .white
    }

    // MARK: - Private Methods

    private func addSubviews() {
        self.view.addSubview(stackView)
        self.stackView.addArrangedSubview(signInButton)
        self.stackView.addArrangedSubview(signUpButton)
    }

    private func setLayout() {
        self.stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }

    private func setupNavigationBar() {
        self.title = "Hello, User!"
    }

    private func addActions() {
        self.signInButton.addTarget(self, action: #selector(self.signInButtonAction), for: .touchUpInside)
        self.signUpButton.addTarget(self, action: #selector(self.signUpButtonAction), for: .touchUpInside)
    }

    @objc private func signInButtonAction() {
        self.completionHandler?(.signIn)
    }

    @objc private func signUpButtonAction() {
        self.completionHandler?(.signUp)
    }
}

