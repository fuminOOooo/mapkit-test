//
//  StationLoc.swift
//  TesMapKit
//
//  Created by Dwianditya Hanif Raharjanto on 17/07/23.
//

import Foundation
import MapKit

struct Station: Identifiable {
    var id = UUID()
    var name: String
    var coord: CLLocationCoordinate2D
}

let stations = [
    Station(name: "Apple Academy", coord: CLLocationCoordinate2D(latitude: -6.302187311380335, longitude: 106.65256217678264)),
    Station(name: "Bundaran HI", coord: CLLocationCoordinate2D(latitude: -6.19188396034883, longitude: 106.82295539575925)),
    Station(name: "Dukuh Atas BNI", coord: CLLocationCoordinate2D(latitude: -6.200798527036672, longitude: 106.82279676630594)),
    Station(name: "Setiabudi Astra", coord: CLLocationCoordinate2D(latitude: -6.208865127008377, longitude: 106.82149529575942)),
    Station(name: "Bendungan Hilir", coord: CLLocationCoordinate2D(latitude: -6.215002660209073, longitude: 106.81795133686383)),
    Station(name: "Istora Mandiri", coord: CLLocationCoordinate2D(latitude: -6.222363960164421, longitude: 106.80859003686402)),
    Station(name: "Senayan", coord: CLLocationCoordinate2D(latitude: -6.226748592908239, longitude: 106.80248007796841)),
    Station(name: "Asean", coord: CLLocationCoordinate2D(latitude: -6.238716960065347, longitude: 106.79860869575973)),
    Station(name: "Blok M", coord: CLLocationCoordinate2D(latitude: -6.244471326882869, longitude: 106.7980999957599)),
    Station(name: "Blok A", coord: CLLocationCoordinate2D(latitude: -6.2557539602835455, longitude: 106.79713469575991)),
    Station(name: "Haji Nawi", coord: CLLocationCoordinate2D(latitude: -6.266681944049822, longitude: 106.79733401328379)),
    Station(name: "Cipete Raya", coord: CLLocationCoordinate2D(latitude: -6.278265260232667, longitude: 106.79732266631247)),
    Station(name: "Fatmawati", coord: CLLocationCoordinate2D(latitude:-6.292451326712963, longitude: 106.7924599957604)),
    Station(name: "Lebak Bulus Grab", coord: CLLocationCoordinate2D(latitude: -6.28941889639816, longitude: 106.7740255663676))
]
