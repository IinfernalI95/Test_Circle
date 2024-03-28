//
//  ScreenUtility.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 22.03.2024.
//

import Foundation

class ScreenUtility {
    var customFieldSize = CGPoint(x: 100, y: 100)
    var screenSize: CGSize
    var shiftX: Double = 0
    var shiftY: Double = 0
    var onePercentXCustomField: Double = 0
    var onePercentYCustomField: Double = 0
    
    init(screenSize: CGSize) {
        self.screenSize = screenSize
        
        if screenSize.height > screenSize.width{
            shiftY = (screenSize.height - screenSize.width) * 0.5
            onePercentXCustomField = screenSize.width / customFieldSize.x
            onePercentYCustomField = screenSize.width / customFieldSize.y
        } else {
            shiftX = (screenSize.width - screenSize.height) * 0.5
            onePercentXCustomField = screenSize.height / customFieldSize.x
            onePercentYCustomField = screenSize.height / customFieldSize.y
        }
        
        print("SIZE SCREEN - h\(screenSize.height) w \(screenSize.width)shiftY \(shiftY) ")
    }
    
    func getPositionFor(percentX: CGFloat, percentY: CGFloat) -> CGPoint {
        var result = getSizeFor(percentX: percentX, percentY: percentY)
        result.x += shiftX
        result.y += shiftY
        return result
    }
    
    func getSizeFor(percentX: CGFloat, percentY: CGFloat) -> CGPoint {
        return CGPoint(x: onePercentXCustomField * percentX,
                       y: onePercentYCustomField * percentY)
    }
}
