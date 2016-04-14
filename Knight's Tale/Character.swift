//
//  Character.swift
//  Knight's Tale
//
//  Created by Blake Swaidner on 4/9/16.
//  Copyright © 2016 Blake Swaidner. All rights reserved.
//

import Foundation

class Character {
    
    private var _hp: Int = 100
    private var _attackPower: Int = 10
    
    var attackPower: Int {
        get {
            return _attackPower
        }
    }
    
    var hp: Int {
        get {
            return _hp
        }

    }
    var isAlive: Bool {
        get {
            if hp >= 0 {
                return true
            }
            else {
                return false
            }
        }
    }
    init (startingHP: Int, attackPower: Int) {
        self._hp = startingHP
        self._attackPower = attackPower
    }
    
    func attemptAttack (attackPower: Int) -> Bool {
        self._hp -= attackPower
        return true
    }
    
}