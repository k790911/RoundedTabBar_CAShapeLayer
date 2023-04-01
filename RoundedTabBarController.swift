//
//  RoundedTabBarControllerViewController.swift
//  RoundedTabBarController
//
//  Created by 김재훈 on 2023/03/26.
//

import UIKit

class RoundedTabBarController: UITabBarController {
    
    var myVC1: UIViewController?
    var myVC2: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // MARK: views initialized
        
        //view.backgroundColor = .white
        
        myVC1 = UIViewController()
        myVC1?.view.backgroundColor = .green
        myVC1?.tabBarItem = UITabBarItem(
            title: "house",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill"))
        
        myVC2 = UIViewController()
        myVC2?.view.backgroundColor = .yellow
        myVC2?.tabBarItem = UITabBarItem(
            title: "gear",
            image: UIImage(systemName: "gear"),
            selectedImage: UIImage(systemName: "gear.circle"))
        
        
        // MARK: set layer
        
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(
            roundedRect: CGRect(
                x: 30,
                y: self.tabBar.bounds.minY - 10, // 5
                width: self.tabBar.bounds.width - 60,  // - 60
                height: self.tabBar.bounds.height + 20 // 10
            ),
            cornerRadius: self.tabBar.frame.width / 2).cgPath

        //layer.shadowColor = UIColor.lightGray.cgColor
        //layer.shadowOffset = CGSize(width: 5.0, height: 5.0) // 5.0, 5.0
        //layer.shadowRadius = 25.0
        //layer.shadowOpacity = 0.3
        layer.borderWidth = 1.0
        layer.opacity = 1.0
        layer.isHidden = false
        //layer.masksToBounds = false
        layer.fillColor = UIColor.white.cgColor

        self.tabBar.layer.insertSublayer(layer, at: 0)

        if let items = self.tabBar.items {
            items.forEach { item in
                item.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -15, right: 0)

            }
            self.tabBar.itemWidth = 30.0
            self.tabBar.itemPositioning = .centered
        }

        setViewControllers([myVC1!, myVC2!], animated: true)
        
    }
    
    

}
