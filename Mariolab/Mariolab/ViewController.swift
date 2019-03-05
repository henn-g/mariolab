//
//  ViewController.swift
//  Mariolab
//
//  Created by Henry Guerra on 3/1/19.
//  Copyright © 2019 Henry Guerra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /* Public outlets */
    @IBOutlet weak var cart1: UIImageView!
    @IBOutlet weak var cart2: UIImageView!
    @IBOutlet weak var cart3: UIImageView!
    
    /* Genral public values */
    var cart1StartingPoint = CGPoint()
    var cart2StartingPoint = CGPoint()
    var cart3StartingPoint = CGPoint()
    
    /* GESTURES */
    @IBAction func cartPanned(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        print("Location: x: \(location.x), y: \(location.y)")
        let kartView = sender.view!
        kartView.center = location
    }
    @IBAction func cartPinched(_ sender: UIPinchGestureRecognizer) {
        let scale = sender.scale
        print("Scale: \(scale)")
        let kartView = sender.view!
        kartView.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
    @IBAction func cartRotated(_ sender: UIRotationGestureRecognizer) {
        let rotation = sender.rotation
        let kartView = sender.view!
        kartView.transform = CGAffineTransform(rotationAngle: rotation)
        print("ROTATION AT: \(rotation)")
    }
    @IBAction func cartTapped(_ sender: UITapGestureRecognizer) {
        let kartView = sender.view!
        UIView.animate(withDuration: 0.2) {
            kartView.center.x += 500
        }
        print("DOUBLE TAPPED")
    }
    // resets all carts to starting position
    @IBAction func backgroundLongPressed(_ sender: UILongPressGestureRecognizer) {
        UIView.animate(withDuration: 0.6) {
            self.cart1.center = self.cart1StartingPoint
            self.cart2.center = self.cart2StartingPoint
            self.cart3.center = self.cart3StartingPoint
            
            self.cart1.transform = CGAffineTransform.identity
            self.cart2.transform = CGAffineTransform.identity
            self.cart3.transform = CGAffineTransform.identity
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCartCoordinates()
    }


    /* Helper methods */
    private func loadCartCoordinates() {
        cart1StartingPoint = cart1.center
        cart2StartingPoint = cart2.center
        cart3StartingPoint = cart3.center
    }
}

