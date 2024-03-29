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
    //var image: UIImage?
    
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
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let path = UIBezierPath(ovalIn: bounds)
        path.addClip()
        path.fill()
        //UIColor.blue.setFill()
        
        if let image = image {
            let imageRect = bounds.insetBy(dx: 0, dy: 0)
            image.draw(in: imageRect)
        }
    }
}
