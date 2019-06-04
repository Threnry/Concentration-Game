//
//  Card.swift
//  Concentration
//
//  Created by user145418 on 9/5/18.
//  Copyright © 2018 user145418. All rights reserved.
//

import Foundation

struct Card{   // structure that represents the card
    var isFaceUp = false
    var isMatched = false
    var isFlipped = false
    var identifier: Int
    static var identifierFactory = 0
    
   private static func getUniqueIdentifier() -> Int{
        identifierFactory += 1  //static func don't need Card reference.
        return identifierFactory
        
    }
    
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
    
}

