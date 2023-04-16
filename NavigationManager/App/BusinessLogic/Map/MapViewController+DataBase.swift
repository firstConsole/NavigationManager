//
//  MapViewController+SaveData.swift
//  NavigationManager
//
//  Created by Алексей Артамонов on 11.04.2023.
//

import UIKit
import CoreLocation
import CoreData

extension MapViewController {
    func saveRoute(startPoint: CLLocationCoordinate2D, destinationPoint: CLLocationCoordinate2D) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentRouteContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Route", in: context) else {
            return
        }
        
        let route = NSManagedObject(entity: entity, insertInto: context)
        
        route.setValue(startPoint.latitude, forKey: "startPointLatitude")
        route.setValue(startPoint.longitude, forKey: "startPointLongitude")
        route.setValue(destinationPoint.latitude, forKey: "destinationPointLongitude")
        route.setValue(destinationPoint.latitude, forKey: "destinationPointLatitude")
        
        do {
            try context.save()
            routeData.append(route)
        } catch let error as NSError {
            print("Can not write route \(error), \(error.userInfo)")
        }
    }
    
    func loadRoute() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentRouteContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Route")
        
        do {
            self.routeData = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Can not read route \(error), \(error.userInfo)")
        }
    }
}
