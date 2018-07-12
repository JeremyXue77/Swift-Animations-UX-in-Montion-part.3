//
//  ParallaxViewController.swift
//  UX in motion Demo 3
//
//  Created by JeremyXue on 2018/7/9.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class ParallaxViewController: UIViewController {

    
    @IBOutlet weak var seaBackground: UIImageView!
    @IBOutlet weak var fishImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parallaxEffect(view: fishImage,amount: -50)
        parallaxEffect(view: seaBackground, amount: 50)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func parallaxEffect(view:UIView,amount:Int) {
        
        let horizontal = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        horizontal.minimumRelativeValue = -amount
        horizontal.maximumRelativeValue = amount
        
        let vertical = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        vertical.minimumRelativeValue = -amount
        vertical.maximumRelativeValue = amount
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontal, vertical]
        view.addMotionEffect(group)
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
