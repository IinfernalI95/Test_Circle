//
//  ObstacleDataServise.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 27.03.2024.
//

import Foundation

class ObstacleDataServise {
    let maxColisions = 5
    
    var obstacleDataArray: [ObstacleData] = []
    var curColisions = 0
    
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
