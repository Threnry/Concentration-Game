//
//  ViewController.swift
//  Concentration
//
//  Created by user145418 on 8/30/18.
//  Copyright © 2018 user145418. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    
private lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2) //1 allows me to round up
    //var flipCount = 0{
        //didSet{
           //flipCountlabel.text = "Flips: \(flipCount)"
       // }
   // }
    
    

    @IBOutlet weak var flipCountlabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet var gamePoineLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        if let cardNumber = cardButtons.index(of: sender){
            //flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
        print("Card not in buttons")
        }
        
        
        
        
    }
    private func updateViewFromModel() { // uddates model
        
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for : card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
                else {
                button.setTitle("", for: UIControlState.normal)  // if card.isMatached(){
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.3904583077, blue: 0.09353239346, alpha: 0) : #colorLiteral(red: 1, green: 0.6042363617, blue: 0.04589243931, alpha: 1) // colorLiteral(red:1, green:0.576367666, blue:0, alpha:0) else{
                // colorLiteral(red:1, green:0.576367666, blue:0, alpha:1) put #
                
            }
        }
        flipCountlabel.text = ("Flips: \(game.flipCount)")
        gamePoineLabel.text = ("Points: \(game.points)")
        
    }
    
    
    
    
    
   private var gameThemes = [
     ["💀", "🎃", "👻", "🍬", "🤡", "👺", "👿","🤮", "👹","👾","☠️","🤐"],
     
     ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🎱","🏓","🏸","🏏"],
     ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓","🚑", "🚒","🚐","🚚","🚛"],
   ["💟", "☮️", "✝️", "☪️", "🕉", "☸️", "✡️","🔯", "🕎","☯️","🛐","⛎"],
     ["🉑", "☢️", "☣️", "📴", "📳", "🈶", "🈚️","🈸", "✴️","🆚"],
         ["🇧🇧", "🇧🇾", "🇧🇪", "🇧🇿", "🇧🇲", "🇨🇦", "🇨🇻","🇨🇨", "🇰🇲","🇨🇱"]
    ]
    
    
    
    
   
    
    private var emoji = [Int:String]() // dictionary is an optional because it may not have the item in side (set or not set)
    private lazy var emojiChoices: [String] = themes()
    
    func emoji(for card : Card) -> String{
        
        if emoji[card.identifier] == nil, emojiChoices.count > 0{
            if emojiChoices.count > 0{
                let randomIndex = (arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at: Int(randomIndex))
            }
            
        
        }
        return emoji[card.identifier] ?? "?"
    }
    
    
    
    @IBAction func newGameButton(_ sender: UIButton) {
        
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        updateViewFromModel()
        emojiChoices = themes()
        
    
        
    }
    private func themes() -> [String]{
        return gameThemes[Int(arc4random_uniform(UInt32(gameThemes.count)))]
    }
    
} //





///if emoji[card.identifier] != nil{
   //// return emoji[card.identifier]!
    
///}else{
    ///return "?"
////}
