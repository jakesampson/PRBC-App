//
//  CalendarViewController.swift
//  Park Ridge Baptist Church
//
//  Created by Jake Sampson on 14/2/19.
//  Copyright © 2019 Jake Sampson. All rights reserved.
//

import UIKit
import MapKit

class LocationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func getDirectionsToPRBC(_ sender: Any) {
        openMapForPlace()
    }
    
    
    func openMapForPlace() {
        
        let latitude: CLLocationDegrees = -27.712944231379204
        let longitude: CLLocationDegrees = 153.03624629974365
        
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Park Ridge Baptist Church"
        mapItem.openInMaps(launchOptions: options)
    }
    
    
}
