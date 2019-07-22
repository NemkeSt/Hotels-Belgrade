//
//  MapaViewController.swift
//  TNation Zadatak
//
//  Created by Mac on 4/2/19.
//  Copyright © 2019 crossover. All rights reserved.
//

import UIKit
import MapKit



class MapaViewController: UIViewController{

    @IBOutlet weak var sideMenu: UIView!
    @IBOutlet weak var mapa: MKMapView!
    
    
    func zoom(){
        let raspon = MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)
        let lokacija = CLLocationCoordinate2DMake(44.816882, 20.460542)
        let region = MKCoordinateRegion(center: lokacija,span: raspon)
        mapa.setRegion(region, animated: true)
        
    }
    
    func napraviLokacije(){
        for lokacije in model.data {
            let annotations = MKPointAnnotation()
            annotations.title = lokacije.name
            annotations.subtitle = lokacije.address
            
            annotations.coordinate = CLLocationCoordinate2DMake(lokacije.latitude, lokacije.longitude)
            mapa.addAnnotation(annotations)
        }
    }
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        zoom()
        napraviLokacije()
        
    }
    

    @IBOutlet weak var viewLeading: NSLayoutConstraint!
    
    var brojac = 0
    @IBAction func barButton(_ sender: UIBarButtonItem) {
        brojac += 1
        if brojac == 1 {
            viewLeading.constant = 0
        } else {
            viewLeading.constant = -100
        }
        if brojac == 2 {
            brojac = 0
        }
        
    }

}

extension MapaViewController: CLLocationManagerDelegate, MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            return nil
        }
        
        let reuseId = "pin"
        
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
        }
        else {
            pinView!.annotation = annotation
        }
      
        return pinView
        
        
        
    }
    
  
    }
    

