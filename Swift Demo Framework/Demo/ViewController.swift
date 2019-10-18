//
//  ViewController.swift
//  Demo
//
//  Created by Zaigham Maqsood on 14/01/2019.
//  Copyright © 2019 Zaigham Maqsood. All rights reserved.
//

import UIKit
import WGVisitor
import MCLocalization

class ViewController: WGVisitorViewController {
    
    var visitorController:WGVisitorViewController?;
  
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        } else {
            // Fallback on earlier versions
        }
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.navigationController?.navigationBar.barTintColor = WGVisitorSharedData.getSharedInstance().themeColor()
        
        
        
        let closeBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: self, action: nil)
        //        let closeBtn = UIBarButtonItem(title: "Close", style: .plain, target: self, action: nil)
        if self.tabBarController != nil {
            self.tabBarController?.navigationItem.rightBarButtonItem = closeBtn
        }
        self.addTargetSessionClosed(forBarButton: closeBtn) { (sessionStatus) in
            self.handleSessionStatus(sessionStatus: sessionStatus);
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func handleSessionStatus(sessionStatus:WGVisitorStatus) -> Void {
        
        switch sessionStatus {
            
        case WGVisitorStatus.INTERNET_UNAVAILABLE_TO_INITIATE_CHAT:
            

            self.showAlert(withTitle: "Error", message: "Internet appears to be offline")
            
            break;
            
            
        case WGVisitorStatus.CLOSE_BUTTON_PRESSED:
            

            // Close Button Intentionally Pressed to close end session
            self.showAlert(withTitle: "Error", message: "Close button press")
            break;
            
        case  WGVisitorStatus.AUTOMATIC_CLOSED :

            self.showAlert(withTitle: "Error", message: "Automatic Closed")
            
            break;
            
        case WGVisitorStatus.NO_OPERATOR_FOUND:
            

            self.showAlert(withTitle: "Error", message: "No operator found")
            // No Operator Found
            
            break;
        case WGVisitorStatus.NETWORK_ERROR:

            self.showAlert(withTitle: "Error", message: "Network error")
            // Call to webserver failed
            
            break;
            
        case WGVisitorStatus.REJECT_TERMS:
            
            self.showAlert(withTitle: "Error", message: "User Rejected your terms")
            
            //            navigationController?.popViewController(animated: true)
            
            break;
        case WGVisitorStatus.USER_BLOCKED:
            

            self.showAlert(withTitle: "Error", message: "User block")
            break;
        case WGVisitorStatus.WEBSITE_NOT_FOUND:
            

            self.showAlert(withTitle: "Error", message: "Website not found")
            
            break;
        case WGVisitorStatus.EMAIL_SENT:
            

            self.showAlert(withTitle: "Success", message: "Email sent")
            
            break;
            
        case WGVisitorStatus.EMAIL_NOT_SENT:
            

            self.showAlert(withTitle: "Error", message: "Unable to send email")
            //launch close button here
            
            break;
        default:
            break
        }
        
        
        if !(sessionStatus == WGVisitorStatus.NETWORK_ERROR) {
//            navigationController?.popViewController(animated: true)
        }
        
    }
    
    
    func showAlert(withTitle title: String, message: String) {
        
        DispatchQueue.main.async {
            
            let alertController = UIAlertController(title: MCLocalization.string(forKey: title), message: MCLocalization.string(forKey: message), preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .cancel) { (action:UIAlertAction) in
                
                //            self.navigationController?.popViewController(animated: true)
            }
            
            
            
            alertController.addAction(okAction)
            
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
}



