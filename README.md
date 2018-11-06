# MapKitCluster
Sample project that demonstrates how to use native clustering in MapKit.

## didSelect logic
When a user clicks on an annotation there is a check if it´s a cluster that has been selected. If it´s a cluster the following will happen:

### Case: <= 4
If there is 4 or less clustred items, then `showAnnotations` is called and the map will be zoomed so it fits all annotations on the map (for the clsuter that was selected).

### Case: > 4
If there is more than 4 items in the cluster then a `MKMapRect` is created and a calculation is made for each annotation and I set `setVisibleMapRect` with the calcualted `zoomRect`.

Entire logic below:

```
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
```
