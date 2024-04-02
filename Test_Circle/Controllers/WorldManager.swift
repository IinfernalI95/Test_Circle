//
//  WorldManager.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 31.03.2024.
//

import Foundation

class WorldManager {
    
    private var worldData: WorldTransform
    private var config: GameConfig
    
    init(worldData: WorldTransform, config: GameConfig) {
        self.worldData = worldData
        self.config = config
        self.worldData.taransform = CGSize(width: config.worldMaxDimension, height: config.worldMaxDimension)
    }
        
    func getFieldSize() -> CGSize {
        return self.worldData.taransform
    }
    
    func GetGameTick() -> CGFloat {
        return self.worldData.gameTick
    }
    
    func makeTickGameStep() {
        self.worldData.gameTick += config.gameSpeed
    }
}
