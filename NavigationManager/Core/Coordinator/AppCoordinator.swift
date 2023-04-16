//
//  AppCoordinator.swift
//  NavigationManager
//
//  Created by Алексей Артамонов on 11.04.2023.
//

import UIKit

final class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var viewControllers: [UIViewController] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        createTabBar()
        transitMap()
    }
    
    func createTabBar() {
        guard let tabBar = navigationController.tabBarController else {
            return
        }
        
        let mapViewController = UINavigationController(rootViewController: MapViewController())
        let profileViewController = UINavigationController(rootViewController: ProfileViewController())
        
        viewControllers.append(mapViewController)
        viewControllers.append(profileViewController)
        
        mapViewController.title = "Карта"
        profileViewController.title = "Профиль"
        
        tabBar.setViewControllers(viewControllers, animated: false)
        tabBar.modalPresentationStyle = .fullScreen
    }
    
    func transitLogin() {
        
    }
    
    func transitPrrofile() {
        
    }
    
    func transitRegistration() {
        let vc = RegisterViewController.instantiate()
        vc.appCoordinator = self
        vc.title = "Регистрация"
        navigationController.pushViewController(vc, animated: true)
    }
    
    func transitMap() {
        let vc = LoginViewController.instantiate()
        vc.appCoordinator = self
        vc.title = "Профиль"
        navigationController.pushViewController(vc, animated: false)
    }
    
    func checkLogin(login: String, password: String) -> Bool {
        
        return true
    }
}
