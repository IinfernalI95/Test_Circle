//
//  BgView.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 29.03.2024.
//

import UIKit

class BgView: UIImageView {
    
    //var image = UIImage()
    var size = CGSize()
    var ratio = 0.0
    
    init() {
        super.init(frame: .zero)
        //backgroundColor = .clear
        guard let img = UIImage(named: "bg01") else {return}
        self.image = img
        self.size = img.size
        self.ratio = img.size.height / img.size.width
        print("BG \(img.size.height) : \(img.size.width)")
        
//        super.init(frame: .zero)
//        backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class BgView01: UIImageView {
    
    //var image = UIImage()
    var size = CGSize()
    var ratio = 0.0
    
    init() {
        super.init(frame: .zero)
        //backgroundColor = .clear
        guard let img = UIImage(named: "fantasticCircle") else {return}
        self.image = img
        self.size = img.size
        self.ratio = img.size.height / img.size.width
        print("BG \(img.size.height) : \(img.size.width)")
        
//        super.init(frame: .zero)
//        backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
