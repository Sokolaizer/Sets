//
//  CardDeck.swift
//  Sets
//
//  Created by Роман Козлов on 10.02.2019.
//  Copyright © 2019 Роман Козлов. All rights reserved.
//


struct CardDeck {
    static func create() -> [Card]{
        var cardDeck : [Card] = []
        for color in  Card.Options.allCases {
            for shape in Card.Options.allCases {
                for rank in Card.Options.allCases {
                    for visualization in Card.Options.allCases {
                        cardDeck.append(Card(color: color,
                                             shape: shape,
                                             visualization: visualization,
                                             rank: rank))
                    }
                }
            }
        }
        return cardDeck.shuffled()
    }
}
