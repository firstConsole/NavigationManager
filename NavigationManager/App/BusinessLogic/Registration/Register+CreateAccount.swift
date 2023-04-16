//
//  Register+CreateAccount.swift
//  NavigationManager
//
//  Created by Алексей Артамонов on 16.04.2023.
//

import UIKit
import CoreData

extension RegisterViewController {
    func createAccount(login: String, password: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentUserContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "User", in: context) else {
            return
        }
        
        let user = NSManagedObject(entity: entity, insertInto: context)
        
        user.setValue(login, forKey: "login")
        user.setValue(password, forKey: "password")
        
        do {
            try context.save()
            accounts.append(user)
        } catch let error as NSError {
            print("Can not write user \(error), \(error.userInfo)")
        }
    }
    
    func loadUser(login: String, password: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentUserContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
        
        do {
            self.accounts = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Can not read user \(error), \(error.userInfo)")
        }
    }
}
