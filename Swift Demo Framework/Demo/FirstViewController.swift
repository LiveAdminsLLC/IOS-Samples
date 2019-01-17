//
//  FirstViewController.swift
//  Demo
//
//  Created by Pro on 15/01/2019.
//  Copyright © 2019 Zaigham Maqsood. All rights reserved.
//

import UIKit

import WGVisitor

class FirstViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func showChatHeadAction(_ sender: UISwitch) {
        
        
        WGVisitorViewController.shouldShowChatHead(sender.isOn)
        
    }
    
    @IBAction func showBtn(sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController")
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    

}
