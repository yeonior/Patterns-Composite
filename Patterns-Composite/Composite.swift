//
//  Composite.swift
//  Patterns-Composite
//
//  Created by Ruslan on 17.01.2022.
//

import Foundation

protocol Composite {
    var name: String { get set }
    func showContent() -> Any
    func addComponent(_ component: Composite)
    func countContent() -> Int
}


