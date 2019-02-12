//
//  Card.swift
//  Sets
//
//  Created by Роман Козлов on 09.02.2019.
//  Copyright © 2019 Роман Козлов. All rights reserved.
//

import Foundation
struct Card: Equatable {
    enum Options:Int, CaseIterable {
        case v1 = 1
        case v2 = 2
        case v3 = 3
    }
 
    let color: Options
    let shape: Options
    let visualization: Options
    let rank: Options
    
    var value: [Int] {
    return [color.rawValue, shape.rawValue, visualization.rawValue, rank.rawValue]
    }
    
    var isRemoved = false
    var isSelected = false

    init(color: Options, shape: Options, visualization: Options, rank: Options) {
        self.color = color
        self.shape = shape
        self.visualization = visualization
        self.rank = rank
    }
}
