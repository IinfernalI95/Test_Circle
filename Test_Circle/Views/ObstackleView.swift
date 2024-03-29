//
//  ObstackleView.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 22.03.2024.


import UIKit

class ObstacleView: UIView {
    var id: Int
    var data: ObstacleData
    var rec = CGRect()

    func render(){}
    
    init(id : Int, data : ObstacleData) {
        self.id = id
        self.data = data
        super.init(frame: .zero)
        self.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
