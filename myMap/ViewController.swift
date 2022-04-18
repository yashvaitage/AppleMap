//
//  ViewController.swift
//  myMap
//
//  Created by Admin on 07/04/22.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
// --------------OUTLETS------------------
    @IBOutlet weak var mapView: MKMapView!
    
// ----------------Variables--------------
    var locationManager : CLLocationManager!
    var currentLocation : CLLocation?

// =================View LifeCycle Methods===============
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //set delegate to self
        mapView.delegate = self
        mapView.showsUserLocation = true
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        //desired Accuracy
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // Check Location Service Enable Or Not
        if CLLocationManager.locationServicesEnabled(){
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    
    // Integrate delegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations.last // array last element
        if currentLocation != nil {
            if let myLocation = locations.last{
                //create region
                let viewRegion = MKCoordinateRegion(center: myLocation.coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
                mapView.setRegion(viewRegion, animated: true)
            }
        }
    }


}

