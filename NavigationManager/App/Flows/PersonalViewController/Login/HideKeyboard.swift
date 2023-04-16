//
//  HideKeyboard.swift
//  NavigationManager
//
//  Created by Алексей Артамонов on 16.04.2023.
//

import UIKit

extension LoginViewController {
    func hideKeyboard() {
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
