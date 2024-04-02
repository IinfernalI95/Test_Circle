//
//  CircleDataServise.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 27.03.2024.
//

import Foundation

class CircleDataController {
    var config : GameConfig
  private var circleData: CircleData
    
    init( config: GameConfig) {
        self.config = config
        circleData = CircleData(radius: config.circleRadius, position:  config.circlePosition)
    }
    
    func GetData() -> CircleData{
        return circleData
    }
    func createDefaultCircle() {
        circleData = CircleData(radius: config.circleRadius, position:  config.circlePosition)
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
