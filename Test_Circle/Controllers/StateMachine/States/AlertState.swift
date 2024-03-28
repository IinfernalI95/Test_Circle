//
//  AlertState.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 27.03.2024.
//

import Foundation

class AlertState: StateProtocol {
    var serviseLocator: ServiseLocator
    var callback: ((StateProtocol) -> Void)? = nil
    
    init(serviseLocator: ServiseLocator, callback: (@escaping (StateProtocol) -> Void)) {
        self.serviseLocator = serviseLocator
        self.callback = callback
    }
    
    func enter() {
        print("AlertState STATE ENTER \n")
        serviseLocator.presenter.activateAlert()
    }
    
    func update() {
        //print("AlertState STATE UPDATE")
        if serviseLocator.presenter.checkForResetGame() {
            callback?(self)
        }
    }
    
    func exit() {
        print("AlertState STATE EXIT")
    }
}
