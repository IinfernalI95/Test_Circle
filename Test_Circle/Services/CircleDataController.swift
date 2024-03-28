//
//  CircleDataServise.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 27.03.2024.
//

import Foundation

class CircleDataController {
   
    func udateRadiusBy(userClickData: Int, circleData: CircleData) {
        //guard let circleData = self.circleData else { return }
        
        var radius = Double(userClickData) + circleData.defaultRadius
        circleData.updateSize(radius: radius, position: circleData.getCenterPosition())
    }
}
