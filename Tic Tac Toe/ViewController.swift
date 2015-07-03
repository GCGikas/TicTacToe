//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Jason Zou on 7/2/15.
//  Copyright © 2015 Jason Zou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var gridLabel0: GridLabel!
    @IBOutlet weak var gridLabel1: GridLabel!
    @IBOutlet weak var gridLabel2: GridLabel!
    @IBOutlet weak var gridLabel3: GridLabel!
    @IBOutlet weak var gridLabel4: GridLabel!
    @IBOutlet weak var gridLabel5: GridLabel!
    @IBOutlet weak var gridLabel6: GridLabel!
    @IBOutlet weak var gridLabel7: GridLabel!
    @IBOutlet weak var gridLabel8: GridLabel!
    @IBOutlet weak var gridImage0: GridUIView!
    @IBOutlet weak var gridImage1: GridUIView!
    @IBOutlet weak var gridImage2: GridUIView!
    @IBOutlet weak var gridImage3: GridUIView!
    @IBOutlet weak var gridImage4: GridUIView!
    @IBOutlet weak var gridImage5: GridUIView!
    @IBOutlet weak var gridImage6: GridUIView!
    @IBOutlet weak var gridImage7: GridUIView!
    @IBOutlet weak var gridImage8: GridUIView!
    
    var labelsArray: [GridLabel]!
    var imageArray: [GridUIView]!
    var winArray = []
    var xTurn = true
    var xWins = false
    var oWins = false
    var winningPlayer = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelsArray = [gridLabel0, gridLabel1, gridLabel2, gridLabel3, gridLabel4, gridLabel5, gridLabel6, gridLabel7, gridLabel8]
        imageArray = [gridImage0, gridImage1, gridImage2, gridImage3, gridImage4, gridImage5, gridImage6, gridImage7, gridImage8]
    }

    func checker(a: GridLabel, b: GridLabel, c: GridLabel) {
        if (a.text != nil && b.text == a.text && b.text == c.text) {
            winningPlayer = b.text!
        }
    }
    
    func checkImage(a: GridUIView, b: GridUIView, c: GridUIView) {
        if (a.image != nil && b.image == a.image && b.image == c.image) {
            winningPlayer = "\(b.image)"
        }
    }
    
    func checkingForWinner() {
        checker(gridLabel0, b: gridLabel1, c: gridLabel2)
        checker(gridLabel3, b: gridLabel4, c: gridLabel5)
        checker(gridLabel6, b: gridLabel7, c: gridLabel8)
        checker(gridLabel0, b: gridLabel3, c: gridLabel6)
        checker(gridLabel1, b: gridLabel4, c: gridLabel7)
        checker(gridLabel2, b: gridLabel5, c: gridLabel8)
        checker(gridLabel0, b: gridLabel4, c: gridLabel8)
        checker(gridLabel2, b: gridLabel4, c: gridLabel8)
    }
    
    func checkingForImageWinner() {
        checkImage(gridImage0, b: gridImage1, c: gridImage2)
        checkImage(gridImage3, b: gridImage4, c: gridImage5)
        checkImage(gridImage6, b: gridImage7, c: gridImage8)
        checkImage(gridImage0, b: gridImage3, c: gridImage6)
        checkImage(gridImage1, b: gridImage4, c: gridImage7)
        checkImage(gridImage2, b: gridImage5, c: gridImage8)
        checkImage(gridImage0, b: gridImage4, c: gridImage8)
        checkImage(gridImage2, b: gridImage4, c: gridImage6)
    }
    
    func alertMessage(value : String) {
        let message = value + " has won!"
        let alert = UIAlertController(title: "Winner!", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func alertMessageImage(value : String) {
        let message = value + " has won!"
        let alert = UIAlertController(title: "Winner!", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func resetGridImages() {
        for image in imageArray {
            image.image = nil
        }
    }
    
    @IBAction func onTappedChangeImage(sender: UITapGestureRecognizer) {
        for image in imageArray {
            if (CGRectContainsPoint(image.frame, sender.locationInView(backgroundView))) {
                if image.canTap == true {
                    if xTurn == true {
                        image.image = er34yqh
                        xTurn = false
                        image.canTap = false
                    }
                    else {
                        image.image = 4drrsg3q4
                        xTurn = true
                        image.canTap = false
                    }
                    checkingForWinner()
                    if winningPlayer == "X" {
                        print("X has won")
                        alertMessageImage(winningPlayer)
                    }
                    else if winningPlayer == "O" {
                        print("O has won")
                        alertMessageImage(winningPlayer)
                    }
                }
            }
        }
    }
        
    @IBAction func onTappedChangeLabel(sender: UITapGestureRecognizer) {
        for label in labelsArray {
            if (CGRectContainsPoint(label.frame, sender.locationInView(backgroundView))) {
                if label.canTap == true {
                    if xTurn == true {
                        label.text = "X"
                        xTurn = false
                        label.canTap = false
                    }
                    else {
                        label.text = "O"
                        xTurn = true
                        label.canTap = false
                    }
                checkingForWinner()
                    if winningPlayer == "X" {
                        print("X has won")
                        alertMessage(winningPlayer)
                    }
                    else if winningPlayer == "O" {
                        print("O has won")
                        alertMessage(winningPlayer)
                    }
                }
            }
        }
    }
}