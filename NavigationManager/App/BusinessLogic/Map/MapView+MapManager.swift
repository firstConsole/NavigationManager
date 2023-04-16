//
//  MapView+MapManager.swift
//  NavigationManager
//
//  Created by Алексей Артамонов on 26.03.2023.
//

import Foundation
import MapKit

extension MapViewController {
    
    // MARK: - Configure map
    
    func configureManager() {
        locationManager.delegate = self
        mapView.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        runBackgroundTask()
    }
    
    // MARK: - Checking for location service enable
    
    func checkLocationEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            checkAuthorizationStatus()
            configureManager()
        } else {
            let settingsAction = UIAlertAction(title: "Настройки", style: .default) { action in
                guard let path = URL(string: "App-Prefs:root=LOCATION_SERVICES") else {
                    return
                }
                
                UIApplication.shared.open(path)
            }
            
            let cancelAction = UIAlertAction(title: "Отмена", style: .destructive)
            
            var actions: [UIAlertAction] = []
            
            actions.append(settingsAction)
            actions.append(cancelAction)
            
            showDetailAlert(alertTitle: "Службы геолокации",
                            alertMessage: "Хотите включить службу?",
                            preferredStyle: .alert,
                            actions: actions)
        }
    }
    
    func checkAuthorizationStatus() {
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .denied:
            let settingsAction = UIAlertAction(title: "Настройки", style: .default) { action in
                guard let path = URL(string: UIApplication.openSettingsURLString) else {
                    return
                }
                
                UIApplication.shared.open(path)
            }
            
            let cancelAction = UIAlertAction(title: "Отмена", style: .destructive)
            
            var actions: [UIAlertAction] = []
            
            actions.append(settingsAction)
            actions.append(cancelAction)
            
            showDetailAlert(alertTitle: "Вы запретили использование службы геолокации",
                            alertMessage: "Хотите включить службу?",
                            preferredStyle: .alert,
                            actions: actions)
            break
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            locationManager.startUpdatingLocation()
        @unknown default:
            fatalError()
        }
    }
    
    func showDetailAlert(alertTitle: String,
                         alertMessage: String,
                         preferredStyle: UIAlertController.Style, actions: [UIAlertAction]) {
        
        let alert = UIAlertController(title: title,
                                      message: alertMessage,
                                      preferredStyle: preferredStyle)
        
        actions.forEach { alert.addAction($0) }
        
        present(alert, animated: true)
    }
}
