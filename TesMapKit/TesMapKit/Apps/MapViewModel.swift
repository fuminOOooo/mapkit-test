//
//  MapViewModel.swift
//  TesMapKit
//
//  Created by Elvis Susanto on 16/05/23.
//

import Foundation
import MapKit
import CoreLocation

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @Published var refreshingInZero = 3
    
    @Published var todaysDate = Date()
    
    private var locationManager : CLLocationManager?
    
    @Published var locationAccess : Bool = true
    
    
    @Published var userRegion = MKCoordinateRegion (
        center: CLLocationCoordinate2D (
            latitude: 37.33546,
            longitude: 122.00908
        ),
        span: MKCoordinateSpan (
            latitudeDelta: 0.1,
            longitudeDelta: 0.1
        )
    )

    @Published var stationRegion = MKCoordinateRegion (
        center: CLLocationCoordinate2D (
            latitude: -6.20079,
            longitude: 106.82279
        ),
        span: MKCoordinateSpan (
            latitudeDelta: 0.1,
            longitudeDelta: 0.1
        )
    )
    
    @Published var isInside : Bool = false
    
    func getStation (station: String) -> [Station] {
        return stations.filter {
            $0.name.contains(station)
        }
    }
    
    func serviceAvailabilityCheck() {
            
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager?.delegate = self
        } else {
            print("Location Services not Enabled.")
        }
        
    }
    
    func checkIfUserIsInInsideRegion(dest:String) {
        if dest != "" {
            let destination = getStation(station: dest)
            stationRegion.center = destination[0].coord
        }
        else {
            stationRegion.center = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        }
        todaysDate = Date()
        guard let locationManager = locationManager else { return }
        guard let tempLocation = locationManager.location?.coordinate else { return }
        userRegion.center = tempLocation
        print(userRegion.center)
        print(stationRegion.center)
        let dukuhAtasLocationPoint = MKMapPoint(stationRegion.center)
        let userLocationPoint = MKMapPoint(userRegion.center)
        if (userLocationPoint.distance(to: dukuhAtasLocationPoint) <= 500) {
            isInside = true
        } else {
            isInside = false
        }
        print(isInside)
    }
    
    func locationAuthorizationCheck() {
        
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            
        case .restricted:
            locationAccess = false
            print("Location accesses restricted (probably due to parental settings).")
            
        case .denied:
            locationAccess = false
            print("Location accesses restricted, enable access through settings.")
            
        case .authorizedAlways, .authorizedWhenInUse:
            locationAccess = true
            userRegion = MKCoordinateRegion (
                center: locationManager.location!.coordinate,
                span: MKCoordinateSpan (
                    latitudeDelta: 0.1,
                    longitudeDelta: 0.1
                )
            )
            
        @unknown default:
            break
            
        }
        
    }
        
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        locationAuthorizationCheck()
    }
    
}
