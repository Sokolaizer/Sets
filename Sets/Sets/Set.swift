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
    
    var score = 0
    
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
            if isSet(at: selectedCards)  {
                score += 1
                 for index in cardsInGame.indices{
                    if cardsInGame[index] != nil {
                        if cardsInGame[index]!.isSelected {
                            cardsInGame[index] = nil
                        }
                    }
                }
                addThreeCards()
            }
            for index in cardsInGame.indices {
                if cardsInGame[index] != nil {
                    cardsInGame[index]!.isSelected = false
                }
            }
            selectedCards.removeAll()
        }
    }

    mutating func addThreeCards() {
        if !cardDeck.isEmpty {
            var counter = 3
            for  index in cardsInGame.indices {
                if counter > 0 && cardsInGame[index] == nil {
                    cardsInGame.insert(cardDeck.removeFirst(), at: index)
                    counter -= 1
                }
            }
        }
    }
    
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
        return true
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
