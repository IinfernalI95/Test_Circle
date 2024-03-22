//
//  ViewController.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 22.03.2024.
//

import UIKit

class StartView: UIViewController {

    lazy var buttonPlus: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPlusClick), for: .touchUpInside)
        
        return button
    }()
    
    lazy var buttonMinus: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonMinusClick), for: .touchUpInside)
        
        return button
    }()
    
    var obstacleTimer: Timer?
    let circleDiameter: CGFloat = 100 // Диаметр круга
    var circleView: CircleView?
    
    var minYTopPosition: CGFloat?
    var maxYTopPosition: CGFloat?
    var minYBottomPosition: CGFloat?
    var maxYBottomPosition: CGFloat?
    
    var obstacleManagerTop: ObstacleManager?
    var obstacleManagerBottom: ObstacleManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        
        setupView()
    }
    
    @objc func buttonPlusClick() {
        circleView?.increaseRadius(by: 10)
    }
    
    @objc func buttonMinusClick() {
        circleView?.decreaseRadius(by: 10)
    }
    
    func setupView() {
        createCircle()
        setupObstacklesPositions()
        createTopObstackle()
        createBottomObstackle()
        setUpButtons()
    }
    
    func createCircle() {
        circleView = CircleView(frame: CGRect(x: view.bounds.midX - circleDiameter/2, y: view.bounds.midY - circleDiameter/2, width: circleDiameter, height: circleDiameter), circleRadius: circleDiameter)
    }
    
    func setupObstacklesPositions() {
        obstacleManagerTop = ObstacleManager(parentView: view)
        obstacleManagerBottom = ObstacleManager(parentView: view)
        guard let obstacleHeight = obstacleManagerTop?.obstacleHeight else { return }
        minYTopPosition = view.frame.minY + 200
        maxYTopPosition = view.center.y - obstacleHeight - circleDiameter
        minYBottomPosition = view.center.y + obstacleHeight + circleDiameter
        maxYBottomPosition = view.frame.height - obstacleHeight * 2 - 200
    }
    
    func createTopObstackle() {
        guard let min = minYTopPosition,
              let max = maxYTopPosition
        else { return }
        
        obstacleManagerTop?.minYPosition = min
        obstacleManagerTop?.maxYPosition = max
        obstacleManagerTop?.startGeneratingObstacles()
    }
    
    func createBottomObstackle() {
        guard let min = minYBottomPosition,
              let max = maxYBottomPosition
        else { return }
    
        obstacleManagerBottom?.minYPosition = min
        obstacleManagerBottom?.maxYPosition = max
        obstacleManagerBottom?.startGeneratingObstacles()
    }
    
    func setUpButtons() {
        guard let circle = circleView else { return }
        [buttonPlus, buttonMinus, circle].forEach {
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            buttonPlus.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -80),
            buttonPlus.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            buttonPlus.heightAnchor.constraint(equalToConstant: 80),
            buttonPlus.widthAnchor.constraint(equalToConstant: 80),
            
            buttonMinus.leftAnchor.constraint(equalTo: view.leftAnchor, constant: +80),
            buttonMinus.centerYAnchor.constraint(equalTo: buttonPlus.centerYAnchor),
            buttonMinus.heightAnchor.constraint(equalTo: buttonPlus.heightAnchor),
            buttonMinus.widthAnchor.constraint(equalTo: buttonPlus.widthAnchor)
        ])
    }
}
