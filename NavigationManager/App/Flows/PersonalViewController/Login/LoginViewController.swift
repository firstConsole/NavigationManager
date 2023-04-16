//
//  LoginViewController.swift
//  NavigationManager
//
//  Created by Алексей Артамонов on 11.04.2023.
//

import UIKit
import CoreData

final class LoginViewController: UIViewController, Storyboarded {
    
    // MARK: - IBOutlets
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    
    // MARK: - Properties
    weak var appCoordinator: AppCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboard()
        
    }
    @IBAction func login(_ sender: UIButton) {
        
    }
    
    @IBAction func register(_ sender: UIButton) {
        appCoordinator?.transitRegistration()
    }
}
