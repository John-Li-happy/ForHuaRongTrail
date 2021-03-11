//
//  EntranceViewController.swift
//  ForHuaRongTrail
//
//  Created by Zhaoyang Li on 2/25/21.
//

import UIKit

class EntranceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initialUISettings()
    }
    
    private func initialUISettings() {
        view.backGroundImage()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
