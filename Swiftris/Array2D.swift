//
//  Array2D.swift
//  Swiftris
//
//  Created by Richard Walters on 08/01/2022.
//

import Foundation

class Array2D<T> {
    
    let columns: Int
    let rows: Int
    
    var array: Array<T?>
    
    init(columns: Int, rows: Int) {
        
        self.columns = columns
        
        self.rows = rows
        
        array = Array<T?>(unsafeUninitializedCapacity:rows * columns, initializingWith: {buffer,initializedCount in })
    }
    
    subscript(column: Int, row: Int) -> T? {
        
        get {
            
            return array[(row * columns) + column]
        }
        
        set(newValue) {
            
            array[(row * columns) + column] = newValue
        }
    }
}
