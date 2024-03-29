//
//  GameState.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 27.03.2024.
//

import Foundation
import UIKit

class GameState: SuperState {
    var counter = 0
    //var serviseLocator: ServiseLocator
    //var callback: ((StateProtocol) -> Void)? = nil
    
    let feedbackGenerator = UINotificationFeedbackGenerator()
    
    //var pos: CGPoint
    
    override init(obstacleDataController: ObstacleDataController, circleDataController: CircleDataController, presenter: Presenter,callback: @escaping (StateProtocol) -> Void) {
        super.init(obstacleDataController: obstacleDataController, circleDataController: circleDataController, presenter: presenter, callback: callback)
        
        feedbackGenerator.prepare()
        //self.pos = serviseLocator.screenUtillity.getPositionFor(percentX: 100, percentY: 50)
    }
    
    override func enter() {
        print("GameState STATE ENTER \n")
        //print("Obstacles Count - \(obstacleDataController.obstacleDataArray.count)")
    }
    
    override func update() {
        //print("Game STATE UPDATE")
        input()
        updateRadius()
        moveObstacles()
        checkColisions()
        updateObstacleView()
        updateCircleView()
        if checkColisionReached() {
            callback?(self)
        }
    }
    
    override func exit() {
        print("GameState STATE EXIT")
        counter = 0
    }
    
    private func moveObstacles() {
        obstacleDataController.obstacleDataArray.forEach {
            $0.move(pos: 0.05)
            
            if $0.rect.origin.x <=  -$0.rect.width {
                $0.rect.origin.x = 100
                $0.haveColision = false
            }
        }
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
               // guard let circleData = serviseLocator.circleData else { return }
                
                let distance = distance(a: point, b: circleDataController.getCenterPosition())
                if  distance < circleDataController.radius() {
                    obstacleDataController.catchColision(obstacle: obstacle)
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
    
    func create() {
        
    }
    
    func render() {
        
    }
}
