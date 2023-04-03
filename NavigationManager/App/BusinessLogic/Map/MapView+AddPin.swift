//
//  MapView+AddPin.swift
//  NavigationManager
//
//  Created by Алексей Артамонов on 02.04.2023.
//

import MapKit

extension MapViewController {
    func setPin() {
        let pin = MKPointAnnotation()
        pin.title = "Some title"
        pin.subtitle = "Go here"
        mapView.addAnnotation(pin)
    }
}
