//
//  ViewController.swift
//  CarbonKitTest
//
//  Created by Raksmey on 12/17/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit
import CarbonKit

class ViewController: UIViewController,  CarbonTabSwipeNavigationDelegate{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let items = [UIImage(named: "home")!, UIImage(named: "hourglass")!, UIImage(named: "premium_badge")!] as [Any]
        let carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items, delegate: self)
        carbonTabSwipeNavigation.insert(intoRootViewController: self)
        self.style()
       
    }
    func style() {
        var color: UIColor = UIColor(red: 24.0 / 255, green: 75.0 / 255, blue: 152.0 / 255, alpha: 1)
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationController!.navigationBar.tintColor = UIColor.white
        self.navigationController!.navigationBar.barTintColor = color
        self.navigationController!.navigationBar.barStyle = .blackTranslucent

        
    }
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        switch index {
        case 0:
            return self.storyboard!.instantiateViewController(withIdentifier: "ViewControllerOne") as! OneViewController
        case 1:
            return self.storyboard!.instantiateViewController(withIdentifier: "ViewControllerTwo") as! TwoViewController
        default:
            return self.storyboard!.instantiateViewController(withIdentifier: "ViewControllerThree") as! ThreeViewController
        }
        
    }
    

    override func viewDidAppear(_ animated: Bool) {


    }

}

