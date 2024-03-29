//
//  GameController.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 23.03.2024.
//

import UIKit

class BootStrap {
    //var playerData: CircleData = CircleData(radius : 10, position: CGPoint(x: 50, y: 50))
    var config : gameConfig
    //var circleData = CircleData()
    var obstacleData = [ObstacleData]()
    
    var obstacleDataController: ObstacleDataController
    var circleDataController : CircleDataController
   // var serviseLocator: ServiseLocator
    var stateMachine: GameStateMachine
    var presenter: Presenter
    
    init() {
        config = gameConfig()
        self.obstacleDataController = ObstacleDataController(obstacleDataArray: obstacleData, config: config)
        self.circleDataController = CircleDataController( config: config)
        self.presenter = Presenter()
        //self.serviseLocator = ServiseLocator(obstacleDataArray: obstacleDataController, presenter : presenter)
       
        stateMachine = GameStateMachine(obstacleDataController: obstacleDataController, circleDataController: circleDataController, presenter: presenter)
    }
    
    func run() {
        stateMachine.run()
    }
}
