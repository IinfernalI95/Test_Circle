//
//  GameController.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 23.03.2024.
//

import UIKit

class BootStrap {
    //var playerData: CircleData = CircleData(radius : 10, position: CGPoint(x: 50, y: 50))
    var obstacleDataServise: ObstacleDataServise
    var serviseLocator: ServiseLocator
    var stateMachine: GameStateMachine
    var presenter: Presenter
    
    init() {
        self.obstacleDataServise = ObstacleDataServise()
        self.presenter = Presenter()
        self.serviseLocator = ServiseLocator(obstacleDataArray: obstacleDataServise,
                                             //playerData: playerData,
                                             presenter : presenter)
       
        stateMachine = GameStateMachine(serviseLocator : serviseLocator,
                                        presenter : presenter )
    }
    
    func run() {
        stateMachine.run()
    }
}
