//
//  ViewController.swift
//  Sets
//
//  Created by Роман Козлов on 09.02.2019.
//  Copyright © 2019 Роман Козлов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var game = Set()
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cardsInGame[index]
            if card != nil {
                if card!.isSelected {
                    button.layer.borderWidth = 3.0
                    button.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 0.8705586473)
                } else {
                    button.layer.borderWidth = 0.5
                    button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                }
            } else {
                button.isHidden = true
            }
        }
    }
    
    func drawCard(_ card: Card) ->NSAttributedString {
        var cardVIew: NSAttributedString
        let character: String
        switch card.shape {
        case .v1:
            character = "▲"
        case .v2:
           character =  "■"
        case .v3:
           character =  "●"
        }
        switch card.rank {
        case .v1:
            character = 
        default:
            <#code#>
        }

    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            
            updateViewFromModel()
        }
        
    }
    
    @IBOutlet var cardButtons: [UIButton]!{
        didSet {
            for index in cardButtons.indices {
                    cardButtons[index].layer.cornerRadius = 8.0
                }
            updateViewFromModel()
        }
    }

    

    
}

