//
//  ObscurationTableViewCell.swift
//  UX in motion Demo 3
//
//  Created by JeremyXue on 2018/7/9.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class ParallaxTableViewCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addBlackLayer()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func addBlackLayer() {
        let blackLayer = CALayer()
        blackLayer.frame = cityImage.frame
        blackLayer.backgroundColor = UIColor.black.cgColor
        blackLayer.opacity = 0.3
        
        cityImage.layer.insertSublayer(blackLayer, at: 0)
    }
    
    func cellParallax(tableView:UITableView,view:UIView) {
        // 換算出 tableView 在 view 上的座標
        let cellPoint = tableView.convert(self.center, to: view)
        
        // 計算兩點之間的距離
        let distance = tableView.center.y - cellPoint.y
        // 計算 cell 與圖片間的距離
        let parallaxHeight = (cityImage.frame.height - self.frame.height) / 2
        // 位移距離 = (parallaxHeight 與 view 的比例) * 兩點距離
        let move = (parallaxHeight/view.frame.height) * distance
        
        // 將 cityImage 減去視差高度加上位移距離
        cityImage.frame.origin.y = -(parallaxHeight) + move

    }

}
