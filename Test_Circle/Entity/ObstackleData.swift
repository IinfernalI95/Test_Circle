//
//  ObstackleData.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 22.03.2024.
//

import UIKit

class ObstacleData {
    var id: Int
    var rect: CGRect    
    var haveColision = false
    
    init(id: Int, rect: CGRect) {
        self.id = id
        self.rect = rect
    }
    
    func move(pos: CGFloat) {
        rect.origin.x -= pos
    }
    
    func getPoints() -> [CGPoint] {
        return [CGPoint(x: rect.minX, y: rect.minY),
                CGPoint(x: rect.maxX, y: rect.minY),
                CGPoint(x: rect.minX, y: rect.maxY),
                CGPoint(x: rect.maxX, y: rect.maxY)]
    }
    
    func addColision() {
        haveColision = true
    }
}



