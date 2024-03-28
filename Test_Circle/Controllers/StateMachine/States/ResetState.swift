//
//  ResetState.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 27.03.2024.
//

import Foundation

class ResetState: StateProtocol {
    var serviseLocator: ServiseLocator
    var callback: ((StateProtocol) -> Void)? = nil
    
    init(serviseLocator: ServiseLocator, callback: (@escaping (StateProtocol) -> Void)) {
        self.serviseLocator = serviseLocator
        self.callback = callback
    }
    
    func enter() {
        print("ResetState STATE ENTER \n")
        serviseLocator.resetGame()
        callback?(self)
    }
    
    func update() {
        print("Reset STATE UPDATE")
    }
    
    func exit() {
        print("ResetState STATE EXIT \n")
    }
}
