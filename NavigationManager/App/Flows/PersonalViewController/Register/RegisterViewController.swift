//
//  RegisterViewController.swift
//  NavigationManager
//
//  Created by Алексей Артамонов on 16.04.2023.
//

import UIKit
import CoreData

final class RegisterViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    // MARK: - Properties
    weak var appCoordinator: AppCoordinator?
    var accounts: [NSManagedObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func registerTapped(_ sender: UIButton) {
        
        guard let login = loginTextField.text,
              let password = passwordTextField.text else {
            return
        }
        
        createAccount(login: login, password: password)
    }
    
}
