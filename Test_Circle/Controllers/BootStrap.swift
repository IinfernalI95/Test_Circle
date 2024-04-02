//
//  GameController.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 23.03.2024.
//

import UIKit

class BootStrap {
    var config : GameConfig
    var worldData = WorldTransform()
    var obstacleData = [ObstacleData]()
    var worldManager : WorldManager
    var obstacleDataController: ObstacleDataManager
    var circleDataController : CircleDataManager
    var stateMachine: GameStateMachine
    var presenter: Presenter
    
    init() {
        self.config = GameConfig()
        self.worldManager = WorldManager(worldData: worldData, config: config)
        self.obstacleDataController = ObstacleDataManager(obstacleDataArray: obstacleData, maxColisions: config.maxObstacleColisions, worldManager: worldManager)
        self.circleDataController = CircleDataManager( config: config)
        self.presenter = Presenter(worldManager : worldManager)
        
        stateMachine = GameStateMachine(obstacleDataController: obstacleDataController, circleDataController: circleDataController,worldManager : worldManager, presenter: presenter)
    }
    
    func run() {
        stateMachine.run()
    }
}
