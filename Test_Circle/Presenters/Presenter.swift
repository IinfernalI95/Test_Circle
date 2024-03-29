//
//  Controller.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 25.03.2024.
//

import Foundation
import UIKit

class Presenter {
    var clickUserData = 0
    let minClickUser = -25
    let maxClickUser = 20
    var circleView: CircleView?
    var obstacleViews: [ObstacleView] = []
    let alertController: UIAlertController?
    var showAlert = false
    var checkReset = false
        
    private var screenUtility: ScreenUtility?
    
    init() {
        alertController = UIAlertController(title: "GAME OVER", message: "", preferredStyle: .alert)
    }
    
    func setScreenUtility(screenUtility: ScreenUtility?) {
        self.screenUtility = screenUtility
    }
    
    func createObstacleView(obstacleDataArray: [ObstacleData]) {
        obstacleDataArray.forEach {
            let view = ObstacleView(id: $0.id, data: $0)
            
            obstacleViews.append(view)
        }
    }
    func createPlayerView(circleData: CircleData) {
        self.circleView = CircleView(circleData: circleData)
    }
    
    func onPlusClick() {
        clickUserData = min(maxClickUser, (clickUserData + 1))
    }
    
    func onMinusClick() {
        clickUserData = max(minClickUser, (clickUserData - 1))
    }
    
    func updateCercleView () {
        guard
            let rectX = self.circleView?.circleData.rect.origin.x,
            let rectY = self.circleView?.circleData.rect.origin.y,
            let rectWidth = self.circleView?.circleData.rect.width,
            let rectHeight = self.circleView?.circleData.rect.height,
            let pos = self.screenUtility?.getPositionFor(
                percentX: rectX,
                percentY: rectY),
            let size = self.screenUtility?.getSizeFor(
                percentX: rectWidth,
                percentY: rectHeight)
        else { return }
        self.circleView?.rect = CGRect(x: pos.x, y: pos.y, width: size.x, height: size.y)
    }
    
    func updateObstacleView () {
        self.obstacleViews.forEach {
            guard
                let pos = self.screenUtility?.getPositionFor(percentX: $0.data.rect.origin.x, percentY: $0.data.rect.origin.y),
                let size = self.screenUtility?.getSizeFor(percentX: $0.data.rect.width, percentY: $0.data.rect.height)
            else { return }
            
            $0.rec = CGRect(x: pos.x,
                            y: pos.y,
                            width: size.x,
                            height: size.y)
        }
    }
    
    func getObstacles() -> [ObstacleView] {
        return obstacleViews
    }
    
    func activateAlert() {
        self.showAlert = true
    }
    
    func checkForResetGame() -> Bool {
        return checkReset
    }
    
    func resetFields() {
        checkReset = false
        showAlert = false
        print(checkReset)
    }
}
