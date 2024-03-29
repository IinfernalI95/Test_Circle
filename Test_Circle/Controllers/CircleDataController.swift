//
//  CircleDataServise.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 27.03.2024.
//

import Foundation

class CircleDataController {
    var config : gameConfig
  private var circleData: CircleData
    
    init( config: gameConfig) {
        self.config = config
        self.circleData = CircleData(defaultRadius: config.circleRadius, position: config.position)
        self.config = config
    }
    
    func GetData() -> CircleData{
        return circleData
    }
    func createDefaultCircle() {
        circleData = CircleData(radius: config.circleRadius, position:  config.position)
    }
    
    func radius() -> Double {
        circleData.radius()
    }
    
    func getCenterPosition() -> CGPoint {
        circleData.getCenterPosition()
    }
    func udateRadiusBy(userClickData: Int) {
        var radius = Double(userClickData) + circleData.defaultRadius
        circleData.updateSize(radius: radius, position: circleData.getCenterPosition())
    }
}
