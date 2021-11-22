//
//  AppCoordinator.swift
//  AHAHAHAHHAHA
//
//  Created by Nikita Sosyuk on 22.11.2021.
//

import UIKit

class AppCoordinator: Coordinatorable {

    // MARK: - Internal Properties

    var flowCompletionHandler: CoordinatorHandler?
    var navigationController: UINavigationController

    // MARK: - Private Properties

    private var childCoordinators: [Coordinatorable] = []

    // MARK: - Initializers

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Static
    
    private static let registrationKey = ";)"

    func start() {
        UserDefaults.standard.bool(forKey: AppCoordinator.registrationKey)
            ? self.openHomeFlow()
            : self.openAuthFlow()
    }

    private func openHomeFlow() {
        let homeCoordinator = HomeCoordinator(navigationController: self.navigationController)
        self.childCoordinators.append(homeCoordinator)

        homeCoordinator.flowCompletionHandler = { [weak self] in
            UserDefaults.standard.set(false, forKey: AppCoordinator.registrationKey)
            self?.openAuthFlow()
        }

        homeCoordinator.start()
    }

    private func openAuthFlow() {
        let authCoordinator = AuthCoordinator(navigationController: self.navigationController)
        self.childCoordinators.append(authCoordinator)

        authCoordinator.flowCompletionHandler = { [weak self] in
            UserDefaults.standard.set(true, forKey: AppCoordinator.registrationKey)
            self?.openHomeFlow()
        }

        authCoordinator.start()
    }
}
