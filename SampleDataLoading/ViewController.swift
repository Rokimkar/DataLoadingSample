//
//  ViewController.swift
//  SampleDataLoading
//
//  Created by Sanchit Kumar Singh on 6/22/16.
//  Copyright © 2016 Sanchit Kumar Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var contactTable:ContactsTableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var dataArray : NSArray?
        DataManager.sharedInstance.fetchContactListJSON("") { (data) in
            
        }
        if let path = NSBundle.mainBundle().pathForResource("ContactDirectory", ofType: "plist"){
            dataArray = NSArray(contentsOfFile:path)
            contactTable =  ContactsTableView(frame:self.view.frame,data: dataArray! as [AnyObject])
            self.view.addSubview(contactTable)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

