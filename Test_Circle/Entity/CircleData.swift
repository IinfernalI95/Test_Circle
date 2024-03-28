//
//  CercleData.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 23.03.2024.
//

import Foundation

class CircleData {
    
    var minRadius: Double = 5
    var maxRadius: Double = 30
    var defaultRadius: Double
    var rect = CGRect()
    var rotationAngle: CGFloat = 0.0
    
    init(radius: Double, position: CGPoint) {
        defaultRadius = radius
        updateSize(radius: radius, position: position)
    }
    
    func updateSize(radius: Double, position: CGPoint) {
        rect = CGRect(x: position.x - radius , y: position.y - radius , width: radius * 2, height: radius * 2)
    }
    
    func position() -> CGPoint {
        return CGPoint(x: rect.origin.x, y: rect.origin.y) }
    
    func radius() -> Double {
        return self.rect.width * 0.5}
    
    func getCenterPosition() -> CGPoint {
        let radius = radius()
        return CGPoint(x: position().x + radius, y: position().y + radius )
    }
    
    func updateRotationAngle(angle: CGFloat) {
        self.rotationAngle = angle
    }
}
