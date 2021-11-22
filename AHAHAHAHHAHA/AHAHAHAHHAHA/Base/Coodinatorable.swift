//
//  Coodinatorable.swift
//  AHAHAHAHHAHA
//
//  Created by Nikita Sosyuk on 22.11.2021.
//

import Foundation

typealias CoordinatorHandler = () -> ()

// Пожалуйста, не считайте за ошибку. 🥺 Приложение про шутки, а это смешно звучит
protocol Coordinatorable: AnyObject {
    var flowCompletionHandler: CoordinatorHandler? { get set }

    func start()
}
