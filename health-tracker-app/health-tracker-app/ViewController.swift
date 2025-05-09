//
//  ViewController.swift
//  health-tracker-app
//
//  Created by Emerald Leece on 01/05/2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startFast(sender: UIButton) {
        let alertController = UIAlertController(title: "You started a fast!", message: "We'll let you know when it's time to eat.", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
