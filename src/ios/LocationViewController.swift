//
//  LocationViewController.swift
//  IonicTestApp
//
//  Created by Asad Palekar on 12/14/16.
//
//

import UIKit

class LocationViewController: UIViewController, EILIndoorLocationManagerDelegate {
    
    let locationManager = EILIndoorLocationManager()
    
    var location: EILLocation!
    
    @IBOutlet weak var locationView: EILIndoorLocationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // You can get them by adding your app on https://cloud.estimote.com/#/apps
        ESTConfig.setupAppID("visa-inc-s-blank-adb", andAppToken: "595cc203129011decb5196b64511f52b")
        
        self.locationManager.delegate = self
        
        
        // You will find the identifier on https://cloud.estimote.com/#/locations
        let fetchLocationRequest = EILRequestFetchLocation(locationIdentifier: "demo-room-new")
        fetchLocationRequest.sendRequest { (location, error) in
            if let location = location {
                self.location = location
                
                // You can configure the location view to your liking:
                self.locationView.showTrace = true
                self.locationView.rotateOnPositionUpdate = false
                // Consult the full list of properties on:
                // http://estimote.github.io/iOS-Indoor-SDK/Classes/EILIndoorLocationView.html
                
                self.locationView.drawLocation(location)
                self.locationManager.startPositionUpdates(for: self.location)
            } else {
                print("can't fetch location: \(error)")
            }
        }
    }
    
    func indoorLocationManager(_ manager: EILIndoorLocationManager, didFailToUpdatePositionWithError error: NSError) {
        print("failed to update position: \(error)")
    }
    
    func indoorLocationManager(_ manager: EILIndoorLocationManager, didUpdatePosition position: EILOrientedPoint, with positionAccuracy: EILPositionAccuracy, in location: EILLocation) {
        var accuracy: String!
        switch positionAccuracy {
        case .veryHigh: accuracy = "+/- 1.00m"
        case .high:     accuracy = "+/- 1.62m"
        case .medium:   accuracy = "+/- 2.62m"
        case .low:      accuracy = "+/- 4.24m"
        case .veryLow:  accuracy = "+/- ? :-("
        case .unknown:  accuracy = "unknown"
        }
        print(String(format: "x: %5.2f, y: %5.2f, orientation: %3.0f, accuracy: %@", position.x, position.y, position.orientation, accuracy))
        
        self.locationView.updatePosition(position)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
