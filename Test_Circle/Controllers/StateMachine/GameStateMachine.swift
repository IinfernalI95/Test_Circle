//
//  GameStateMachine.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 22.03.2024.
//

import UIKit

protocol StateProtocol {
    func enter()
    func update()
    func exit()
}

class GameStateMachine {
    
    var callback: ((StateProtocol) -> Void)?
    var presenter: Presenter
    var serviseLocator: ServiseLocator?

    var initState: InitState?
    var gameState: GameState?
    var alertState: AlertState?
    var resetState: ResetState?
    
    var currentState: StateProtocol?

    var timer: Timer?
    
    var displayLink: CADisplayLink?
    var previousTimestamp: CFTimeInterval = 0
    
    init(serviseLocator: ServiseLocator, presenter: Presenter) {
        callback = nil
                
        self.serviseLocator = serviseLocator
        self.presenter = presenter
        
        callback = callbackHandler
        
        guard let callback = self.callback else { return }
        initState = InitState(serviseLocator: serviseLocator, callback: callback)
        gameState = GameState(serviseLocator: serviseLocator, callback: callback)
        alertState = AlertState(serviseLocator: serviseLocator, callback: callback)
        resetState = ResetState(serviseLocator: serviseLocator, callback: callback)
    }
    
    func stateComplete(state: any StateProtocol) {
        print(state)
    }
    
    func run() {
        changeState(state: initState)
        timer = Timer.scheduledTimer(withTimeInterval: 0.002, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.currentState?.update()
        }
    }
    
    func callbackHandler(state: StateProtocol) {
        print("callbackHandler получено для класса \(state)")
        
        if state is InitState {
            changeState(state: gameState)
        }
        else if state is GameState {
            changeState(state: alertState)
        }
        else if state is AlertState {
            changeState(state: resetState)
        }
        else if state is ResetState {
            changeState(state: gameState)
        }
        else {
            print("done")
            changeState(state: nil )
        }
    }
    
    func changeState(state: StateProtocol?) {
        if currentState != nil {
            currentState?.exit()
        }
        currentState = state
        currentState?.enter()
    }
}
