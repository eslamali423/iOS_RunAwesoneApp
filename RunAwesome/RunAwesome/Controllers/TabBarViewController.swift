//
//  TabBarViewController.swift
//  RunAwesome
//
//  Created by Eslam Ali  on 24/04/2022.
//

import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        tabBar.tintColor = .label
        tabBar.alpha = 0.3
       
        let vc1 = HomeViewController()
        let vc2 = RunHistoryViewController()
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc1.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        
        vc2.tabBarItem.image = UIImage(systemName: "clock")
        vc2.tabBarItem.selectedImage = UIImage(systemName: "clock.fill")
        
        
        
        
    setViewControllers([vc1, vc2], animated: true)
        
        
        
        
    }
    

 

}
