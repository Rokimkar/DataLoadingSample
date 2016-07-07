//
//  ContactsTableView.swift
//  SampleDataLoading
//
//  Created by Sanchit Kumar Singh on 6/22/16.
//  Copyright © 2016 Sanchit Kumar Singh. All rights reserved.
//

import UIKit

class ContactsTableView: UITableView,UITableViewDataSource,UITableViewDelegate {
    
    var tableData = [AnyObject]()
    
    init(frame: CGRect,data:[AnyObject]) {
        self.tableData = data
        super.init(frame: frame, style:.Plain)
        self.registerCell("TableViewCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func registerCell(identifier:String)  {
        self.registerNib(UINib(nibName: identifier, bundle:nil), forCellReuseIdentifier:identifier)
        self.dataSource=self
        self.delegate=self
        self.backgroundColor = UIColor.grayColor()
    }
    
    //Mark :TableView Data Source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let personData:Dictionary=self.tableData[indexPath.row] as! Dictionary<String,AnyObject>
        let firstName = personData["first_name"] as! String
        let lastname = personData["last_name"] as! String
        let currentCellDescriptor = getCellDescriptorForIndexPath(indexPath)
        let cell = tableView.dequeueReusableCellWithIdentifier(currentCellDescriptor!, forIndexPath: indexPath) as! TableViewCell
        cell.bindData(personData["profile_pic"] as! String,name:firstName+" "+lastname)
        return cell
    }
    
    func getCellDescriptorForIndexPath(indexPath:NSIndexPath) -> String? {
        return "TableViewCell"
    }
    
    //Mark Table Delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
}