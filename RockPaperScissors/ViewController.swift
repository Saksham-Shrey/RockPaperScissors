//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Saksham Shrey on 14/02/24.
//

import UIKit
import SAConfettiView

class ViewController: UIViewController {
    
    @IBOutlet weak var Player1: UIImageView!
    @IBOutlet weak var Player2: UIImageView!
    @IBOutlet weak var GoButton: UIButton!
    
    
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
    
    var resetTimer: Timer?

    @IBAction func goButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, animations: {
            sender.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { _ in
            UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveEaseInOut, animations: {
                sender.transform = .identity
            })
        }
        
        
        Player1.subviews.forEach { $0.removeFromSuperview() }
        Player2.subviews.forEach { $0.removeFromSuperview() }
        
        
          let player1Choice = rockpaperscissorsInverted.randomElement()
          let player2Choice = rockpaperscissors.randomElement()
          Player1.image = player1Choice
          Player2.image = player2Choice

          if player1Choice == UIImage(named: "RockInverted") && player2Choice == UIImage(named: "Scissors") {
              addConfetti(to: Player1)
          } else if player1Choice == UIImage(named: "ScissorsInverted") && player2Choice == UIImage(named: "Paper") {
              addConfetti(to: Player1)
          } else if player1Choice == UIImage(named: "PaperInverted") && player2Choice == UIImage(named: "Rock") {
              addConfetti(to: Player1)
          } else if player2Choice == UIImage(named: "Rock") && player1Choice == UIImage(named: "ScissorsInverted") {
              addConfetti(to: Player2)
          } else if player2Choice == UIImage(named: "Scissors") && player1Choice == UIImage(named: "PaperInverted") {
              addConfetti(to: Player2)
          } else if player2Choice == UIImage(named: "Paper") && player1Choice == UIImage(named: "RockInverted") {
              addConfetti(to: Player2)
          }
        
        if(Player1.image == UIImage(imageLiteralResourceName: "RockInverted")){
                   
        }
        resetTimer?.invalidate()

            resetTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { [weak self] _ in
            
                self?.resetViewState()
            }
        }
    
    func addConfetti(to playerImageView: UIImageView) {
        let confettiView = SAConfettiView(frame: playerImageView.bounds)
        playerImageView.addSubview(confettiView)
        confettiView.startConfetti()
    }

    
        func resetViewState() {
            
            Player1.image = UIImage(named: "InitialBackground")
            Player2.image = UIImage(named: "InitialBackground")
            
            Player1.subviews.forEach { $0.removeFromSuperview() }
            Player2.subviews.forEach { $0.removeFromSuperview() }
        }
}

