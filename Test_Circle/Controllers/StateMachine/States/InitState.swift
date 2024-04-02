//
//  InitState.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 27.03.2024.
//

import Foundation

class SuperState: StateProtocol {
    var obstacleDataController: ObstacleDataController
    var circleDataController: CircleDataController
    var worldManager : WorldManager
    var presenter: Presenter
    var callback: ((StateProtocol) -> Void)? = nil
    
    init(obstacleDataController: ObstacleDataController, circleDataController: CircleDataController,worldManager : WorldManager, presenter: Presenter, callback: @escaping (StateProtocol) -> Void) {
        self.obstacleDataController = obstacleDataController
        self.circleDataController = circleDataController
        self.worldManager = worldManager
        self.presenter = presenter
        self.callback = callback
    }
    
    func enter() {
        
    }
    
    func update() {
        
    }
    
    func exit() {
        
    }
    
}

class InitState: SuperState {
    var counter = 0
    //var serviseLocator : ServiseLocator
    //var callback: ((StateProtocol) -> Void)? = nil
    
    override init(obstacleDataController: ObstacleDataController, circleDataController: CircleDataController,worldManager : WorldManager, presenter: Presenter,callback: @escaping (StateProtocol) -> Void) {
        super.init(obstacleDataController: obstacleDataController, circleDataController: circleDataController,worldManager : worldManager, presenter: presenter, callback: callback)
    }
    
    override func enter() {
        
        print("INIT STATE ENTER \n")
        
        createPlayer()
        createObstacles()
        createObstaclesViews()
        createPlayerView()
        
        callback?(self)
    }
    
    override func update() {
        //print("INIT STATE UPDATE")
    }
    
    override func exit() {
        print("INIT STATE EXIT")
        //callback = nil
        counter = 0
    }
    
    
    private func createPlayer() {
        circleDataController.createDefaultCircle()
    }
    
    private func createObstacles() {
        obstacleDataController.createDefaultObstacles()
    }
    
    private func createObstaclesViews() {
        presenter.createObstacleView(obstacleDataArray: obstacleDataController.obstacleDataArray)
    }
    
    private func createPlayerView() {
        presenter.createPlayerView(circleData: circleDataController.GetData())
    }
}
