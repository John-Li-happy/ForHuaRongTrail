//
//  AboutViewController.swift
//  ForHuaRongTrail
//
//  Created by Zhaoyang Li on 2/25/21.
//

import UIKit
import SafariServices

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backGroundImage()
    }
    
    @IBAction func websiteButtonTapped(_ sender: UIButton) {
        if let url = URL(string: "http://huarongtrail.unaux.com/") {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true

            let viewController = SFSafariViewController(url: url, configuration: config)
            present(viewController, animated: true)
        }
    }
}
