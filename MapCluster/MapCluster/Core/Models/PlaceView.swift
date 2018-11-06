//
//  PlaceMarker.swift
//  MapCluster
//
//  Created by Rashwan Lazkani on 2018-11-06.
//  Copyright © 2018 Rashwan Lazkani. All rights reserved.
//

import MapKit

internal final class PlaceView: MKMarkerAnnotationView {
    internal override var annotation: MKAnnotation? { willSet { newValue.flatMap(configure(with:)) } }
}
