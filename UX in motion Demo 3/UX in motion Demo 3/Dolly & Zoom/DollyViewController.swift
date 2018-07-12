//
//  DollyViewController.swift
//  UX in motion Demo 3
//
//  Created by JeremyXue on 2018/7/10.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class DollyViewController: UIViewController {
    
    var isLogin = false
    
    @IBOutlet weak var loginView: UIView!
    var anotherView:UIView!
    
    @IBAction func dollyAnimation(_ sender: UIButton) {
        
        if isLogin == false {
            UIView.animate(withDuration: 2, animations: {
                self.loginView.transform = CGAffineTransform(scaleX: 100, y: 100)
                self.anotherView?.transform = CGAffineTransform.identity
                self.anotherView?.alpha = 1
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        anotherView = UIView()
        anotherView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        anotherView.center = view.center
        anotherView.alpha = 0
        
        let successLabel = UILabel()
        successLabel.frame = CGRect(x: 0, y: 0, width: anotherView.frame.width, height: 50)
        successLabel.center = anotherView.center
        successLabel.text = "Hello World"
        successLabel.textAlignment = NSTextAlignment.center
        successLabel.backgroundColor = UIColor.clear
        successLabel.textColor = UIColor.black
        successLabel.font = UIFont.systemFont(ofSize: 60)
        
        let backButton = UIButton()
        backButton.frame = CGRect(x: 0, y: 0, width: anotherView.frame.width / 2, height: 50)
        backButton.center = view.center
        backButton.center.y += 100
        backButton.setTitle("Back", for: UIControlState.normal)
        backButton.tintColor = UIColor.white
        backButton.backgroundColor = UIColor.black
        backButton.addTarget(self, action: #selector(back), for: UIControlEvents.touchUpInside)
        
        anotherView.addSubview(backButton)
        anotherView.addSubview(successLabel)
        view.addSubview(anotherView)
        
        anotherView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func back() {
        UIView.animate(withDuration: 2, animations: {
            self.loginView.transform = CGAffineTransform.identity
            self.anotherView?.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            self.anotherView?.alpha = 0
        })
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
