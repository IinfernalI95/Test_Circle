//
//  CircleView.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 22.03.2024.
//
import UIKit

class CircleView: UIImageView {
    var circleData: CircleData
    var rect: CGRect
    var oldPos: CGFloat = 0
    var rotate: CGFloat = 0
    
    init(circleData: CircleData) {
        self.circleData = circleData
        
        rect = circleData.rect
        super.init(frame: .zero)
        self.image = UIImage(named: "fantasticCircle")

        backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func SetRotation(rotation : CGFloat) {
        self.rotate = rotation
    }
    
    func updateCercleView(tick: CGFloat, r : CGFloat) {
        
        let radius =  4 * (CGFloat.pi * (( r / 100) * rect.width ))
        
        oldPos = tick
        rotate = 360.0 / (radius / abs(tick))
        print(" Tick \(r) d \(rect.width) ")
        print(" ROTATE - \(rotate) \(rect.width) ")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let path = UIBezierPath(ovalIn: bounds)
        path.addClip()
        path.fill()
        
        if let image = image {
            let imageRect = bounds.insetBy(dx: 0, dy: 0)
            image.draw(in: imageRect)
        }
    }
}
