//
//  LanguageSelectionController.swift
//  DemoSwift
//
//  Created by Pro on 04/02/2019.
//  Copyright © 2019 Zaigham Maqsood. All rights reserved.
//

import UIKit
import WGVisitor
class LanguageSelectionController: UITableViewController {
    
    let dataArray = ["English","العربية"]
    var selectedRow: Int?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = dataArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedRow = indexPath.row
        let language = WGVisitorSharedData.getSharedInstance().selectedLanguage

        if language == "ar" && selectedRow == 0{
            WGVisitorViewController.setPreferredLanguage("en");
        }else if language != "ar" && selectedRow == 1 {
             WGVisitorViewController.setPreferredLanguage("ar");
        }
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
}
