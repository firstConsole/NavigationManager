//
//  Coordinator.swift
//  NavigationManager
//
//  Created by Алексей Артамонов on 11.04.2023.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
