//
//  Controller.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 25.03.2024.
//

import Foundation
import UIKit

class Presenter {
    
    let minClickUser = -25
    let maxClickUser = 20
    let alertController: UIAlertController
    var clickUserData = 0
    var circleView: CircleView?
    var obstacleViews: [ObstacleView] = []
    var backGroundView = BgView()
    var backGroundView2 = BgView()

    var bgLayers = BGLayers()
    var worldManager : WorldManager
    var showAlert = false
    var checkReset = false
    
    private var screenUtility: ScreenUtility
    
    init(worldManager: WorldManager) {
        self.worldManager = worldManager
        alertController = UIAlertController(title: "GAME OVER", message: "", preferredStyle: .alert)
        screenUtility = ScreenUtility(fieldSize: worldManager.getFieldSize())
    }
    
    func setViewBoundsSize(viewSize: CGSize) {
        self.screenUtility.setScreenSize(screenSize: viewSize)
    }
    
    func getPositionFor(percentX: CGFloat, percentY: CGFloat) -> CGPoint {
        return self.screenUtility.getPositionFor(percentX: percentX, percentY: percentY)
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
            let rectHeight = self.circleView?.circleData.rect.height
        else { return }
        
        let pos = self.screenUtility.getPositionFor(
            percentX: rectX,
            percentY: rectY)
        let size = self.screenUtility.getSizeFor(
            percentX: rectWidth,
            percentY: rectHeight)
        
        self.circleView?.rect = CGRect(
            x: pos.x,
            y: pos.y,
            width: size.x,
            height: size.y
        )
        UpdateCercleRotation()
        
    }
    
    func updateBackGround() {
        let position = self.screenUtility.getPositionFor(percentX: worldManager.GetGameTick(), percentY: worldManager.GetGameTick())
        let position2 = position.x - backGroundView2.frame.width
        backGroundView.SetPosition(position: position.x)
        backGroundView2.SetPosition(position: position2)
        
        if backGroundView.position < position.x {
            backGroundView.SetPosition(position: position.x - backGroundView2.frame.width)
        }
    }
    
    func updateObstacleView () {
        self.obstacleViews.forEach {
            let pos = self.screenUtility.getPositionFor(percentX: $0.data.rect.origin.x, percentY: $0.data.rect.origin.y)
            let size = self.screenUtility.getSizeFor(percentX: $0.data.rect.width, percentY: $0.data.rect.height)
            $0.rec = CGRect(
                x: pos.x,
                y: pos.y,
                width: size.x,
                height: size.y
            )
        }
    }
    
    private func UpdateCercleRotation(){
        guard let circleView = self.circleView else { return }
        let r = (screenUtility.screenSize.width / worldManager.getFieldSize().width * circleView.rect.width) * 2
        let perimeter =  2 * CGFloat.pi *  r
        let rotation = 360.0 / (perimeter / worldManager.GetGameTick())
        circleView.SetRotation(rotation: rotation)
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
