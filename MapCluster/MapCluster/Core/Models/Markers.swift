//
//  Location.swift
//  MapCluster
//
//  Created by Rashwan Lazkani on 2018-11-06.
//  Copyright © 2018 Rashwan Lazkani. All rights reserved.
//

import CoreLocation
import MapKit

final class Markers: NSObject, Codable {
    let locations: [Location]
}

final class Location: NSObject, MKAnnotation, Codable {
    let coordinate: CLLocationCoordinate2D
    
    private enum CodingKeys: String, CodingKey {
        case coordinate = "coordinates"
    }
}
