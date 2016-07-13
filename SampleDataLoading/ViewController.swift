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
        self.title = "Contacts"
        let frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        self.contactTable = ContactsTableView(frame: frame)
        self.contactTable.tableData = [];
        self.contactTable.reloadData()
        DataManager.sharedInstance.fetchContactListJSON("") { (personList) in
            self.contactTable.tableData = personList!
            self.contactTable.reloadData()
        }
        self.view.addSubview(self.contactTable)
//        if let path = NSBundle.mainBundle().pathForResource("ContactDirectory", ofType: "plist"){
//            dataArray = NSArray(contentsOfFile:path)
//            contactTable =  ContactsTableView(frame:self.view.frame,data: dataArray! as [AnyObject])
//            self.view.addSubview(contactTable)
//        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        let color = UIColor(red: 62/255, green: 80/255, blue: 180/255, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = color
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

