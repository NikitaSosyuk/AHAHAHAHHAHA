//
//  FlowContronllerable.swift
//  AHAHAHAHHAHA
//
//  Created by Nikita Sosyuk on 22.11.2021.
//

import Foundation

// тут тоже 🥺
protocol FlowContronllerable: AnyObject {
    associatedtype ReturnedValue
    
    var completionHandler: ((ReturnedValue) -> ())? { get set }
}
