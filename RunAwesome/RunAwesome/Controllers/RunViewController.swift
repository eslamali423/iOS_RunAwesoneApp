//
//  RunViewController.swift
//  RunAwesome
//
//  Created by Eslam Ali  on 03/05/2022.
//

import UIKit
import MapKit

class RunViewController: BaseViewController {
    
    //MARK:- Vars
    
    var run : Run
    
    private var map : MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        map.alpha = 0.6
       
        return map
    }()
    
    
    private let topHandelBackground : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        return view
    }()
    
    private let topHandel : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        view.layer.cornerRadius = 3
        view.layer.masksToBounds = true
        return view
    }()
    
    
    
    init(run : Run) {
 
        self.run = run
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayouts()
        configureConstraints()
        
        map.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setMapOverlay()
        
    }
    
    //MARK:- layout and constraints
    private func setupLayouts() {
        view.addSubview(map)
        view.addSubview(topHandelBackground)
        topHandelBackground.addSubview(topHandel)
    }
    private func  configureConstraints() {
        
        NSLayoutConstraint.activate([
            map.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            map.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            map.topAnchor.constraint(equalTo: view.topAnchor),
            map.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            topHandelBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topHandelBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topHandelBackground.topAnchor.constraint(equalTo: view.topAnchor),
            topHandelBackground.heightAnchor.constraint(equalToConstant: 20),
            
            topHandel.widthAnchor.constraint(equalToConstant: 100 ),
            topHandel.heightAnchor.constraint(equalToConstant: 6),
            topHandel.centerYAnchor.constraint(equalTo: topHandelBackground.centerYAnchor),
            topHandel.centerXAnchor.constraint(equalTo: topHandelBackground.centerXAnchor),
    
        ])
        
        
    }
    
    //MARK:- Map Overlay
    
    func setMapOverlay() {
        if map.overlays.count > 0 {
            map.removeOverlays(map.overlays)
        }
        
        map.addOverlay(getPolyline(run: run))
        // for camera zoom in on the line
        map.setRegion(centerMap(run: run), animated: true)
        
        
        let startPoint = MKPointAnnotation()
        startPoint.title = "Start"
        let startLocation = run.locations[run.locations.count  - 1]
        startPoint.coordinate = CLLocationCoordinate2D(latitude: startLocation.latiude, longitude: startLocation.longtude)
        
        map.addAnnotation(startPoint )
    
        let endPoint = MKPointAnnotation()
        endPoint.title = "Finish"
        let endLocation = run.locations[run.locations.count  - 1]
        endPoint.coordinate = CLLocationCoordinate2D(latitude: endLocation.latiude, longitude: endLocation.longtude)
        
        map.addAnnotation(endPoint )
    
    }
    
    private func  getPolyline(run : Run) -> MKPolyline {
        var coord = [CLLocationCoordinate2D]()
        for location in run.locations {
            coord.append(CLLocationCoordinate2D(latitude: location.latiude, longitude: location.longtude))
        }
        
        return MKPolyline(coordinates: coord, count: run.locations.count)
    }
    
    private func centerMap(run : Run) -> MKCoordinateRegion{
        guard let (minLocation, maxLocation) = getMinMaxLocation(run: run) else {
            return MKCoordinateRegion()
        }
        
        return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: (minLocation.latitude + maxLocation.latitude) / 2 , longitude: (minLocation.longitude + maxLocation.longitude) / 2), span:  MKCoordinateSpan(latitudeDelta: (maxLocation.latitude - minLocation.latitude) * 1.5, longitudeDelta: (maxLocation.longitude - minLocation.longitude ) * 1.5)  )
    }
    
    private func getMinMaxLocation(run : Run) -> (min: CLLocationCoordinate2D, max: CLLocationCoordinate2D)? {
        let locations = run.locations
        
        guard let firstLocation = locations.first else {
            return nil
        }
        
        var minLatitude = firstLocation.latiude
        var minLongtude = firstLocation.longtude
        
        var maxLatitude = minLatitude
        var maxLongitude = minLongtude
        
        for location in locations {
            minLatitude = min(minLatitude, location.latiude)
            minLongtude = min(minLongtude, location.longtude)
            
            maxLatitude = max(maxLatitude, location.latiude)
            maxLongitude = max(maxLatitude, location.longtude)
            
        }
        
        return (min: CLLocationCoordinate2D(latitude: minLatitude, longitude: minLongtude), max:(CLLocationCoordinate2D(latitude: maxLatitude, longitude: maxLongitude)))
        
        
    }
    
    
}

//MARK:- Extension for Mapkit Delegate
extension RunViewController : MKMapViewDelegate {
   
//    this fucntion to set the line for run on the map
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let polyline = overlay as! MKPolyline
        let render  = MKPolylineRenderer(polyline: polyline)
        render.strokeColor = UIColor.blue
        render.lineWidth = 4
        
        return render
    }
    // this fucntion  to set the start and end point
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else  { return nil }
        
        let identifier = "mapAnnotation"
        var annotationView = map.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        }else  {
            annotationView!.annotation = annotation
        }
        // set the color for the pin
        if annotation.title == "Start" {
            annotationView!.pinTintColor = UIColor.red
            
        }else if annotation.title == "Finish" {
            annotationView!.pinTintColor = UIColor.green
        }
        
        return annotationView
        
    }
    
    
    
}
