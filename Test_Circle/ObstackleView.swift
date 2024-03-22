//
//  ObstackleView.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 22.03.2024.
//

import UIKit

class ObstacleView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.black.withAlphaComponent(0.6) // Черный цвет с неполной прозрачностью
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

import UIKit

class ObstacleManager {
    
    var obstacles = [ObstacleView]() // Массив для хранения полосок препятствий
    var obstacleTimer: Timer?
    let obstacleHeight: CGFloat = 10 // Высота полоски препятствия
    let obstacleWidth: CGFloat = 100 // Ширина полоски препятствия
    
    var minYPosition: CGFloat = 0
    var maxYPosition: CGFloat = 0
    var parentView: UIView
    
    init(parentView: UIView) {
        self.parentView = parentView
    }
    
    func startGeneratingObstacles() {
        obstacleTimer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.addObstacle()
        }
    }
    
    @objc private func addObstacle() {
        let randomY = CGFloat.random(in: minYPosition...maxYPosition)
        let obstacle = ObstacleView(frame: CGRect(x: parentView.frame.width, y: randomY, width: obstacleWidth, height: obstacleHeight))
        parentView.addSubview(obstacle)
        obstacles.append(obstacle)
        
        UIView.animate(withDuration: 1.5, delay: 0, options: [.curveLinear], animations: {
            obstacle.frame.origin.x = 0 - self.obstacleWidth
        }, completion: { _ in
            obstacle.removeFromSuperview()
            if let index = self.obstacles.firstIndex(of: obstacle) {
                self.obstacles.remove(at: index)
            }
        })
    }
}

