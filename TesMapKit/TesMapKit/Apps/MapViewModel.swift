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
    
    @Published var dest: String = ""
    
    @Published var todaysDate = Date()
    
    private var locationManager : CLLocationManager?
    
    @Published var locationAccess : Bool = true
    
    @Published var userRegion : CLLocation?

    @Published var stationRegion : CLCircularRegion?
    
    @Published var isInside : Bool = false
    
    func getStation (station: String) -> [Station] {
        return stations.filter {
            $0.name.contains(station)
        }
    }
    
    func serviceAvailabilityCheck() {
        DispatchQueue.main.async {
            if CLLocationManager.locationServicesEnabled() {
                self.locationManager = CLLocationManager()
                self.locationManager?.delegate = self
            } else {
                print("Location Services not Enabled.")
            }
        }
    }
    
//    func checkIfUserIsInInsideRegion() {
//
//        todaysDate = Date()
//        guard let locationManager = locationManager else { return }
//        guard let tempLocation = locationManager.location?.coordinate else { return }
//        userRegion.center = tempLocation
//        print(userRegion.center)
//        print(stationRegion.center)
//        let dukuhAtasLocationPoint = MKMapPoint(stationRegion.center)
//        let userLocationPoint = MKMapPoint(userRegion.center)
//        if (userLocationPoint.distance(to: dukuhAtasLocationPoint) <= 500) {
//            isInside = true
//        } else {
//            isInside = false
//        }
//        print(isInside)
//    }
    
    func locationAuthorizationCheck() {
        
        guard let locationManager = locationManager else { return }
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        
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
            
        @unknown default:
            break
            
        }
        
    }
    
    func startMonitoring () {
        if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
            
            if dest != "" {
                stationRegion = CLCircularRegion (
                    center: getStation(station: dest).first!.coord,
                    radius: 300,
                    identifier: dest
                )
            }
            else {
                stationRegion = CLCircularRegion(center: CLLocationCoordinate2D(latitude: 0, longitude: 0), radius: 300, identifier: "")
            }
            
            let geofenceRegion = stationRegion
            geofenceRegion!.notifyOnExit = true
            geofenceRegion!.notifyOnEntry = true
            
            locationManager?.startMonitoring(for: geofenceRegion!)
        }
    }
    
    func stopMonitoring () {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        // Notifikasi Memasuki Daerah Satu Stasiun
        isInside = true
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        isInside = false
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        userRegion = locations.last
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        locationAuthorizationCheck()
    }
    
}
