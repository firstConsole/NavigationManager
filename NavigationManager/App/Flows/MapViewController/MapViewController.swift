//
//  MapViewController.swift
//  NavigationManager
//
//  Created by Алексей Артамонов on 26.03.2023.
//

import UIKit
import MapKit
import CoreLocation

final class MapViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var finishButton: UIButton!
    
    // MARK: - Properties
    
    let locationManager = CLLocationManager()
    var pinCoordinates: CLLocationCoordinate2D?
    var route: MKRoute?
    var routes: [MKRoute] = []
    
    // MARK: - UI present
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton.isEnabled = false
        finishButton.isEnabled = false
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        checkLocationEnabled()
    }
    
    // MARK: - Add pin and clear map functions
    
    @IBAction func addPin(_ sender: UILongPressGestureRecognizer) {
        let location = sender.location(in: self.mapView)
        let coordinate = self.mapView.convert(location, toCoordinateFrom: self.mapView)
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = coordinate
        annotation.title = "Вот это место"
        self.pinCoordinates = coordinate
        
        self.mapView.removeAnnotations(mapView.annotations)
        self.mapView.addAnnotation(annotation)
        
        self.addButton.isEnabled = true
    }
    
    @IBAction func clearMap(_ sender: UITapGestureRecognizer) {
        self.mapView.removeAnnotations(mapView.annotations)
        self.addButton.isEnabled = false
    }
    
    @IBAction func makeRoute(_ sender: UIButton) {
        guard let currentPlace = locationManager.location?.coordinate,
              let destination = pinCoordinates else {
            return
        }
        
        showRouteOnMap(pickupCoordinate: currentPlace, destinationCoordinate: destination)
        
        finishButton.isEnabled = true
    }
    
    @IBAction func finishRoute(_ sender: UIButton) {
        guard let route = self.route else {
            return
        }
        
        finishRoute(route: route)
        
        print(self.routes.count)
    }
}
