//
//  Knight.swift
//  Knight's Tale
//
//  Created by Blake Swaidner on 4/9/16.
//  Copyright © 2016 Blake Swaidner. All rights reserved.
//

import Foundation

class Knight: Character {
    
    private var _name = "Player 2"
    
    var name: String {
        get {
            return _name
        }
    }
    
    var loot: [String] {
        return ["Rare Helm", "Cracked Buckler", "Magic Broad Sword", "Flawed Ruby", "200 gold", "100 gold", "Adament Long Sword"]
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