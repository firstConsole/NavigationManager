//
//  MapViewController.swift
//  NavigationManager
//
//  Created by Алексей Артамонов on 26.03.2023.
//

import UIKit
import MapKit

final class MapViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: - Properties
    
    let locationManager = CLLocationManager()
    
    
    // MARK: - UI present
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        checkLocationEnabled()
    }
}
