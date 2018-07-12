//
//  Obscuration2ViewController.swift
//  UX in motion Demo 3
//
//  Created by JeremyXue on 2018/7/9.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class Obscuration2ViewController: UIViewController {
    
    var blurEffectView:UIVisualEffectView?
    
    @IBOutlet weak var blurEffectStyleLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBAction func dark(_ sender: UIBarButtonItem) {
        blurEffect(style: UIBlurEffectStyle.dark)
        changeLabelAnimation(style: UIBlurEffectStyle.dark, title: "Dark")
    }
    
    @IBAction func light(_ sender: UIBarButtonItem) {
        blurEffect(style: UIBlurEffectStyle.light)
        changeLabelAnimation(style: UIBlurEffectStyle.light, title: "Light")
    }
    
    @IBAction func prominent(_ sender: UIBarButtonItem) {
        blurEffect(style: UIBlurEffectStyle.prominent)
        changeLabelAnimation(style: UIBlurEffectStyle.prominent, title: "Prominent")
    }
    
    @IBAction func extraLight(_ sender: UIBarButtonItem) {
        blurEffect(style: UIBlurEffectStyle.extraLight)
        changeLabelAnimation(style: UIBlurEffectStyle.extraLight, title: "Extra Light")
    }
    
    @IBAction func regular(_ sender: UIBarButtonItem) {
        blurEffect(style: UIBlurEffectStyle.regular)
        changeLabelAnimation(style: UIBlurEffectStyle.regular, title: "Regular")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func blurEffect(style:UIBlurEffectStyle) {
        
        blurEffectView?.removeFromSuperview()
        
        let blurEffect = UIBlurEffect(style: style)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView?.frame = backgroundImage.bounds
        blurEffectView?.alpha = 0
        
        backgroundImage.addSubview(blurEffectView!)
        
        UIView.animate(withDuration: 0.8) {
            self.blurEffectView?.alpha = 1
        }
    }
    
    func changeLabelAnimation(style:UIBlurEffectStyle,title:String) {
        
        UIView.animate(withDuration: 0.4, animations: {
            self.blurEffectStyleLabel.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.height / 2)
        }) { (finish) in
            UIView.animate(withDuration: 0.4, animations: {
                if style == UIBlurEffectStyle.extraLight || style == UIBlurEffectStyle.prominent {
                    self.blurEffectStyleLabel.textColor = UIColor.black
                } else {
                    self.blurEffectStyleLabel.textColor = UIColor.white
                }
                self.blurEffectStyleLabel.text = title
                self.blurEffectStyleLabel.transform = .identity
            })
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
