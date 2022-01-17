//
//  File.swift
//  Patterns-Composite
//
//  Created by Ruslan on 17.01.2022.
//

import Foundation

class File: Composite {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func showContent() -> Any {
        name
    }
    
    func addComponent(_ component: Composite) {
        print("Cannot add a folder!")
    }
    
    func countContent() -> Int {
        1
    }
}
