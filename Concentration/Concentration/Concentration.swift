//
//  Concentration.swift
//  Concentration
//
//  Created by user145418 on 9/5/18.
//  Copyright © 2018 user145418. All rights reserved.
//

import Foundation



class Concentration{  // The game is played in here
    
    public var cards =  [Card]()
    private var indexOfOneAndOnlyFaceUpCard: Int?
    public var flipCount = 0
    public var points = 0
    private var startime = Date()
    private var endTime = Date()
    
   public func chooseCard(at index: Int ){
        flipCount += 1
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                gameTimer()
                
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    points += 2
                              }
                else{
                    pointReduction(card: cards[index])
                    pointReduction(card: cards[matchIndex])
                    cards[index].isFlipped = true
                    cards[matchIndex].isFlipped = true
                }
                cards[index].isFaceUp = true
                
                indexOfOneAndOnlyFaceUpCard = nil
                
                
                
                
            }else{
                // either no cards or 2 cards
                startime = Date()
                for flipDownIndex in cards.indices{
                    
                    cards[flipDownIndex].isFaceUp = false
                    
                    
                }
                 
                
                cards[index].isFaceUp = true
               
                indexOfOneAndOnlyFaceUpCard = index
                
                
            }
            
        }
        
    }
    
        
    
    init(numberOfPairsOfCards: Int){
        
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card, card]  // or just card.append(card)

        }
        // TODO: shuffle the deeck of cards in your homework
        
        //shuffled(deck: cards) or
        cards.shuffleDeck()
        
        }
    
    public func shuffled(deck card: [Card]){
        self.cards = card
        
        for number in 0..<cards.count{
            let shuffle = Int(arc4random_uniform(UInt32(cards.count-number)))
            cards.append(cards.remove(at: shuffle))
        }
    }
    func pointReduction(card: Card){
        
        if(card.isFlipped){
            _ = points -= 1
            
        }
    }
    private func gameTimer(){ //timer for game
        endTime = Date()
        let  timeInterval = endTime.timeIntervalSince(startime)
        switch timeInterval {
        case 0..<0.4:
            points += 2
        case 0.4..<0.5:
            points += 1
        default:
            points += 0
        }
        
    }


}
extension MutableCollection{  // This will shuffle the contents of the collection
    
    public mutating func shuffleDeck(){
        let startCount = count
        guard startCount > 1 else{return}
        for(firstUnshuffled, unShuffledCount) in zip(indices, stride(from: startCount, to: 1, by: -1)){
            let indexDistance: Int = numericCast(arc4random_uniform(numericCast(unShuffledCount)))
            let thisIndex = index(firstUnshuffled, offsetBy: indexDistance)
            swapAt(firstUnshuffled, thisIndex)
        }
    }
    
    
    
    
}



            

            
        //}
        //self = temp//if cards[index].isFaceUp{
    //cards[index].isFaceUp = false
//}else{
    //cards[index].isFaceUp = true
//}


