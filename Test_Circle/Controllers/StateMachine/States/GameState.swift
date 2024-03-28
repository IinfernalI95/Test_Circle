//
//  GameState.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 27.03.2024.
//

import Foundation
import UIKit

class GameState: StateProtocol {
    var counter = 0
    var serviseLocator: ServiseLocator
    var callback: ((StateProtocol) -> Void)? = nil
    
    let feedbackGenerator = UINotificationFeedbackGenerator()
    
    //var pos: CGPoint
    
    init(serviseLocator: ServiseLocator, callback: (@escaping (StateProtocol) -> Void)) {
        self.serviseLocator = serviseLocator
        self.callback = callback
        
        feedbackGenerator.prepare()
        //self.pos = serviseLocator.screenUtillity.getPositionFor(percentX: 100, percentY: 50)
    }
    
    func enter() {
        print("GameState STATE ENTER \n")
        print("Obstacles Count -  \(serviseLocator.obstacleDataService.obstacleDataArray.count)")
    }
    
    func update() {
        //print("Game STATE UPDATE")
        input()
        moveObstacles()
        checkColisions()
        updateObstacleView()
        updateCircleView()
        if checkColisionReached() {
            callback?(self)
        }
    }
    
    func exit() {
        print("GameState STATE EXIT")
        counter = 0
    }
    
    private func moveObstacles() {
        serviseLocator.obstacleDataService.obstacleDataArray.forEach {
            $0.move(pos: 0.05)
            
            if $0.rect.origin.x <=  -$0.rect.width {
                $0.rect.origin.x = 100
                $0.haveColision = false
            }
        }
    }
    
    func input() {
        serviseLocator.updateRadius()
    }
    
    func radius() {}
    
    func checkColisionReached() -> Bool {
        return serviseLocator.obstacleDataService.isColisionsReach()
    }
        
    func checkColisions() {
        for obstacle in serviseLocator.obstacleDataService.obstacleDataArray {
            if  obstacle.haveColision {
                continue
            }
            var points = obstacle.getPoints()
            for point in  points {
                guard let circleData = serviseLocator.circleData else { return }
                
                let distance = distance(a: point, b: circleData.getCenterPosition())
                if  distance < circleData.radius() {
                    serviseLocator.obstacleDataService.catchColision(obstacle: obstacle)
                    feedbackGenerator.notificationOccurred(.success)
                }
            }
        }
    }
    
    func updateObstacleView()  {
        serviseLocator.presenter.updateObstacleView()
    }
    
    func updateCircleView() {
        serviseLocator.presenter.updateCercleView()
        
        let newAngle = CGFloat.pi / 2 // Новый угол в радианах (90 градусов)
        serviseLocator.circleData?.updateRotationAngle(angle: newAngle)
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
