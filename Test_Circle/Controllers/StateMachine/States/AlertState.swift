//
//  AlertState.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 27.03.2024.
//

import Foundation

class AlertState: SuperState {
    
    override init(obstacleDataController: ObstacleDataController, circleDataController: CircleDataController,worldManager : WorldManager, presenter: Presenter,callback: @escaping (StateProtocol) -> Void) {
        super.init(obstacleDataController: obstacleDataController, circleDataController: circleDataController,worldManager : worldManager, presenter: presenter, callback: callback)
    }
    
    override func enter() {
        print("AlertState STATE ENTER \n")
        presenter.activateAlert()
    }
    
    override func update() {
        if presenter.checkForResetGame() {
            callback?(self)
        }
    }
    
    override func exit() {
        print("AlertState STATE EXIT")
    }
}
