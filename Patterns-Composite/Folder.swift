//
//  Folder.swift
//  Patterns-Composite
//
//  Created by Ruslan on 17.01.2022.
//

import Foundation

class Folder: Composite {
    
    var name: String
    private var contentArray = [Composite]()
    
    init(name: String) {
        self.name = name
    }
    
    func showContent() -> Any {
        contentArray
    }
    
    func addComponent(_ component: Composite) {
        contentArray.append(component)
    }
    
    func countContent() -> Int {
        contentArray.count
    }
}
