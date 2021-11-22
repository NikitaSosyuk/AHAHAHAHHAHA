//
//  HomeViewController.swift
//  AHAHAHAHHAHA
//
//  Created by Nikita Sosyuk on 22.11.2021.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController, FlowContronllerable {

    typealias ReturnedValue = Void

    private enum Constants {
        static let buttonCornerRadius: CGFloat = 4
        static let buttonTopSpacing: CGFloat = 24
    }

    // MARK: - Internal Properties

    var completionHandler: ((Void) -> ())?

    // MARK: - Private Properties

    private let textLabel = UILabel()
    private let exitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Exit", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = Constants.buttonCornerRadius
        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupNavigationBar()
        self.addSubviews()
        self.updateData()
        self.setLayout()

        self.view.backgroundColor = .white
        self.exitButton.addTarget(self, action: #selector(self.exitButtonAction), for: .touchUpInside)
    }

    // MARK: - Private Methods

    private func addSubviews() {
        self.view.addSubview(self.textLabel)
        self.view.addSubview(self.exitButton)
    }

    private func setLayout() {
        self.textLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        self.exitButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.textLabel.snp.bottom).offset(Constants.buttonTopSpacing)
        }
    }

    private func setupNavigationBar() {
        self.title = "Activity"
        self.navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Reset", style: .done, target: self, action: #selector(self.updateData))
    }

    @objc private func updateData() {
        self.textLabel.text = "\(Int.random(in: 1...10000))"
    }

    @objc private func exitButtonAction() {
        self.completionHandler?(())
    }
}
