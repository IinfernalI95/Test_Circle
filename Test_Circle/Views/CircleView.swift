//
//  CircleView.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 22.03.2024.
//
import UIKit

class CircleView: UIView {
    var circleData: CircleData
    var rect: CGRect?
    var image: UIImage?
    
    init(circleData: CircleData) {
        self.circleData = circleData
        self.image = UIImage(named: "wheel")
        
        rect = circleData.rect
        super.init(frame: .zero)
        backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let path = UIBezierPath(ovalIn: bounds)
        path.addClip()
        path.fill()
        //UIColor.blue.setFill()
        
        if var image = image {
            let imageRect = bounds.insetBy(dx: 0, dy: 0)
            image.draw(in: imageRect)
        }
    }
}
