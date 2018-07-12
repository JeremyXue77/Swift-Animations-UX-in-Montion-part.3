//
//  Dimensionality2ViewController.swift
//  UX in motion Demo 3
//
//  Created by JeremyXue on 2018/7/10.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class Dimensionality2ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var index = 0
    var colorArray = [#colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1),#colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1),#colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 1),#colorLiteral(red: 0.4500938654, green: 0.9813225865, blue: 0.4743030667, alpha: 1),#colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1),#colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1),#colorLiteral(red: 0.8446564078, green: 0.5145705342, blue: 1, alpha: 1)]
    
    @IBOutlet weak var flipTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flipTableView.dataSource = self
        flipTableView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showTableViewAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Tableview datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorArray.count * 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "flipCell", for: indexPath)
        cell.textLabel?.text = "FlipCell"
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        cell.backgroundColor = colorArray[indexPath.row % colorArray.count]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.flipTableView.frame.height / CGFloat(colorArray.count)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIView.transition(with: tableView.cellForRow(at: indexPath)!, duration: 0.4, options: UIViewAnimationOptions.transitionFlipFromBottom, animations: nil, completion: nil)
    }
    
    
    func showTableViewAnimation() {
        
        for cell in flipTableView.visibleCells {
            cell.transform = CGAffineTransform(translationX: 0, y: flipTableView.frame.height)
        }
        
        for cell in flipTableView.visibleCells {
            UIView.animate(withDuration: 1, delay: 0.5 * Double(index), usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }) { (finish) in
                UIView.transition(with: cell, duration: 1, options: UIViewAnimationOptions.transitionFlipFromBottom, animations: nil, completion: nil)
            }
            index += 1
        }
    }

}



