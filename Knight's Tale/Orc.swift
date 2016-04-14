//
//  Orc.swift
//  Knight's Tale
//
//  Created by Blake Swaidner on 4/9/16.
//  Copyright © 2016 Blake Swaidner. All rights reserved.
//

import Foundation

class Orc: Character {
    
    private var _name = "Player 1"
    
    var name: String {
        get {
            return _name
        }
    }
    
    var loot: [String] {
        return ["Rusty Dagger", "Cracked Buckler", "Boar's Hide", "Chain Mail", "Mythril Dagger", "Bonesmash Maul", "300 gold", "50 gold"]
    }
    
    convenience init (name: String, hp: Int, attackPower: Int){
        self.init(startingHP: hp, attackPower: attackPower)
        _name = name
        
    }
    
    func dropLoot() -> String? {
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        }
        return nil
    }
    
}