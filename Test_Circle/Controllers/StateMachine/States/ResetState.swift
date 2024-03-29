//
//  ResetState.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 27.03.2024.
//

import Foundation

class ResetState: SuperState {
    
    override init(obstacleDataController: ObstacleDataController, circleDataController: CircleDataController, presenter: Presenter,callback: @escaping (StateProtocol) -> Void) {
        super.init(obstacleDataController: obstacleDataController, circleDataController: circleDataController, presenter: presenter, callback: callback)
    }
    
    override func enter() {
        print("ResetState STATE ENTER \n")
        
        obstacleDataController.resetObstacleData()
        presenter.resetFields()
        
        callback?(self)
    }
    
    override func update() {
        print("Reset STATE UPDATE")
    }
    
    override func exit() {
        print("ResetState STATE EXIT \n")
    }
}
