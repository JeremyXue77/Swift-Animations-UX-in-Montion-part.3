//
//  DimensionalityViewController.swift
//  UX in motion Demo 3
//
//  Created by JeremyXue on 2018/7/10.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class DimensionalityViewController: UIViewController {

    var isOpen = false
    
    @IBOutlet weak var cardButton: UIButton!
    
    @IBAction func checkCard(_ sender: Any) {
        
        if isOpen == false {
            isOpen = true
            cardButton.setImage(UIImage(named: "Emma"), for: UIControlState.normal)
            UIView.transition(with: cardButton, duration: 1, options: UIViewAnimationOptions.transitionFlipFromRight, animations: {
                self.cardButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            }) { (finish) in
                UIView.animate(withDuration: 0.4, animations: {
                    self.cardButton.transform = CGAffineTransform.identity
                })
            }
        } else {
            isOpen = false
            cardButton.setImage(UIImage(named: "cardback_0"), for: UIControlState.normal)
            UIView.transition(with: cardButton, duration: 1, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: nil, completion: nil)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
