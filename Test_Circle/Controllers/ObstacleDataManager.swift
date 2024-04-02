//
//  ObstacleDataServise.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 27.03.2024.
//

import Foundation

class ObstacleDataManager {
    
    var maxColisions : Int
    var obstacleDataArray : [ObstacleData] = []
    var curColisions : Int
    
    private let worldManager : WorldManager
    
    init(obstacleDataArray: [ObstacleData], maxColisions: Int, worldManager: WorldManager ) {
        self.obstacleDataArray = obstacleDataArray
        self.worldManager = worldManager
        self.maxColisions = maxColisions
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
    
    func moveObstacles(gameTick : CGFloat) {
        let turn = gameTick.truncatingRemainder(dividingBy: worldManager.getFieldSize().width)
        let step = worldManager.getFieldSize().width - turn
        
        obstacleDataArray.forEach {
            let oldPos = $0.rect.origin.x
            $0.addToPositionX(step: step)

            if $0.rect.origin.x > oldPos {
                $0.haveColision = false
            }
        }
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
