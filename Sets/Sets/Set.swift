//
//  Set.swift
//  Sets
//
//  Created by Роман Козлов on 09.02.2019.
//  Copyright © 2019 Роман Козлов. All rights reserved.
//

import Foundation
struct Set {
    var cardDeck :[Card]
    
    private var selectedCards : [Card] = []
    
    var cardsInGame:[Card] = []
    
    mutating func chooseCard (at index: Int) {
        if selectedCards.count < 3 {
            cardsInGame[index].isSelected = !(cardsInGame[index].isSelected)
            selectedCards.append(cardsInGame[index])
        } else {
            // check selectedCards
            for index in selectedCards.indices {
                selectedCards[index].isSelected = false
                selectedCards = []
            }
            
        }
        
    }
    
    init() {
        cardDeck = CardDeck.create()
        
        for index in 0..<12 {
            cardsInGame.append(cardDeck.remove(at: index))
    }
}
}
