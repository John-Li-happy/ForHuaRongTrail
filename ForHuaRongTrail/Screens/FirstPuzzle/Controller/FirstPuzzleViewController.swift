//
//  ViewController.swift
//  ForHuaRongTrail
//
//  Created by Zhaoyang Li on 11/6/20.
//

import UIKit

class FirstPuzzleViewController: UIViewController {
    let firstPuzzleViewModel = FirstPuzzleViewModel()
    var oneBlockWidth = CGFloat()
    var stepCounter = 0
    
    override var shouldAutorotate: Bool { false }
    
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var woodBorderView: UIView!
    @IBOutlet private weak var caoCaoImageView: UIImageView!
    @IBOutlet private weak var guanYuImageView: UIImageView!
    @IBOutlet private weak var zhangFeiImageView: UIImageView!
    @IBOutlet private weak var zhaoYunImageView: UIImageView!
    @IBOutlet private weak var maChaoImageView: UIImageView!
    @IBOutlet private weak var huangZhongImageView: UIImageView!
    @IBOutlet private weak var soldierOneImageView: UIImageView!
    @IBOutlet private weak var soldierTwoImageView: UIImageView!
    @IBOutlet private weak var soldierThreeImageView: UIImageView!
    @IBOutlet private weak var soldierFourImageView: UIImageView!
    @IBOutlet private weak var stepLabel: UILabel!
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var lastMinimumLabel: UILabel! {
        didSet {
            if UserDefaults.standard.object(forKey: "passedStep") == nil {
                lastMinimumLabel.text = "No result yet "
            } else if let nonnullMinStep = UserDefaults.standard.object(forKey: "passedStep") {
                lastMinimumLabel.text =  "Best history is \(nonnullMinStep) steps"
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        initialBlockSettings()
        super.viewDidAppear(animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initialIUISettings()
        caoCaoBlockHandler()
        guanYuBlockHandler()
        wuHuBlockHandler()
        soildersBlockHandler()
    }
    private func initialIUISettings() {
        view.backGroundImage()
        contentView.greenContent()
        woodBorderView.greenBoarder()
        let _ = contentView.subviews.map{ if $0 is UIImageView {
            guard let imageView = $0 as? UIImageView else { return }
            imageView.blockBasicUISettings()
        } }
    }
    private func initialBlockSettings() {
        oneBlockWidth = contentView.frame.width / 4
        
        caoCaoImageView.frame.origin.x = oneBlockWidth
        caoCaoImageView.frame.origin.y = 0
        
        guanYuImageView.frame.origin.x = oneBlockWidth
        guanYuImageView.frame.origin.y = 2 * oneBlockWidth
        
        zhangFeiImageView.frame.origin.x = 0
        zhangFeiImageView.frame.origin.y = 0
        
        zhaoYunImageView.frame.origin.x = 3 * oneBlockWidth
        zhaoYunImageView.frame.origin.y = 0
        
        maChaoImageView.frame.origin.x = 0
        maChaoImageView.frame.origin.y = 2 * oneBlockWidth
        
        huangZhongImageView.frame.origin.x = 3 * oneBlockWidth
        huangZhongImageView.frame.origin.y = 2 * oneBlockWidth
        
        soldierOneImageView.frame.origin.x = 0
        soldierOneImageView.frame.origin.y = 4 * oneBlockWidth
        
        soldierTwoImageView.frame.origin.x = oneBlockWidth
        soldierTwoImageView.frame.origin.y = 3 * oneBlockWidth
        
        soldierThreeImageView.frame.origin.x = 2 * oneBlockWidth
        soldierThreeImageView.frame.origin.y = 3 * oneBlockWidth
        
        soldierFourImageView.frame.origin.x = 3 * oneBlockWidth
        soldierFourImageView.frame.origin.y = 4 * oneBlockWidth
        
        addSubLabels()
        // Check timer
        Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(monitorSuccess), userInfo: nil, repeats: true)
    }
    private func addSubLabels() {
        let nameArray = ["Cao Cao", "Guan", "Zhang", "Zhao", "Ma", "Huang", "Zu", "Zu", "Zu", "Zu"]

        for element in contentView.subviews {
            let label = UILabel()
            label.text = nameArray[element.tag - 1]
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 17)
            label.frame = CGRect(x: 0, y: element.frame.height - 30, width: element.frame.width, height: 30)
            label.textColor = .black
            element.addSubview(label)
        }
    }
    private func soildersBlockHandler() {
        let soildersImageViewArray = [soldierOneImageView, soldierTwoImageView, soldierThreeImageView, soldierFourImageView]
        
        for element in soildersImageViewArray {
            let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(soilderDownHandler(_:)))
            downSwipe.direction = .down
            let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(soilderUpHandler(_:)))
            upSwipe.direction = .up
            let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(soilderLeftHandler(_:)))
            leftSwipe.direction = .left
            let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(soilderRightHandler(_:)))
            rightSwipe.direction = .right
            
            element?.addGestureRecognizer(downSwipe)
            element?.addGestureRecognizer(upSwipe)
            element?.addGestureRecognizer(leftSwipe)
            element?.addGestureRecognizer(rightSwipe)
        }
    }
    private func wuHuBlockHandler() {
        let wuHuGeneralsImageViewArray = [zhangFeiImageView, zhaoYunImageView, maChaoImageView, huangZhongImageView]
        
        for element in wuHuGeneralsImageViewArray {
            let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(wuHuDownSwipeHandler))
            downSwipe.direction = .down
            let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(wuHuUpSwipeHandler))
            upSwipe.direction = .up
            let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(wuHuLeftHandler))
            leftSwipe.direction = .left
            let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(wuHuRightHandler))
            rightSwipe.direction = .right
            
            element?.addGestureRecognizer(downSwipe)
            element?.addGestureRecognizer(upSwipe)
            element?.addGestureRecognizer(leftSwipe)
            element?.addGestureRecognizer(rightSwipe)
        }
    }
    private func guanYuBlockHandler() {
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(guanYuSwipeHandler(_:)))
        downSwipe.direction = .down
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(guanYuSwipeHandler(_:)))
        upSwipe.direction = .up
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(guanYuSwipeHandler(_:)))
        leftSwipe.direction = .left
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(guanYuSwipeHandler(_:)))
        rightSwipe.direction = .right
        
        guanYuImageView.addGestureRecognizer(downSwipe)
        guanYuImageView.addGestureRecognizer(upSwipe)
        guanYuImageView.addGestureRecognizer(leftSwipe)
        guanYuImageView.addGestureRecognizer(rightSwipe)
    }
    private func caoCaoBlockHandler() {
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(caoCaoSwipeHandler(_:)))
        downSwipe.direction = .down
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(caoCaoSwipeHandler(_:)))
        upSwipe.direction = .up
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(caoCaoSwipeHandler(_:)))
        leftSwipe.direction = .left
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(caoCaoSwipeHandler(_:)))
        rightSwipe.direction = .right
        
        caoCaoImageView.addGestureRecognizer(downSwipe)
        caoCaoImageView.addGestureRecognizer(upSwipe)
        caoCaoImageView.addGestureRecognizer(leftSwipe)
        caoCaoImageView.addGestureRecognizer(rightSwipe)
    }
    @objc private func monitorSuccess() {
        stepLabel.text = "Step: \(stepCounter)"
        if firstPuzzleViewModel.caoCaoPosition.contains([4, 1]) {
            if firstPuzzleViewModel.caoCaoPosition.contains([4, 2]) {
                successHandler()
            }
        }
    }
    @objc private func successHandler() {
        resultLabel.text = "yes, you made it"
        let _ = contentView.subviews.map{ if $0 is UIImageView {
            guard let imageView = $0 as? UIImageView else { return }
            imageView.gestureRecognizers = nil
        } }
        if UserDefaults.standard.object(forKey: "passedStep") == nil {
            UserDefaults.standard.setValue(stepCounter, forKey: "passedStep")
        } else if let nonnullMinStep = UserDefaults.standard.object(forKey: "passedStep") as? Int {
            if stepCounter < nonnullMinStep {
                UserDefaults.standard.setValue(stepCounter, forKey: "passedStep")
            }
        }
    }
}

extension FirstPuzzleViewController {
    @objc func soilderDownHandler(_ sender: UIGestureRecognizer) {
        guard let imageView = sender.view as? UIImageView else { return }
        var operatingSoldier = Soldiers(rawValue: 0)
        switch imageView {
        case soldierOneImageView:
            operatingSoldier = .soldierOne
        case soldierTwoImageView:
            operatingSoldier = .soldierTwo
        case soldierThreeImageView:
            operatingSoldier = .soldierThree
        case soldierFourImageView:
            operatingSoldier = .soldierFour
        default:
            print("found nothing")
        }
        guard let nonnullOperatingSoldier = operatingSoldier else { return }
        if firstPuzzleViewModel.soliderDownCheck(soldier: nonnullOperatingSoldier) {
            downSwipeUIElement(imageView: imageView)
        }
    }
    @objc func soilderUpHandler(_ sender: UIGestureRecognizer) {
        guard let imageView = sender.view as? UIImageView else { return }
        var operatingSoldier = Soldiers(rawValue: 0)
        switch imageView {
        case soldierOneImageView:
            operatingSoldier = .soldierOne
        case soldierTwoImageView:
            operatingSoldier = .soldierTwo
        case soldierThreeImageView:
            operatingSoldier = .soldierThree
        case soldierFourImageView:
            operatingSoldier = .soldierFour
        default:
            print("found nothing")
        }
        guard let nonnullOperatingSoldier = operatingSoldier else { return }
        if firstPuzzleViewModel.soliderUpCheck(soldier: nonnullOperatingSoldier) {
            upSwipeUIElement(imageView: imageView)
        }
    }
    @objc func soilderRightHandler(_ sender: UIGestureRecognizer) {
        guard let imageView = sender.view as? UIImageView else { return }
        var operatingSoldier = Soldiers(rawValue: 0)
        switch imageView {
        case soldierOneImageView:
            operatingSoldier = .soldierOne
        case soldierTwoImageView:
            operatingSoldier = .soldierTwo
        case soldierThreeImageView:
            operatingSoldier = .soldierThree
        case soldierFourImageView:
            operatingSoldier = .soldierFour
        default:
            print("found nothing")
        }
        guard let nonnullOperatingSoldier = operatingSoldier else { return }
        if firstPuzzleViewModel.soliderRightCheck(soldier: nonnullOperatingSoldier) {
            rightSwipeUIElement(imageView: imageView)
        }
    }
    @objc func soilderLeftHandler(_ sender: UIGestureRecognizer) {
        guard let imageView = sender.view as? UIImageView else { return }
        var operatingSoldier = Soldiers(rawValue: 0)
        switch imageView {
        case soldierOneImageView:
            operatingSoldier = .soldierOne
        case soldierTwoImageView:
            operatingSoldier = .soldierTwo
        case soldierThreeImageView:
            operatingSoldier = .soldierThree
        case soldierFourImageView:
            operatingSoldier = .soldierFour
        default:
            print("found nothing")
        }
        guard let nonnullOperatingSoldier = operatingSoldier else { return }
        if firstPuzzleViewModel.soliderLeftCheck(soldier: nonnullOperatingSoldier) {
            leftSwipeUIElement(imageView: imageView)
        }
    }
    @objc func wuHuRightHandler(_ sender: UIGestureRecognizer) {
        guard let imageView = sender.view as? UIImageView else { return }
        var operatingGeneral = WuHuGenerals(rawValue: 0)
        switch imageView {
        case zhangFeiImageView:
            operatingGeneral = .zhangFei
        case zhaoYunImageView:
            operatingGeneral = .zhaoYun
        case maChaoImageView:
            operatingGeneral = .maChao
        case huangZhongImageView:
            operatingGeneral = .huangZhong
        default:
            print("found nothing")
        }
        guard let nonnullOperatingGeneral = operatingGeneral else { return }
        if firstPuzzleViewModel.wuHuRightCheck(general: nonnullOperatingGeneral) {
            rightSwipeUIElement(imageView: imageView)
        }
    }
    @objc func wuHuLeftHandler(_ sender: UIGestureRecognizer) {
        guard let imageView = sender.view as? UIImageView else { return }
        var operatingGeneral = WuHuGenerals(rawValue: 0)
        switch imageView {
        case zhangFeiImageView:
            operatingGeneral = .zhangFei
        case zhaoYunImageView:
            operatingGeneral = .zhaoYun
        case maChaoImageView:
            operatingGeneral = .maChao
        case huangZhongImageView:
            operatingGeneral = .huangZhong
        default:
            print("found nothing")
        }
        guard let nonnullOperatingGeneral = operatingGeneral else { return }
        if firstPuzzleViewModel.wuHuLeftCheck(general: nonnullOperatingGeneral) {
            leftSwipeUIElement(imageView: imageView)
        }
    }
    @objc func wuHuUpSwipeHandler(_ sender: UIGestureRecognizer) {
        guard let imageView = sender.view as? UIImageView else { return }
        var operatingGeneral = WuHuGenerals(rawValue: 0)
        switch imageView {
        case zhangFeiImageView:
            operatingGeneral = .zhangFei
        case zhaoYunImageView:
            operatingGeneral = .zhaoYun
        case maChaoImageView:
            operatingGeneral = .maChao
        case huangZhongImageView:
            operatingGeneral = .huangZhong
        default:
            print("found nothing")
        }
        guard let nonnullOperatingGeneral = operatingGeneral else { return }
        if firstPuzzleViewModel.wuHuUpCheck(general: nonnullOperatingGeneral) {
            upSwipeUIElement(imageView: imageView)
        }
    }
    @objc func wuHuDownSwipeHandler(_ sender: UIGestureRecognizer) {
        guard let imageView = sender.view as? UIImageView else { return }
        var operatingGeneral = WuHuGenerals(rawValue: 0)
        switch imageView {
        case zhangFeiImageView:
            operatingGeneral = .zhangFei
        case zhaoYunImageView:
            operatingGeneral = .zhaoYun
        case maChaoImageView:
            operatingGeneral = .maChao
        case huangZhongImageView:
            operatingGeneral = .huangZhong
        default:
            print("found nothing")
        }
        guard let nonnullOperatingGeneral = operatingGeneral else { return }
        if firstPuzzleViewModel.wuHuDownCheck(general: nonnullOperatingGeneral) {
            downSwipeUIElement(imageView: imageView)
        }
    }
    @objc func guanYuSwipeHandler(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .down:
            if firstPuzzleViewModel.guanYuDownCheck() {
                downSwipeUIElement(imageView: guanYuImageView)
            }
        case .up:
            if firstPuzzleViewModel.guanYuUpCheck() {
                upSwipeUIElement(imageView: guanYuImageView)
            }
        case .left:
            if firstPuzzleViewModel.guanYuLeftCheck() {
                leftSwipeUIElement(imageView: guanYuImageView)
            }
        case .right:
            if firstPuzzleViewModel.guanYuRightCheck() {
                rightSwipeUIElement(imageView: guanYuImageView)
            }
        default:
            print("found nothing")
        }
    }
    @objc func caoCaoSwipeHandler(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .down:
            if firstPuzzleViewModel.caoCaoDownCheck() {
                downSwipeUIElement(imageView: caoCaoImageView)
            }
        case .left:
            if firstPuzzleViewModel.caoCaoLeftCheck() {
                leftSwipeUIElement(imageView: caoCaoImageView)
            }
        case .right:
            if firstPuzzleViewModel.caoCaoRightCheck() {
                rightSwipeUIElement(imageView: caoCaoImageView)
            }
        case .up:
            if firstPuzzleViewModel.caoCaoUpCheck() {
                upSwipeUIElement(imageView: caoCaoImageView)
            }
        default:
            print("found nothing")
        }
    }
}

extension FirstPuzzleViewController {
    func leftSwipeUIElement(imageView: UIImageView) {
        UIView.animate(withDuration: 0.25, animations: { imageView.frame.origin.x -= self.oneBlockWidth })
        stepCounter += 1
    }
    func rightSwipeUIElement(imageView: UIImageView) {
        UIView.animate(withDuration: 0.25, animations: { imageView.frame.origin.x += self.oneBlockWidth })
        stepCounter += 1
    }
    func upSwipeUIElement(imageView: UIImageView) {
        UIView.animate(withDuration: 0.25, animations: { imageView.frame.origin.y -= self.oneBlockWidth })
        stepCounter += 1
    }
    func downSwipeUIElement(imageView: UIImageView) {
        UIView.animate(withDuration: 0.25, animations: { imageView.frame.origin.y += self.oneBlockWidth })
        stepCounter += 1
    }
}
