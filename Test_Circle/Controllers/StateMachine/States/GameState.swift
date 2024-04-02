//
//  GameState.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 27.03.2024.
//

import Foundation
import UIKit

class GameState: SuperState {
    
    let feedbackGenerator = UINotificationFeedbackGenerator()
    var counter = 0
    
    override init(obstacleDataController: ObstacleDataController, circleDataController: CircleDataController,worldManager : WorldManager, presenter: Presenter,callback: @escaping (StateProtocol) -> Void) {
        super.init(obstacleDataController: obstacleDataController, circleDataController: circleDataController,worldManager: worldManager, presenter: presenter, callback: callback)
        
        feedbackGenerator.prepare()
    }
    
    override func enter() {
        print("GameState STATE ENTER \n")
        //print("Obstacles Count - \(obstacleDataController.obstacleDataArray.count)")
    }
    
    override func update() {
        //print("Game STATE UPDATE")
        updateWorldTimeStep()
        input()
        updateRadius()
        moveObstacles()
        checkColisions()
        updateObstacleView()
        updateCircleView()
        updateBackGround()
        if checkColisionReached() {
            callback?(self)
        }
    }
    
    override func exit() {
        print("GameState STATE EXIT")
        counter = 0
    }
    
    private func moveObstacles() {
        obstacleDataController.moveObstacles(gameTick: worldManager.GetGameTick())
    }
    
    func updateWorldTimeStep() {
        worldManager.makeTickGameStep()
    }
    
    func input() {
    }
    
    func updateRadius() {
        circleDataController.udateRadiusBy(userClickData: presenter.clickUserData)
    }
    
    func checkColisionReached() -> Bool {
        return obstacleDataController.isColisionsReach()
    }
        
    func checkColisions() {
        for obstacle in obstacleDataController.obstacleDataArray {
            if  obstacle.haveColision {
                continue
            }
            
            var points = obstacle.getPoints()
            for point in  points {
                let distance = distance(a: point, b: circleDataController.getCenterPosition())
                if  distance < circleDataController.radius() {
                    obstacleDataController.catchColision(obstacle: obstacle)
                    presenter.updateHealth()
                    feedbackGenerator.notificationOccurred(.success)
                }
            }
        }
    }
    
    func updateObstacleView()  {
        presenter.updateObstacleView()
    }
    
    func updateCircleView() {
        presenter.updateCercleView()
    }
    
    func updateBackGround() {
        presenter.updateBackGround()
    }
    
    func distance(a: CGVector, b: CGVector) -> CGFloat {
        let num1 = a.dx - b.dx
        let num2 = a.dy - b.dy
        return sqrt(num1 * num1 + num2 *  num2)
    }
    
    func distance(a: CGPoint, b: CGPoint) -> CGFloat {
        let num1 = a.x - b.x
        let num2 = a.y - b.y
        return sqrt(num1 * num1 + num2 *  num2)
    }
}
