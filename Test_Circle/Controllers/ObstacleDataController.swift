//
//  ObstacleDataServise.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 27.03.2024.
//

import Foundation

class ObstacleDataController {
    
    var config =  gameConfig()
    var maxColisions : Int
    
    var obstacleDataArray : [ObstacleData] = []
    var curColisions : Int
    
    init(obstacleDataArray : [ObstacleData], config: gameConfig ) {
        self.obstacleDataArray = obstacleDataArray
        self.config = config
        maxColisions = config.maxObstacleColisions
        curColisions = 0
    }
    
    func createDefaultObstacles() {
        obstacleDataArray.removeAll()
        obstacleDataArray.append(ObstacleData(id: 2, rect: CGRect(x: 100, y: 20, width: 12, height: 3)))
        obstacleDataArray.append(ObstacleData(id: 2, rect: CGRect(x: 100, y: 78, width: 8, height: 3)))
        
        setmaxColisions(maxColision: 5)
    }
    
   private func setmaxColisions(maxColision: Int) {
        self.maxColisions = maxColision
    }
    
    func catchColision(obstacle: ObstacleData) {
        obstacle.haveColision = true
        curColisions += 1
        print("colision with \(obstacle.id) cur: \(curColisions) max:\(maxColisions)")
    }
    
    func isColisionsReach() -> Bool {
        return curColisions >= maxColisions
    }
    
    func resetObstacleData() {
        curColisions = 0
        
        obstacleDataArray.forEach {
            $0.rect = CGRect(x: 100, y: $0.rect.origin.y, width: $0.rect.width, height: $0.rect.height)
            $0.haveColision = false
        }
    }
}
