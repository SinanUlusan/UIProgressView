//
//  ViewController.swift
//  UIProgressView
//
//  Created by Sinan Ulusan on 25.09.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    
    let progress = Progress(totalUnitCount: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 5)
        
    }

    @IBAction func startProgress() {
        progressView.progress = 0 // tıkladığımızda barın 0lanmasını sağlıyor.
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
        
            guard self.progress.isFinished == false else {
                timer.invalidate()
                print("finished")
                return
            }
        
            self.progress.completedUnitCount += 1
        
            let progressFloat = Float(self.progress.fractionCompleted)
            self.progressView.setProgress(progressFloat, animated: true)
            
        }
    }
}
