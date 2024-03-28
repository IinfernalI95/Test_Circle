//
//  GameData.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 23.03.2024.
//

import Foundation
import UIKit

class ServiseLocator {
    
    var obstacleDataService: ObstacleDataServise
    var circleDataController = CircleDataController()
    var circleData: CircleData?
    var presenter: Presenter
    
    init(obstacleDataArray: ObstacleDataServise, presenter: Presenter) {
        self.obstacleDataService = obstacleDataArray
        self.presenter = presenter
    }
    
    func updateRadius() {
        guard let circleData = self.circleData else { return }
        circleDataController.udateRadiusBy(userClickData: presenter.clickUserData, circleData : circleData)
    }
    
    func resetGame() {
        obstacleDataService.resetObstacleData()
        presenter.resetFields()
    }
}

class Model{
    
}
