//
//  BgView.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 29.03.2024.
//

import UIKit

class BgView: UIImageView {
    
    var size = CGSize()
    var ratio = 0.0
    var position = 0.0
    init() {
        super.init(frame: .zero)
        guard let img = UIImage(named: "backGround") else {return}
        self.image = img
        self.size = img.size
        self.ratio = img.size.width / img.size.height
        print("BG \(img.size.height) : \(img.size.width)")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func SetPosition(position : CGFloat) {
        self.position = position
    }
}
