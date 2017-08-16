//
//  ViewController.swift
//  AdvancedAnimations
//
//  Created by WenxuanWang on 15/08/2017.
//  Copyright © 2017 NTTDATA.INC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var circleView: UIImageView!
    @IBOutlet weak var lineView: UIImageView!
    var animator: UIViewPropertyAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(self.handlePan(recognizer: )))
        self.circleView.addGestureRecognizer(gesture)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func handlePan(recognizer: UIPanGestureRecognizer) {

        switch recognizer.state {
        case .began:
            animator = UIViewPropertyAnimator(duration: 1, curve: .easeIn, animations: {
                self.circleView.frame = self.circleView.frame.offsetBy(dx: 355, dy: 0)
            })
            animator.addCompletion { (position) in
                self.circleView.frame = self.circleView.frame.offsetBy(dx: -355, dy: 0)
            }
            animator.pauseAnimation()
        case .changed:
            let translation = recognizer.translation(in: circleView)
            animator.fractionComplete = translation.x / 355
        case .ended:
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        default:
            break
        }


    }


}

