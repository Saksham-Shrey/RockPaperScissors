//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Saksham Shrey on 14/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Player1: UIImageView!
    @IBOutlet weak var Player2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Player1.image = UIImage(imageLiteralResourceName: "InitialBackground")
        
        Player2.image = UIImage(imageLiteralResourceName: "InitialBackground")
        
    }
    
    let rockpaperscissorsInverted = [UIImage(imageLiteralResourceName: "RockInverted"),
                            UIImage(imageLiteralResourceName: "PaperInverted"),
                            UIImage(imageLiteralResourceName: "ScissorsInverted")]
    
    let rockpaperscissors = [UIImage(imageLiteralResourceName: "Rock"),
                            UIImage(imageLiteralResourceName: "Paper"),
                            UIImage(imageLiteralResourceName: "Scissors")]
    
    @IBAction func goButtonPressed(_ sender: Any) {
        Player1.image = rockpaperscissorsInverted.randomElement()
        
        Player2.image = rockpaperscissors.randomElement()
        
    }
    
}

