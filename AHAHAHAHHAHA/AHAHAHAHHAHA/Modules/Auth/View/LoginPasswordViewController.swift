//
//  LoginPasswordViewController.swift
//  AHAHAHAHHAHA
//
//  Created by Nikita Sosyuk on 22.11.2021.
//

import UIKit
import SnapKit

class LoginPasswordViewController: UIViewController, FlowContronllerable {

    typealias ReturnedValue = String

    enum DataType {
        case login
        case password
    }

    private enum Constants {
        static let stackViewSpacing: CGFloat = 24
        static let buttonCornerRadius: CGFloat = 4
    }

    // MARK: - Internal Properties

    var type: DataType?
    var completionHandler: ((String) -> ())?

    // MARK: - Private Properties

    private let textField = UITextField()
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
        self.textField.placeholder = "Enter \(self.type == .login ? "Login" : "Password")"
    }

    // MARK: - Private Methods

    private func addSubviews() {
        self.view.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.textField)
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
        guard let text = textField.text, !text.isEmpty else { return }

        self.completionHandler?(text)
    }
}

