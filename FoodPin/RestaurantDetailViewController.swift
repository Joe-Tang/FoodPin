//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Joe on 2019/1/8.
//  Copyright © 2019 Joe. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class RestaurantDetailViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var restaurantImageView: UIImageView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var mapView: MKMapView!

    var restaurant: RestaurantMO!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = restaurant.name
        restaurantImageView.image = UIImage(data: restaurant.image!)

        let ratio = CGFloat(100.0/255.0)
        tableView.backgroundColor = UIColor(red: ratio, green: ratio, blue: ratio, alpha: 0.2)
        //tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.separatorColor = UIColor(red: ratio, green: ratio, blue: ratio, alpha: 0.8)
        tableView.estimatedRowHeight = 36
        tableView.rowHeight = UITableView.automaticDimension
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showMap))
        mapView.addGestureRecognizer(tapGestureRecognizer)
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(restaurant.location!, completionHandler: {
            placemarks, error in
            if error != nil {
                print(error as Any)
                return
            }
            if let placemarks = placemarks {
                let placemark = placemarks[0]
                let annotation = MKPointAnnotation()
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    self.mapView.addAnnotation(annotation)
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 250, longitudinalMeters: 250)
                    self.mapView.setRegion(region, animated: false)
                }
            }
        })
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RestaurantDetailTableViewCell

        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Name"
            cell.valueLabel.text = restaurant.name
        case 1:
            cell.fieldLabel.text = "Type"
            cell.valueLabel.text = restaurant.type
        case 2:
            cell.fieldLabel.text = "Location"
            cell.valueLabel.text = restaurant.location
        case 3:
            cell.fieldLabel.text = "Phone"
            cell.valueLabel.text = restaurant.phone
        case 4:
            cell.fieldLabel.text = "Been here"
            cell.valueLabel.text = restaurant.isVisited ? "Yes, I've been here before.\(restaurant.rating ?? "Unknown")"
                                                        : "No"
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }

        cell.backgroundColor = UIColor.clear

        return cell
    }
    
    @IBAction func close(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func ratingButtonTapped(segue: UIStoryboardSegue) {
        if let rating = segue.identifier {
            restaurant.isVisited = true
            switch rating {
            case "great":
                restaurant.rating = "Absolutely love it! Must try."
            case "good":
                restaurant.rating = "Pretty good."
            case "dislike":
                restaurant.rating = "I don't like it."
            default:
                break
            }
            
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                appDelegate.saveContext()
            }
            
            tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showReview" {
            let destinationController = segue.destination as! ReviewViewController
            destinationController.restaurant = self.restaurant
        } else if segue.identifier == "showMap" {
            let destinationController = segue.destination as! MapViewController
            destinationController.restaurant = self.restaurant
        }
    }
    
    @objc func showMap() {
        performSegue(withIdentifier: "showMap", sender: self)
    }
    
}
