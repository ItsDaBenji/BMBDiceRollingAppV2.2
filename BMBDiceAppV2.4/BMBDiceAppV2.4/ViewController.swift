//
//  ViewController.swift
//  BMBDiceAppV2.4
//
//  Created by Benjamin Blackmon on 11/21/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var diceImageView: UIImageView!
    @IBOutlet var criticalLabel: UILabel!
    var audioPlayer: AVAudioPlayer?
        
    override func viewDidLoad() {
        super.viewDidLoad()
            // Do any additional setup after loading the view.
    }

    @IBAction func buttonGotPressed()
    {
        rollDice()
    }
        
    func rollDice()
    {
        print("Dice rolled")
            
        let rolledNumber = Int.random(in: 1...20)
        let imageName = "d\(rolledNumber)"
            
        diceImageView.image = UIImage(named: imageName)
        if(rolledNumber == 20)
        {
            criticalLabel.text = "You did da thing"
            
        }
        let pathToSound = Bundle.main.path(forResource: "rolldice", ofType: "mp3")!
        let successSound = Bundle.main.path(forResource: "zfanfare", ofType: "mp3")!
        let failSound = Bundle.main.path(forResource: "failwah", ofType: "mp3")!
            
        if(rolledNumber == 20)
        {
            criticalLabel.text = "You did da thing"
            let url = URL(fileURLWithPath: successSound)
            do
            {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }
            catch
            {
                print("bad")
            }
                
        }
        else if(rolledNumber == 1)
        {
            criticalLabel.text = "Failure"
            let url = URL(fileURLWithPath: failSound)
            do
            {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }
            catch
            {
                print("bad")
            }
        }
        else
        {
            criticalLabel.text = ""
            let url = URL(fileURLWithPath: pathToSound)
            do
            {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }
            catch
            {
                print("bad")
            }
                
        }
    }
            
        
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?)
    {
        if (motion == .motionShake)
            {
                rollDice();
            }
    }
}
        

