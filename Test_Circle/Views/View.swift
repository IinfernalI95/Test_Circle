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
    
//    private lazy var imageView: UIImageView = {
//            let imageView = UIImageView()
//            imageView.contentMode = .scaleAspectFill
//            imageView.clipsToBounds = true
//            imageView.translatesAutoresizingMaskIntoConstraints = false
//            imageView.image = bg01.image
//        
//            return imageView
//    }()
    
    var backgroundView = BgView()
    var bg02 = BgView01()
    var circleView: CircleView?
    
    var presenter: Presenter
    var timer: Timer?
    var alertActive = false
    //var bgView:
    
    var screenUtillity: ScreenUtility? = nil
//    var displayLink: CADisplayLink?
//    var previousTimestamp: CFTimeInterval = 0
    
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
        //view.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 0.2)
        screenUtillity = ScreenUtility(screenSize: self.view.bounds.size)
        presenter.setScreenUtility(screenUtility: screenUtillity)
        setupView()
        update()
    }
    
    func update() {
        var rotationAngle = 0.1
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { [weak self] _ in

            guard let self = self,
                  let circle = presenter.circleView,
                  var image = circle.image
            else { return }
            
            presenter.obstacleViews.forEach {
                $0.frame =  $0.rec
            }
            
            rotationAngle += 0.1
            presenter.circleView?.transform = CGAffineTransform(rotationAngle: rotationAngle)
            
            circle.bounds = circle.rect
            
            if presenter.showAlert && !alertActive {
                showAlert()
            }
        }
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
        view.addSubview(backgroundView)
        //backgroundView.frame = CGRect(x: 0, y: 0, width: backgroundView.size.width, height: backgroundView.size.height)
        backgroundView.frame = CGRect(x: 0, y: 0, width: backgroundView.size.width, height: view.frame.size.height)
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
        guard let alertView = presenter.alertController else { return }
        
        let okAction = UIAlertAction(title: "Restart", style: .default) { _ in
            self.presenter.checkReset = true
            self.alertActive = false
        }
        alertView.addAction(okAction)
    }
    
    func showAlert() {
        alertActive.toggle()
        guard let alertView = presenter.alertController else { return }
        
        present(alertView, animated: true, completion: nil)
    }
    
    func setUpButtons() {
        [buttonPlus, buttonMinus].forEach {
            view.addSubview($0)
        }
        guard let centerPosition = screenUtillity?.getPositionFor(percentX: 50, percentY: 50) else { return }
        buttonPlus.frame = CGRect(x: centerPosition.x - 40 + 80, y: centerPosition.y - 40 + 300, width: 80, height: 80)
        buttonMinus.frame = CGRect(x: centerPosition.x - 40 - 80, y: centerPosition.y - 40 + 300, width: 80, height: 80)

    }
}
