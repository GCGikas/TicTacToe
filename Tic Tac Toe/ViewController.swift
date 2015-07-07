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
    @IBOutlet weak var gridImage0: GridUIView!
    @IBOutlet weak var gridImage1: GridUIView!
    @IBOutlet weak var gridImage2: GridUIView!
    @IBOutlet weak var gridImage3: GridUIView!
    @IBOutlet weak var gridImage4: GridUIView!
    @IBOutlet weak var gridImage5: GridUIView!
    @IBOutlet weak var gridImage6: GridUIView!
    @IBOutlet weak var gridImage7: GridUIView!
    @IBOutlet weak var gridImage8: GridUIView!
    @IBOutlet weak var steamBunDragImage: UIImageView!
    @IBOutlet weak var appleDragImage: UIImageView!
    
    var imageArray: [GridUIView]!
    var winArray = []
    var xTurn = true
    var xWins = false
    var oWins = false
    var winningPlayer = ""
    var totalTurns = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageArray = [gridImage0, gridImage1, gridImage2, gridImage3, gridImage4, gridImage5, gridImage6, gridImage7, gridImage8]
        for image in imageArray {
            image.image = UIImage(named: "")
            image.canTap = true
        }
    }

    func checkImage(a: GridUIView, b: GridUIView, c: GridUIView) {
        if (a.image != nil && b.image == a.image && b.image == c.image) {
            if b.image == UIImage(named: "SteamBun") {
                winningPlayer = "Steam Bun"
            }
            else {
                winningPlayer = "Apple"
            }
        }
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
    
    func alertMessageImage(value : String) {
        let message = value + " has won!"
        let alert = UIAlertController(title: "Winner!", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func alertMessageCatsGame() {
        let message = "It's a cat's game!"
        let alert = UIAlertController(title: "Cat's Game!", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func resetGridImages() {
        for image in imageArray {
            image.image = UIImage(named: "")
            image.canTap = true
            xTurn = true
        }
    }
    
    @IBAction func onTappedChangeImage(sender: UITapGestureRecognizer) {
        for image in imageArray {
            if (CGRectContainsPoint(image.frame, sender.locationInView(backgroundView))) {
                if image.canTap == true {
                    if xTurn == true {
                        image.image = UIImage(named: "SteamBun")
                        xTurn = false
                        image.canTap = false
                        totalTurns = totalTurns + 1
                    }
                    else {
                        image.image = UIImage(named: "Apple")
                        xTurn = true
                        image.canTap = false
                        totalTurns = totalTurns + 1
                    }
                    checkingForImageWinner()
                    if winningPlayer == "Steam Bun" {
                        alertMessageImage(winningPlayer)
                        resetGridImages()
                        winningPlayer = ""
                        totalTurns = 0
                        
                    }
                    else if winningPlayer == "Apple" {
                        alertMessageImage(winningPlayer)
                        resetGridImages()
                        winningPlayer = ""
                        totalTurns = 0
                    }
                    else if totalTurns == 9 {
                        alertMessageCatsGame()
                        resetGridImages()
                        winningPlayer = ""
                        totalTurns = 0
                    }
                }
            }
        }
    }
}