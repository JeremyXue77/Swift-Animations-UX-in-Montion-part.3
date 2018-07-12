//
//  Parallax2ViewController.swift
//  UX in motion Demo 3
//
//  Created by JeremyXue on 2018/7/9.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class Parallax2ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var city = ["Taipei","Tokyo","Thailand","Seoul","Singapore","Paris","Singapore"]

    @IBOutlet weak var cityTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityTableView.dataSource = self
        cityTableView.delegate = self
        scrollViewDidScroll(cityTableView)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return city.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! ParallaxTableViewCell
        
        cell.cityImage.image = UIImage(named: city[indexPath.row])
        cell.cityLabel.text = "- \(city[indexPath.row]) -"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 4
    }
    

}

extension Parallax2ViewController:UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        for cell in cityTableView.visibleCells {
            if let cityCell = cell as? ParallaxTableViewCell {
                cityCell.cellParallax(tableView: cityTableView, view: view)
            }
        }
    }
    
}
