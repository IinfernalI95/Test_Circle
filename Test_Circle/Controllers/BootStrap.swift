//
//  GameController.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 23.03.2024.
//

import UIKit

class BootStrap {
    //var playerData: CircleData = CircleData(radius : 10, position: CGPoint(x: 50, y: 50))
    var config : GameConfig
    //var circleData = CircleData()
    var worldData = WorldTransform()
    var obstacleData = [ObstacleData]()
    
    var worldManager : WorldManager
    var obstacleDataController: ObstacleDataController
    var circleDataController : CircleDataController
   // var serviseLocator: ServiseLocator
    var stateMachine: GameStateMachine
    var presenter: Presenter
    
    //let speed = 3
//    let obstacleCount = 2
//    let maxObstacleColisions = 5
//    let circleRadius  = 28.0
//    let circlePosition = CGPoint(x: 50, y: 50)
    
    
    init() {
//        config = gameConfig(worldMaxDimension: 100, speed: 3, obstacleCount: 2, maxObstacleColisions: 5, circleRadius: 28.0, circlePosition: CGPoint(x: 50, y: 50))
//       
//        let jsonData = try! JSONEncoder().encode(config)
//        let jsonString = String(data: jsonData, encoding: .utf8)!
//        print(jsonString)
        self.config = GameConfig()
        self.worldManager = WorldManager(worldData: worldData, config: config)
        self.obstacleDataController = ObstacleDataController(obstacleDataArray: obstacleData, maxColisions: config.maxObstacleColisions, worldManager: worldManager)
        self.circleDataController = CircleDataController( config: config)
        self.presenter = Presenter(worldManager : worldManager)
        
       
        stateMachine = GameStateMachine(obstacleDataController: obstacleDataController, circleDataController: circleDataController,worldManager : worldManager, presenter: presenter)
    }
    
    func run() {
        stateMachine.run()
    }
}
