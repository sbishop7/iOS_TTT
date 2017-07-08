//
//  ViewController.swift
//  TTT
//
//  Created by Seth Bishop on 7/7/17.
//  Copyright © 2017 Seth Bishop. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var plays = 0
    var player = "Blue"
    var blocks = [0,0,0,0,0,0,0,0,0] // 0 = unplayed, 1 = blue, -1 = red
    var gameOver = false

    @IBOutlet weak var block1: UIButton!
    @IBOutlet weak var block2: UIButton!
    @IBOutlet weak var block3: UIButton!
    @IBOutlet weak var block4: UIButton!
    @IBOutlet weak var block5: UIButton!
    @IBOutlet weak var block6: UIButton!
    @IBOutlet weak var block7: UIButton!
    @IBOutlet weak var block8: UIButton!
    @IBOutlet weak var block9: UIButton!
    
    @IBOutlet weak var WinnerLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WinnerLabel.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func BlockButtonPressed(_ sender: UIButton) {
        if blocks[sender.tag - 1] == 0 && gameOver == false {
            plays += 1
            if player == "Blue" {
                sender.backgroundColor = UIColor.blue
                blocks[sender.tag - 1] = 1
                player = "Red"
            } else {
                sender.backgroundColor = UIColor.red
                blocks[sender.tag - 1] = -1
                player = "Blue"
            }
        }
        if plays > 4 {
            checkForWinner()
        }
    }
    
    func checkForWinner() {
        let directions = [blocks[0] + blocks[3] + blocks[6], blocks[1] + blocks[4] + blocks[7], blocks[2] + blocks[5] + blocks[8], blocks[0] + blocks[1] + blocks[2], blocks[3] + blocks[4] + blocks[5], blocks[6] + blocks[7] + blocks[8], blocks[2] + blocks[4] + blocks[6], blocks[0] + blocks[4] + blocks[8]]
        if plays == 9 {
            WinnerLabel.text = "Draw"
            WinnerLabel.isHidden = false
            gameOver = true
        }
        for value in directions {
            if value == 3 {
                WinnerLabel.text = "Blue Wins"
                WinnerLabel.isHidden = false
                gameOver = true
            }
            else if value == -3 {
                WinnerLabel.text = "Red Wins"
                WinnerLabel.isHidden = false
                gameOver = true
            }
        }
    }
    
    @IBAction func ResetPressed(_ sender: UIButton) {
        plays = 0
        player = "Blue"
        WinnerLabel.isHidden = true
        gameOver = false
        
        for x in 0...8{
            blocks[x] = 0
        }
        
        block1.backgroundColor = UIColor.gray
        block2.backgroundColor = UIColor.gray
        block3.backgroundColor = UIColor.gray
        block4.backgroundColor = UIColor.gray
        block5.backgroundColor = UIColor.gray
        block6.backgroundColor = UIColor.gray
        block7.backgroundColor = UIColor.gray
        block8.backgroundColor = UIColor.gray
        block9.backgroundColor = UIColor.gray
    }


}

