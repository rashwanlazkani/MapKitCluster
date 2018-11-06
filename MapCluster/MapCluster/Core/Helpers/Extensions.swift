//
//  Extensions.swift
//  MapCluster
//
//  Created by Rashwan Lazkani on 2018-11-06.
//  Copyright © 2018 Rashwan Lazkani. All rights reserved.
//

import CoreLocation
import MapKit

extension CLLocationCoordinate2D: Codable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(latitude)
        try container.encode(longitude)
    }
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        self.init()
        latitude = try container.decode(Double.self)
        longitude = try container.decode(Double.self)
    }
}

extension PlaceView {
    func configure(with annotation: MKAnnotation) {
        guard annotation is Location else { fatalError("Unexpected annotation type: \(annotation)") }
        markerTintColor = .red
        //glyphImage = UIImage(named: "")
        clusteringIdentifier = String(describing: PlaceView.self)
    }
}
