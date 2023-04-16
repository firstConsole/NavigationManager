//
//  Storyboarded.swift
//  NavigationManager
//
//  Created by Алексей Артамонов on 15.04.2023.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        
        guard let storyboard = storyboard.instantiateViewController(withIdentifier: id) as? Self else {
            fatalError()
        }
        return storyboard
    }
}
