//
//  SplashViewController.swift
//  lit_cpbl_b
//
//  Created by kota on 2018/10/21.
//  Copyright © 2018年 Kansei Kogami. All rights reserved.
//

import UIKit
import SwiftGifOrigin

class SplashViewController: UIViewController {

    @IBOutlet weak var splashMove: UIImageView!
    
    var timer:Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        splashMove.loadGif(name: "shokai")
        
        Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(SplashViewController.changeView), userInfo: nil, repeats: true)
        
        
    }
    
    @objc func changeView() {
        self.performSegue(withIdentifier: "home", sender: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
