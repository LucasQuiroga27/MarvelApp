//
//  Coordinator.swift
//  MarvelAppMVC
//
//  Created by Lucas Quiroga on 9/06/24.
//

import Foundation

import Foundation
import UIKit

protocol Coordinator {
    var viewController: UIViewController? { get }
    var navigationController: UINavigationController? { get }
    
    func start()
}

extension Coordinator {
    var viewController: UIViewController? { nil }
    var navigationController: UINavigationController? { nil }
}
