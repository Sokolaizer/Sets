//
//  Card.swift
//  Sets
//
//  Created by Роман Козлов on 09.02.2019.
//  Copyright © 2019 Роман Козлов. All rights reserved.
//

import Foundation
struct Card: Equatable {
    enum Color: CaseIterable {
        case red
        case green
        case violet
    }
    
    enum Shape: CaseIterable {
        case oval
        case wave
        case diamond
    }
    enum Visualization: CaseIterable {
        case fil
        case hatch
        case outline
    }
    enum Rank: CaseIterable {
        case single
        case double
        case triple
    }
    var color: Color
    var shape: Shape
    var visualization: Visualization
    var rank: Rank
    
    var isRemoved = false
    var isSelected = false

    init(color: Color, shape: Shape, visualization: Visualization, rank: Rank) {
        self.color = color
        self.shape = shape
        self.visualization = visualization
        self.rank = rank
    }
}
