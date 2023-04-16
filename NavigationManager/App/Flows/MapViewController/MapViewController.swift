//
//  MapViewController.swift
//  NavigationManager
//
//  Created by Алексей Артамонов on 26.03.2023.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

final class MapViewController: UIViewController, Storyboarded {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var returnRouteButton: UIButton!
    @IBOutlet weak var makeRouteButton: UIButton!
    
    // MARK: - Properties
    
    weak var appCoordinator: AppCoordinator?
    let locationManager = CLLocationManager()
    var pinCoordinates: CLLocationCoordinate2D?
    var route: MKRoute?
    var routeData: [NSManagedObject] = []
    var firstPlace: CLLocationCoordinate2D?
    var secondPlace: CLLocationCoordinate2D?
    var backgroundTask: UIBackgroundTaskIdentifier?
    
    // MARK: - UI present
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton.isEnabled = false
        makeRouteButton.isEnabled = false
        finishButton.isEnabled = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        checkLocationEnabled()
        loadRoute()
        
        if routeData.isEmpty {
            returnRouteButton.isEnabled = false
        }
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
        
        self.firstPlace = currentPlace
        self.secondPlace = destination
        
        self.saveRoute(startPoint: currentPlace, destinationPoint: destination)
        
        showRouteOnMap(pickupCoordinate: currentPlace, destinationCoordinate: destination)
        finishButton.isEnabled = true
        makeRouteButton.isEnabled = false
        if !routeData.isEmpty {
            returnRouteButton.isEnabled = true
            
        }
    }
    
    @IBAction func finishRoute(_ sender: UIButton) {
        self.mapView.removeOverlays(mapView.overlays)
        self.mapView.removeAnnotations(mapView.annotations)
        self.firstPlace = nil
        self.secondPlace = nil
        
        finishButton.isEnabled = false
        makeRouteButton.isEnabled = true
        
    }
    
    @IBAction func returnRoute(_ sender: UIButton) {
//        guard let firstPlace = firstPlace,
//              let secondPlace = secondPlace else {
//            return
//        }
        
//        showRouteOnMap(pickupCoordinate: firstPlace, destinationCoordinate: secondPlace)
    }
}
