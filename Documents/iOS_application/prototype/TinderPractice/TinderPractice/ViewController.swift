//
//  ViewController.swift
//  TinderPractice
//
//  Created by 小菅仁士 on 2016/04/28.
//  Copyright © 2016年 kosuge satoshi. All rights reserved.
//

import UIKit
import MDCSwipeToChoose

final class ViewController: UIViewController, MDCSwipeToChooseDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setOptions()
    }
    
    private func setOptions() {
        for _ in 1 ..< 10 {
        
        let options: MDCSwipeToChooseViewOptions = MDCSwipeToChooseViewOptions()
        options.delegate = self
        options.likedText = "いいね"
        options.likedColor = UIColor.blueColor()
        options.nopeText = "ダメね"
        options.onPan = { state -> Void in
            if (state.thresholdRatio == 1.0 && state.direction == MDCSwipeDirection.Left) {
                print("let go now to delete the photo")
            }
        }
        
        let frame = CGRect(x: 0, y: 0, width: 300, height: 500)
        let view:MDCSwipeToChooseView = MDCSwipeToChooseView(frame: frame, options:options)
        view.center = self.view.center
        view.imageView.image = UIImage(named:"cat.jpg")
        view.imageView.contentMode = UIViewContentMode.ScaleAspectFill
        self.view.addSubview(view)
        }
    }
    
    func viewDidCancelSwipe(view: UIView) -> Void {
        print("Couldn't decide, huh?")
    }
    
    
    
    func view(view:UIView, shouldBeChosenWithDirection: MDCSwipeDirection) -> Bool {
        if (shouldBeChosenWithDirection == MDCSwipeDirection.Left) {
            return true
        } else {
            UIView.animateWithDuration(0.16, animations: { () -> Void in
                view.transform = CGAffineTransformIdentity
                view.center = self.view.center
            })
            return false
        }
    }
    
    func view(view: UIView, wasChosenWithDirection: MDCSwipeDirection) -> Void {
        if (wasChosenWithDirection == MDCSwipeDirection.Left) {
            print("Photo deleted!")
        } else if (wasChosenWithDirection == MDCSwipeDirection.Right) {
            print("Photo saved!")
        }
    }
}