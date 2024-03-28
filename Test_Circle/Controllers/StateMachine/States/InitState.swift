//
//  InitState.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 27.03.2024.
//

import Foundation

class InitState: StateProtocol {
    var counter = 0
    var serviseLocator: ServiseLocator
    var callback: ((StateProtocol) -> Void)? = nil
    
    init(serviseLocator: ServiseLocator, callback: @escaping (StateProtocol) -> Void) {
        self.serviseLocator = serviseLocator
        self.callback = callback
    }
    
    func enter() {
        print("INIT STATE ENTER \n")
        createPlayer()
        createObstacles()
        createObstaclesViews()
        createPlayerView()
        
        callback?(self)
    }
    
    func update() {
        //print("INIT STATE UPDATE")
    }
    
    func exit() {
        print("INIT STATE EXIT")
        //callback = nil
        counter = 0
    }
    
    private func createPlayer() {
        self.serviseLocator.circleData = CircleData(radius: 28, position: CGPoint(x: 50, y: 50))
    }
    
    private func createObstacles() {
        self.serviseLocator.obstacleDataService.obstacleDataArray.append(ObstacleData(id: 2, rect: CGRect(x: 100, y: 20, width: 12, height: 3)))
        self.serviseLocator.obstacleDataService.obstacleDataArray.append(ObstacleData(id: 2, rect: CGRect(x: 100, y: 78, width: 8, height: 3)))
    }
    
    private func createObstaclesViews() {
        serviseLocator.presenter.createObstacleView(obstacleDataArray: serviseLocator.obstacleDataService.obstacleDataArray)
    }
    private func createPlayerView() {
        guard let playerData = self.serviseLocator.circleData else { return }
        serviseLocator.presenter.createPlayerView(circleData: playerData)
    }
}
