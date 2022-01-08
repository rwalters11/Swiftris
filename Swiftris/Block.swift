//
//  Block.swift
//  Swiftris
//
//  Created by Richard Walters on 08/01/2022.
//

import Foundation
import SpriteKit

let NumberOfColors: UInt32 = 6

enum BlockColor: Int, CustomStringConvertible {
    
    var description: String {
        
        return self.spriteName
    }
    
    
    case Blue = 0, Orange, Purple, Red, Teal, Yellow
    
    var spriteName: String {
        switch self {
        case .Blue:
            return "blue"
        case .Orange:
          return "orange"
        case .Purple:
          return "purple"
        case .Red:
            return "red"
        case .Teal:
          return "teal"
        case .Yellow:
            return "yellow"
        }
    }
    
    static func random() -> BlockColor {
        
        return BlockColor(rawValue: Int(arc4random_uniform(NumberOfColors)))!
    }
}

class Block: Hashable, CustomStringConvertible {
    
    // Constants
    
    let color: BlockColor
    
    // Properties
    
    var column: Int
    
    var row: Int
    
    var sprite: SKSpriteNode?
    
    var spriteName: String {
        
        return color.spriteName
    }
    
    // Hashable value calc pre Swift 4.1
    //var hashValue: Int {
        
        //return self.column ^ self.row
    //}
    
    // Hashable value calc since Swift 4.2
    func hash(into hasher: inout Hasher) {
        hasher.combine(column)
        hasher.combine(row)
    }
    
    var description: String {
        
        return "\(color): [\(column), \(row)]"
    }
    
    init(column:Int, row:Int, color:BlockColor) {
        
        self.column = column
        
        self.row = row
        
        self.color = color
    }
    
    static func ==(lhs: Block, rhs: Block) -> Bool {
        
        return lhs.column == rhs.column && lhs.row == rhs.row && lhs.color.rawValue == rhs.color.rawValue
    }
}
