//
//  ViewController.swift
//  Test_Circle
//
//  Created by Артур Лебедев on 22.03.2024.
//

import UIKit

class View: UIViewController {
    
    lazy var buttonPlus: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(buttonPlusClick), for: .touchDown)
        
        return button
    }()
    
    lazy var buttonMinus: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(buttonMinusClick), for: .touchDown)
        
        return button
    }()
        
    var presenter: Presenter
    var timer: Timer?
    var alertActive = false
        
    init(presenter: Presenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        presenter.setViewBoundsSize(viewSize: self.view.bounds.size)
        setupView()
        update()
    }
    
    func update() {        
        timer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { [weak self] _ in
            
            guard let self = self
            else { return }
            
            updateCircle()
            updateObstacles()
            updateBackGround()
            
            if presenter.showAlert && !alertActive {
                showAlert()
            }
        }
    }
    
    func updateCircle() {
        guard let circle = presenter.circleView
        else { return }
        
        circle.bounds = circle.rect
        circle.transform = CGAffineTransform(rotationAngle: circle.rotate)
    }
    
    func updateObstacles() {
        presenter.obstacleViews.forEach {
            $0.frame =  $0.rec
        }
    }
    
    func updateBackGround() {
        let heidth = view.frame.height
        let width1 = heidth *  presenter.backGroundView.ratio
        presenter.backGroundView.frame = CGRect(x: -presenter.backGroundView.position, y: 0, width: width1, height: heidth)
        let width2 = heidth *  presenter.backGroundView2.ratio
        presenter.backGroundView2.frame = CGRect(x: -presenter.backGroundView2.position, y: 0, width: width2, height: heidth)
    }
    
    @objc func buttonPlusClick() {
        presenter.onPlusClick()
        print(presenter.circleView?.circleData.radius())
    }
    
    @objc func buttonMinusClick() {
        presenter.onMinusClick()
        print(presenter.circleView?.circleData.radius())
    }
    
    func setupView() {
        createBackGround()
        createCircle()
        setupObstacklesPositions()
        createAlert()
        setUpButtons()
    }
    
    func createBackGround() {
        view.addSubview(presenter.backGroundView)
        let heidth = view.frame.height
        let width = heidth *  presenter.backGroundView.ratio
        presenter.backGroundView.frame = CGRect(x: presenter.backGroundView.position, y: 0, width: width, height: heidth)
        
        view.addSubview(presenter.backGroundView2)
        let heidth2 = view.frame.height
        let width2 = heidth *  presenter.backGroundView2.ratio
        presenter.backGroundView2.frame = CGRect(x: presenter.backGroundView2.position, y: 0, width: width2, height: heidth2)
    }
    
    func createCircle() {
        presenter.updateCercleView()
        guard let circle = presenter.circleView
        else { return }
        view.addSubview(circle)
        circle.frame = circle.rect
    }
    
    func setupObstacklesPositions() {
        presenter.obstacleViews.forEach {
            view.addSubview($0)
            $0.frame = $0.data.rect
        }
    }
    
    func createAlert() {
        let okAction = UIAlertAction(title: "Restart", style: .default) { _ in
            self.presenter.checkReset = true
            self.alertActive = false
        }
        presenter.alertController.addAction(okAction)
    }
    
    func showAlert() {
        alertActive.toggle()
        present(presenter.alertController, animated: true, completion: nil)
    }
    
    func setUpButtons() {
        [buttonPlus, buttonMinus].forEach {
            view.addSubview($0)
        }
        let centerPosition = presenter.getPositionFor(percentX: 50, percentY: 50) //else { return }
        buttonPlus.frame = CGRect(x: centerPosition.x - 40 + 80, y: centerPosition.y - 40 + 300, width: 80, height: 80)
        buttonMinus.frame = CGRect(x: centerPosition.x - 40 - 80, y: centerPosition.y - 40 + 300, width: 80, height: 80)

    }
}
