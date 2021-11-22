//
//  AuthCoordinator.swift
//  AHAHAHAHHAHA
//
//  Created by Nikita Sosyuk on 22.11.2021.
//

import UIKit

class AuthCoordinator: Coordinatorable {

    // MARK: - Internal Properties

    var flowCompletionHandler: CoordinatorHandler?
    var navigationController: UINavigationController

    // MARK: - Private Properties

    private var user: (login: String?, password: String?) = (nil, nil)

    // MARK: - Initializers

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Internal Methods

    func start() {
        self.showMainScreen()
    }

    // MARK: - Private Methods

    private func showMainScreen() {
        let controller = MainAuthViewController()

        controller.completionHandler = { [weak self] type in
            switch type {
            case .signIn:
                self?.showSignUpScreen()

            case .signUp:
                self?.showEnterLoginScreen()
            }
        }

        self.navigationController.setViewControllers([controller], animated: false)
    }

    private func showEnterLoginScreen() {
        let controller = LoginPasswordViewController()
        controller.type = .login

        controller.completionHandler = { [weak self] value in
            self?.user.login = value
            self?.showEnterPasswordScreen()
        }

        self.navigationController.pushViewController(controller, animated: true)
    }

    private func showEnterPasswordScreen() {
        let controller = LoginPasswordViewController()
        controller.type = .password

        controller.completionHandler = { [weak self] value in
            guard let self = self else { return }

            self.user.password = value
            self.flowCompletionHandler?()
        }

        self.navigationController.pushViewController(controller, animated: true)
    }

    private func showSignUpScreen() {
        let controller = SignUpViewController()

        controller.completionHandler = { [weak self] _ in
            self?.flowCompletionHandler?()
        }

        self.navigationController.pushViewController(controller, animated: true)
    }
}
