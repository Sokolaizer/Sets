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
    
    var cardsInGame: [Card?] = []
    
    mutating func chooseCard (at index: Int) {
        if selectedCards.count < 3 {
            if cardsInGame[index] != nil {
            cardsInGame[index]!.isSelected = !(cardsInGame[index]!.isSelected)
                if cardsInGame[index]!.isSelected {
            selectedCards.append(cardsInGame[index]!)
                } else {
                    selectedCards = selectedCards.filter{!$0.isSelected}
                }
            }
        } else {
            if isSet(at: selectedCards) {
                // do something
            }
            for index in cardsInGame.indices {
                if cardsInGame[index] != nil {
                cardsInGame[index]!.isSelected = false
                }
            }
            
            selectedCards.removeAll()
        }
        
    }
    // TODO
//    mutating func addThreeCards(from master : [Card], to slave : [Card?]) {
//        for index in slave.indices {
//            if slave[index] == nil {
//                slave.append(master.removeFirst())
//
//            }
//        }
//    }
    
    func isSet (at cards: [Card]) -> Bool {
        var result = true
            for i in cards[0].value.indices {
                if result {
                result = cards[0].value[i] != cards[1].value[i] &&
                    cards[1].value[i] != cards[2].value[i] &&
                    cards[0].value[i] != cards[2].value[i]
                }
            }
        if cards[0].value == cards[1].value &&
            cards[0].value == cards[2].value {
            result = true
        }
        return result
    }

        
    
    init() {
        cardDeck = CardDeck.create()
        
        for index in 0..<12 {
            cardsInGame.append(cardDeck.remove(at: index))
    }
        for _ in 12..<24 {
            cardsInGame.append(nil)
        }
}
}
