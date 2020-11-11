//
//  ViewController.swift
//  Expense
//
//  Created by 郭家銘 on 2020/11/9.
//

import UIKit

class CircularProgressView: UIView {
    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createCircularPath()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createCircularPath()
    }
    
    func createCircularPath() {
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: 80, startAngle: -.pi / 2, endAngle: 3 * .pi / 2, clockwise: true)
        circleLayer.path = circularPath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = 20.0
        circleLayer.strokeColor = UIColor.black.cgColor
        progressLayer.path = circularPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 10.0
        progressLayer.strokeEnd = 0
        progressLayer.strokeColor = UIColor.red.cgColor
        layer.addSublayer(circleLayer)
        layer.addSublayer(progressLayer)
    }
}

class ViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var homeWhite: UIImageView!
    @IBOutlet weak var homeGray_0: UIView!
    @IBOutlet weak var homeGray_1: UIView!
    @IBOutlet weak var homeGray_2: UIImageView!
    @IBOutlet weak var cardWhiteView_0: UIView!
    @IBOutlet weak var cardWhiteView_1: UIView!
    @IBOutlet weak var cardWhiteView_2: UIView!
    @IBOutlet weak var redPlusBtn: UIView!
    @IBOutlet weak var bottomNav: UIView!
    var circularView: CircularProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let redColor = UIColor(red: 0.996, green: 0.376, blue: 0.29, alpha: 0.25).cgColor
        
        // set cardView props
        cardView.layer.cornerRadius = 20
        cardView.layer.shadowColor = redColor
        cardView.layer.shadowOpacity = 1
        cardView.layer.shadowRadius = 20 // shadow spread degree
        cardView.layer.shadowOffset = CGSize(width: 0, height: 5)
        
        // set btn props
        redPlusBtn.layer.cornerRadius = 10
        redPlusBtn.layer.shadowColor = redColor
        redPlusBtn.layer.shadowOpacity = 1
        redPlusBtn.layer.shadowRadius = 10 // shadow spread degree
        redPlusBtn.layer.shadowOffset = CGSize(width: 0, height: 5)
        
        // set bottom nav props
        bottomNav.layer.cornerRadius = 10
        bottomNav.layer.shadowColor = UIColor(red: 0.95, green: 0.897, blue: 0.879, alpha: 1).cgColor
        bottomNav.layer.shadowOpacity = 1
        bottomNav.layer.shadowRadius = 10 // shadow spread degree
        bottomNav.layer.shadowOffset = CGSize(width: 0, height: 5)
        
        // set home rotate
        homeWhite.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/5)
        
        // set white card styles
        setStyles()
    }
    
    func setStyles() {
        let homeGrayIcons: [UIView] = [homeGray_0, homeGray_1, homeGray_2]
        let whiteCards: [UIView] = [cardWhiteView_0, cardWhiteView_1, cardWhiteView_2]
        for icon in homeGrayIcons {
            icon.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/5)
        }
        for card in whiteCards {
            card.layer.cornerRadius = 20
            card.layer.shadowColor = UIColor(red: 0.95, green: 0.897, blue: 0.879, alpha: 1).cgColor
            card.layer.shadowOpacity = 0.8
            card.layer.shadowRadius = 8
            card.layer.shadowOffset = CGSize(width: 0, height: 5)
        }
    }

}

