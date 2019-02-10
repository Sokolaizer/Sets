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
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            if game.cardsInGame[cardNumber].isSelected {
                sender.layer.borderWidth = 3.0
                sender.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 0.8705586473)
            } else {
                sender.layer.borderWidth = 0.5
                sender.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
        }
        
    }
    
    @IBOutlet var cardButtons: [UIButton]!{
        didSet {
            for index in cardButtons.indices {
                    cardButtons[index].layer.cornerRadius = 8.0
                }
        }
    }

    

    
}

