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

    private var childCoordinator: Coordinatorable?

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
        childCoordinator = HomeCoordinator(navigationController: self.navigationController)

        childCoordinator?.flowCompletionHandler = { [weak self] in
            UserDefaults.standard.set(false, forKey: AppCoordinator.registrationKey)
            self?.openAuthFlow()
        }

        childCoordinator?.start()
    }

    private func openAuthFlow() {
        childCoordinator = AuthCoordinator(navigationController: self.navigationController)

        childCoordinator?.flowCompletionHandler = { [weak self] in
            UserDefaults.standard.set(true, forKey: AppCoordinator.registrationKey)
            self?.openHomeFlow()
        }

        childCoordinator?.start()
    }
}
