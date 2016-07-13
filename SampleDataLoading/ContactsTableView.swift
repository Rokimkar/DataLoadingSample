//
//  ContactsTableView.swift
//  SampleDataLoading
//
//  Created by Sanchit Kumar Singh on 6/22/16.
//  Copyright © 2016 Sanchit Kumar Singh. All rights reserved.
//

import UIKit

protocol cellTapped {
    func performActionOnCellTap(person:Person)
}

class ContactsTableView: UITableView,UITableViewDataSource,UITableViewDelegate {
    
    var tableData = [Person]()
    var cellTapDelegate:cellTapped?
    init(frame: CGRect) {
        super.init(frame: frame, style:.Plain)
        self.dataSource=self
        self.delegate=self
        self.backgroundColor = UIColor.whiteColor()
        self.registerCell("TableViewCell")
        self.registerCell("LoaderCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func registerCell(identifier:String)  {
        self.registerNib(UINib(nibName: identifier, bundle:nil), forCellReuseIdentifier:identifier)
    }
    
    //Mark :TableView Data Source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableData.count==0){
            return 1;
        }
        return tableData.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if(self.tableData.count==0){
            let cell = tableView.dequeueReusableCellWithIdentifier("LoaderCell", forIndexPath: indexPath) as! LoaderCell
            cell.loader.startAnimating()
            return cell;
        }
        let currentCellDescriptor = getCellDescriptorForIndexPath(indexPath)
        let cell = tableView.dequeueReusableCellWithIdentifier(currentCellDescriptor!, forIndexPath: indexPath) as! TableViewCell
        cell.bindDataForObject(self.tableData[indexPath.row])
        return cell
    }
    
    func getCellDescriptorForIndexPath(indexPath:NSIndexPath) -> String? {
        return "TableViewCell"
    }
    
    //Mark Table Delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        cellTapDelegate?.performActionOnCellTap(self.tableData[indexPath.row])
        self.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
