//
//  MapView+ManagerDelegate.swift
//  NavigationManager
//
//  Created by Алексей Артамонов on 26.03.2023.
//

import Foundation
import MapKit

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last?.coordinate else {
            return
        }
        
        let region = MKCoordinateRegion(center: location,
                                        latitudinalMeters: 1000,
                                        longitudinalMeters: 1000)
        
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkAuthorizationStatus()
    }
    
    
}


