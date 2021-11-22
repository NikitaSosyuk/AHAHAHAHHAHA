//
//  HomeCoordinator.swift
//  AHAHAHAHHAHA
//
//  Created by Nikita Sosyuk on 22.11.2021.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinatorable {

    // MARK: - Internal Properties

    var flowCompletionHandler: CoordinatorHandler?
    var navigationController: UINavigationController

    // MARK: - Initializers

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let controller = HomeViewController()
        controller.completionHandler = { [weak self] _ in
            self?.flowCompletionHandler?()
        }

        self.navigationController.setViewControllers([controller], animated: true)
    }
}
