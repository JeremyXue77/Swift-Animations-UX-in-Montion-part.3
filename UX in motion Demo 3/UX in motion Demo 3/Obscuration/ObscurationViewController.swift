//
//  ObscurationViewController.swift
//  UX in motion Demo 3
//
//  Created by JeremyXue on 2018/7/9.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class ObscurationViewController: UIViewController {
    
    var isOpen = false
    var blurEffectView:UIVisualEffectView!

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var myStackView: UIStackView! {
        didSet {
            for view in myStackView.subviews {
                view.isHidden = true
            }
        }
    }
    
    @IBAction func showMenu(_ sender: Any) {
        if isOpen == false {
            isOpen = true
            makeBlurEffect()
            itemAnimation()
        } else {
            isOpen = false
            closeMenu()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeBlurEffect() {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0
        blurEffectView.frame = backgroundImage.bounds
        backgroundImage.addSubview(blurEffectView)
        
        UIView.animate(withDuration: 1) {
            self.blurEffectView.alpha = 1
        }
    }
    
    func itemAnimation() {
        for i in 0..<myStackView.subviews.count {
            UIView.animate(withDuration: 0.4, delay: (TimeInterval(i) * 0.4), options: UIViewAnimationOptions.curveEaseInOut, animations: {
                self.myStackView.alpha = 1
                self.myStackView.subviews[i].isHidden = false
                self.myStackView.subviews[i].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }) { (finish) in
                UIView.animate(withDuration: 1, animations: {
                    self.myStackView.subviews[i].transform = .identity
                })
            }
        }
    }
    
    func closeMenu() {
        
        UIView.animate(withDuration: 1, animations: {
            self.blurEffectView.alpha = 0
            self.myStackView.alpha = 0
        }) { (finish) in
            for view in self.myStackView.subviews {
                view.isHidden = true
            }
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
