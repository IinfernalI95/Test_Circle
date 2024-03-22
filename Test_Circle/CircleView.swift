//
//  CircleView.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 22.03.2024.
//
import UIKit

class CircleView: UIView {
    
    let imageView = UIImageView()
    let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
    var circleRadius: CGFloat
    
    init(frame: CGRect, circleRadius: CGFloat) {
        self.circleRadius = circleRadius
        super.init(frame: frame)
        setupCircle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.circleRadius = 0
        super.init(coder: aDecoder)
        setupCircle()
    }
    
    private func setupCircle() {
        imageView.frame = bounds
        imageView.frame = CGRect(x: bounds.midX - circleRadius, y: bounds.midY - circleRadius, width: circleRadius * 2, height: circleRadius * 2)
        imageView.layer.cornerRadius = circleRadius
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "circle2") // Замените "yourImageName" на имя вашей картинки
        //imageView.layer.cornerRadius = 75
        addSubview(imageView)
        
        rotationAnimation.toValue = NSNumber(value: Double.pi * 2.0)
        rotationAnimation.duration = 2
        rotationAnimation.isCumulative = true
        rotationAnimation.repeatCount = Float.infinity
        rotationAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        imageView.layer.add(rotationAnimation, forKey: "rotationAnimation")
    }
    
    // Увеличивает радиус круга
    func increaseRadius(by value: CGFloat) {
        circleRadius += value
        updateCircle()
    }
    
    // Уменьшает радиус круга
    func decreaseRadius(by value: CGFloat) {
        circleRadius -= value
        updateCircle()
    }
    
    private func updateCircle() {
        // Обновляем радиус изображения
        imageView.frame = CGRect(x: bounds.midX - circleRadius, y: bounds.midY - circleRadius, width: circleRadius * 2, height: circleRadius * 2)
        imageView.layer.cornerRadius = circleRadius
    }
}

