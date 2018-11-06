//
//  ViewController.swift
//  MapCluster
//
//  Created by Rashwan Lazkani on 2018-11-06.
//  Copyright © 2018 Rashwan Lazkani. All rights reserved.
//

import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.register(PlaceView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        mapView.register(PlaceCluster.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)

        if let markers = DataHelper.getMarkers() {
            for location in markers.locations {
                mapView.addAnnotation(location)
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotation = view.annotation as? MKClusterAnnotation {
            mapView.deselectAnnotation(annotation, animated: false)
            
            if annotation.memberAnnotations.count <= 4 {
                mapView.showAnnotations(annotation.memberAnnotations, animated: true)
            } else {
                var zoomRect = MKMapRect.null
                for annotation in annotation.memberAnnotations {
                    let annotationPoint = MKMapPoint(annotation.coordinate)
                    let pointRect = MKMapRect(x: annotationPoint.x, y: annotationPoint.y, width: 0, height: 0)
                    zoomRect = zoomRect.union(pointRect)
                    
                    if MKMapRect.null.contains(zoomRect) {
                        zoomRect = pointRect
                    } else {
                        zoomRect = zoomRect.union(pointRect)
                    }
                }
                
                mapView.setVisibleMapRect(zoomRect, animated: true)
            }
        }
    }
}
