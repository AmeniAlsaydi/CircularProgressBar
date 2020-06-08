//
//  ViewController.swift
//  Progress
//
//  Created by Amy Alsaydi on 6/7/20.
//  Copyright © 2020 Amy Alsaydi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: ProgressBarView!
    
    var countFired: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self , action: #selector(handleTap)))

    }
    
    @objc public func handleTap() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
            self.countFired += 1
            
            DispatchQueue.main.async {
                self.progressBar.progress = min(CGFloat(0.03 * self.countFired), 1) // finds min between the progress value and 1 - this is to ensure that the progress bar will stop at 1
                
                
                if self.progressBar.progress == 1 {
                    timer.invalidate() // stop timer
                }
            }
        }
    }

}

