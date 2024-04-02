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
    
    func SetPosition(position : CGFloat){
        self.position = position
    }
}

class BGLayers {
    var layers01: [BGLayer_01] = [BGLayer_01(),BGLayer_01()]
    var layers02: [BGLayer_02] = []
    var layers03: [BGLayer_03] = []
    var layers04: [BGLayer_04] = []
    
    func updateLayers(tick: CGFloat) {
        
    }
}

class BGLayer_01: UIImageView {
    
    var size = CGSize()
    var ratio = 0.0
    var position = 0.0
    
    init() {
        super.init(frame: .zero)
        guard let img = UIImage(named: "Layer_1") else {return}
        self.image = img
        self.size = img.size
        self.ratio = img.size.height / img.size.width
        print("BG \(img.size.height) : \(img.size.width)")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func SetPosition(position : CGFloat) {
        self.position = position
    }
}

class BGLayer_02: UIImageView {
    
    var size = CGSize()
    var ratio = 0.0
    var position = 0.0
    
    init() {
        super.init(frame: .zero)
        guard let img = UIImage(named: "Layer_2") else {return}
        self.image = img
        self.size = img.size
        self.ratio = img.size.height / img.size.width
        print("BG \(img.size.height) : \(img.size.width)")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func SetPosition(position : CGFloat) {
        self.position = position
    }
}

class BGLayer_03: UIImageView {
    
    var size = CGSize()
    var ratio = 0.0
    var position = 0.0
    
    init() {
        super.init(frame: .zero)
        guard let img = UIImage(named: "Layer_3") else {return}
        self.image = img
        self.size = img.size
        self.ratio = img.size.height / img.size.width
        print("BG \(img.size.height) : \(img.size.width)")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func SetPosition(position : CGFloat) {
        self.position = position
    }
}

class BGLayer_04: UIImageView {
    
    var size = CGSize()
    var ratio = 0.0
    var position = 0.0
    
    init() {
        super.init(frame: .zero)
        guard let img = UIImage(named: "Layer_4") else {return}
        self.image = img
        self.size = img.size
        self.ratio = img.size.width / img.size.height
        print("BG \(img.size.height) : \(img.size.width)")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func SetPosition(position : CGFloat){
        self.position = position
    }
}
