//
//  ViewController.swift
//  Knight's Tale
//
//  Created by Blake Swaidner on 4/7/16.
//  Copyright © 2016 Blake Swaidner. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var orcImg: UIImageView!
    @IBOutlet weak var knightImg: UIImageView!
    @IBOutlet weak var Chest: UIButton!
    @IBOutlet weak var PrintLbl: UILabel!
    @IBOutlet weak var Player1Attack: UIButton!
    @IBOutlet weak var Player2Attack: UIButton!
    @IBOutlet weak var knightHPLbl: UILabel!
    @IBOutlet weak var orcHPLbl: UILabel!
    

    var knight:Knight!
    var orc: Orc!
    var OrcSound: AVAudioPlayer!
    var KnightSound: AVAudioPlayer!
    var bgMusic: AVAudioPlayer!
    var ChestSound: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playBackgroundMusic()
        knight = Knight(name: "Sparticus", hp: 100, attackPower: 20)
        orc = Orc(name: "Goulag", hp: 120, attackPower: 15)
        
    }

    @IBAction func onOrcAttack(sender: AnyObject) {
        if knight.isAlive {
            let OrcAttPwr = Int(arc4random_uniform(UInt32(orc.attackPower)))
            knight.attemptAttack(OrcAttPwr)
            playOrcSound()
            PrintLbl.text = "\(orc.name) attacked \(knight.name) for \(OrcAttPwr) HP!"
            knightHPLbl.text = "\(knight.hp) hp"
        }
        if !knight.isAlive {
            playOrcSound()
            PrintLbl.text = "You found \(knight.dropLoot()!)"
            knightImg.hidden = true
            Chest.hidden = false
            
            knightHPLbl.text = ""
            Player1Attack.enabled = false
            Player2Attack.enabled = false
        }
        
        
        
    }

    @IBAction func onKnightAttack(sender: AnyObject) {
        if orc.isAlive {
            playKnightSound()
            let KnightAttPwr = Int(arc4random_uniform(UInt32(knight.attackPower)))
            orc.attemptAttack(KnightAttPwr)
            PrintLbl.text = "\(knight.name) attacked \(orc.name) for \(KnightAttPwr) HP!"
            orcHPLbl.text = "\(orc.hp) hp"
        }
        if !orc.isAlive {
            playKnightSound()
            PrintLbl.text = "You found \(orc.dropLoot()!)"
            orcImg.hidden = true
            Chest.hidden = false
            
            orcHPLbl.text = ""
            
            Player1Attack.enabled = false
            Player2Attack.enabled = false
        }
        
    }
    @IBAction func onChestTap(sender: AnyObject) {
        playChestSound()
        Chest.hidden = true
        
        orcImg.hidden = false
        knightImg.hidden = false
        
        knight = Knight(name: "Sparticus", hp: 100, attackPower: 20)
        orc = Orc(name: "Goulag", hp: 120, attackPower: 15)
        
        orcHPLbl.text = "\(orc.hp) hp"
        knightHPLbl.text = "\(knight.hp) hp"
        
        PrintLbl.text = "Press attack to start game!"
        
        Player1Attack.enabled = true
        Player2Attack.enabled = true
    
    }
    
    func playOrcSound() {
        let orcpath = NSBundle.mainBundle().pathForResource("orcsattack", ofType: "wav")
        let orcsoundURL = NSURL(fileURLWithPath: orcpath!)
        
        do {
            try OrcSound = AVAudioPlayer(contentsOfURL: orcsoundURL)
            OrcSound.prepareToPlay()
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        if OrcSound.playing {
            OrcSound.stop()
        }
        OrcSound.play()
        
    }
    
    func playKnightSound() {
        let knightpath = NSBundle.mainBundle().pathForResource("knightsattack", ofType: "wav")
        let knightsoundURL = NSURL(fileURLWithPath: knightpath!)
        
        do {
            try KnightSound = AVAudioPlayer(contentsOfURL: knightsoundURL)
            KnightSound.prepareToPlay()
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        if KnightSound.playing {
            OrcSound.stop()
        }
        KnightSound.play()
        
    }
    
    func playChestSound() {
        let chestpath = NSBundle.mainBundle().pathForResource("chestopen", ofType: "wav")
        let chestsoundURL = NSURL(fileURLWithPath: chestpath!)
        
        do {
            try ChestSound = AVAudioPlayer(contentsOfURL: chestsoundURL)
            ChestSound.prepareToPlay()
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    
        if ChestSound.playing {
            ChestSound.stop()
        }
        ChestSound.play()
        
    }
    
    func playBackgroundMusic() {
        let bgpath = NSBundle.mainBundle().pathForResource("BackgroundMusic", ofType: "mp3")
        let bgsoundURL = NSURL(fileURLWithPath: bgpath!)
        
        do {
            try bgMusic = AVAudioPlayer(contentsOfURL: bgsoundURL)
            bgMusic.prepareToPlay()
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        if !bgMusic.playing {
            bgMusic.play()
        }
        bgMusic.numberOfLoops = -1
    }
    
    
}

