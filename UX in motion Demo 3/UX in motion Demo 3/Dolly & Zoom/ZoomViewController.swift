//
//  ZoomViewController.swift
//  UX in motion Demo 3
//
//  Created by JeremyXue on 2018/7/11.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout{
    
    var blurEffectView:UIView!
    
    @IBOutlet weak var albumCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        albumCollectionView.dataSource = self
        albumCollectionView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Collection view Datasource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "albumCell", for: indexPath) as! ZoomCollectionViewCell
        
        cell.backgroundColor = UIColor.blue
        cell.albumImage.image = UIImage(named: "cat\(indexPath.row % 9)")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 20) / 3
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! ZoomCollectionViewCell
        showAnimation(cell: cell, collectionView: collectionView)
        print(indexPath)
        
    }
    
    func showAnimation(cell:ZoomCollectionViewCell,collectionView:UICollectionView) {
        
        blurEffectView = UIView()
        blurEffectView.frame = collectionView.bounds
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let effectView = UIVisualEffectView(effect: blurEffect)
        effectView.frame = blurEffectView.bounds
        blurEffectView.addSubview(effectView)
        
        let imageView = UIImageView()
        imageView.image = cell.albumImage.image
        imageView.frame = cell.frame
        imageView.layer.cornerRadius = imageView.frame.height / 4
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        blurEffectView.addSubview(imageView)
        
        let button = UIButton()
        button.frame = CGRect(x: blurEffectView.bounds.maxX - 150 , y: 0, width: 150, height: 40)
        button.setTitle("關閉視窗 [X]", for: UIControlState.normal)
        button.backgroundColor = UIColor.black
        button.tintColor = UIColor.white
        button.alpha = 0
        button.addTarget(self, action: #selector(exitZoom), for: UIControlEvents.touchUpInside)
        blurEffectView.addSubview(button)
        
        albumCollectionView.addSubview(blurEffectView)
        
        
        UIView.animate(withDuration: 1) {
            imageView.frame = CGRect(x: 0, y: 0, width: self.blurEffectView.frame.width, height: self.blurEffectView.frame.width)
            imageView.center = CGPoint(x: self.albumCollectionView.bounds.maxX / 2 , y: self.albumCollectionView.bounds.maxY / 2)
            button.alpha = 1
        }
        
    }
    
    @objc func exitZoom() {
        blurEffectView.removeFromSuperview()
    }
    
    
}
