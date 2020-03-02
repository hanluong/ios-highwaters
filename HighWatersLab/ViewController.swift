//
//  ViewController.swift
//  HighWatersLab
//
//  Created by Han Luong on 3/3/20.
//  Copyright © 2020 Han Luong. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    // Outlets
    @IBOutlet weak var mapView: MKMapView!
    
    // Vars
    private var locationManager: CLLocationManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestWhenInUseAuthorization()
        
//        mapView.showsUserLocation = true
        mapView.delegate = self
        
        locationManager.startUpdatingLocation()
        
        setupUI()
    }
    
    private func setupUI() {
        let addFloodButton = UIButton(frame: .zero)
        addFloodButton.setImage(UIImage(named: "plus-image"), for: .normal)
        addFloodButton.addTarget(self, action: #selector(addFloodButtonWasPressed(_:)), for: .touchUpInside)
        addFloodButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(addFloodButton)
        
        addFloodButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        addFloodButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -40).isActive = true
        addFloodButton.widthAnchor.constraint(equalToConstant: 45).isActive = true
        addFloodButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    @objc func addFloodButtonWasPressed(_ sender: Any) {
        if let location = locationManager.location {
            let annotation = MKPointAnnotation()
            annotation.coordinate = location.coordinate
            mapView.showsUserLocation = false
            mapView.addAnnotation(annotation)
        }
        print("addFloodButtonWasPressed()")
    }


    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let coordinate = location.coordinate
            let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            mapView.setRegion(region, animated: true)
            mapView.showsUserLocation = true
        }
    }
}

