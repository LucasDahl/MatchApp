//
//  CardModel.swift
//  Match
//
//  Created by Lucas Dahl on 1/3/18.
//  Copyright © 2018 Lucas Dahl. All rights reserved.
//

import Foundation

class CardModel {
    
    
    func getCards() -> [Card] {
        
        // Declare an array to store numbers we've already generated
        var generatedNumbersArray = [Int]()
        
        // Declare an array to store the generated cards
        var generatedCardsArray = [Card]()
        
        // Randomly generate pairs of cards, and add them to the array. Two card objects because the card has to have a match
        while generatedNumbersArray.count < 8 {
            
            // Get a random card number
            let randomNumber = arc4random_uniform(13) + 1
            
            // Ensure that random number isn't one we already have
            if generatedNumbersArray.contains(Int(randomNumber)) == false {
                // Log the number
                print(randomNumber)
                
                // Store the number into the generatedNumbersArray
                generatedNumbersArray.append(Int(randomNumber))
                
                // Create the first card object
                let cardOne = Card()
                cardOne.imageName = "card\(randomNumber)"
                
                generatedCardsArray.append(cardOne)
                
                // Create the second card object
                let cardTwo = Card()
                cardTwo.imageName = "card\(randomNumber)"
                
                generatedCardsArray.append(cardTwo)
                
            }
            
            
            
            //Make it so we only have unique pairs of cards
            
            
        }
        
        // Randomize the array
        
        for i in 0...generatedCardsArray.count-1 {
            
            // Find a random index ro swap with
            let randomNumber = Int(arc4random_uniform(UInt32(generatedCardsArray.count)))
        
            // Swap the two cards
            let temporaryStorage = generatedCardsArray[i]
            generatedCardsArray[i] = generatedCardsArray[randomNumber]
            generatedCardsArray[randomNumber] = temporaryStorage
        }
        
        // Return the array
        return generatedCardsArray
        
    }
    
    
}


