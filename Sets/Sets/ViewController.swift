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
                button.isHidden = false
                if card != nil {
                    cardButtons[index].setAttributedTitle(drawCard(card!), for: .normal)
                }
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
    
    func drawCard(_ card: Card) -> NSAttributedString {
        
        let character: String
        let color: UIColor
        let lineType: Double
        let alpha: CGFloat
        let string: String
        
        switch card.shape {
        case .v1:
            character = "▲"
        case .v2:
            character =  "■"
        case .v3:
            character =  "●"
        }
        
        switch card.visualization {
        case .v1:
            lineType = -9.0
            alpha = 1.0
        case .v2:
            lineType = -9.0
            alpha = 0.40
        case .v3:
            lineType = 9.0
            alpha = 1.0
        }
        
        switch card.color {
        case .v1:
            color = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        case .v2:
            color = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        case .v3:
            color = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        }
        
        switch card.rank {
        case .v1:
            string = character
        case .v2:
            string = character + character
        case .v3:
            string = character + character + character
        }
        
        let attribute: [NSAttributedString.Key: Any] = [
            .foregroundColor: color.withAlphaComponent(alpha),
            .strokeWidth: lineType,
            .strokeColor: color.withAlphaComponent(alpha)
        ]
        return NSAttributedString(string: string, attributes: attribute)
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    @IBAction func deal(_ sender: UIButton) {
        if !game.cardDeck.isEmpty {
            if cardButtons.count > game.cardsInGame.filter({$0 != nil}).count {
                game.addThreeCards()
                updateViewFromModel()
            }
        }
    }
    
    @IBOutlet weak var score: UILabel! {
        didSet {
            updateScore()
        }
    }
    func updateScore() {
        score.text = "Score: \(game.score)"
    }
    
    @IBOutlet var cardButtons: [UIButton]!{
        didSet {
            for index in cardButtons.indices {
                cardButtons[index].layer.cornerRadius = 8.0
                if game.cardsInGame[index] != nil {
                    cardButtons[index].setAttributedTitle(drawCard(game.cardsInGame[index]!), for: .normal)
                }
            }
            updateViewFromModel()
        }
    }
}

