//
//  DataManager.swift
//  SampleDataLoading
//
//  Created by Sanchit Kumar Singh on 6/30/16.
//  Copyright © 2016 Sanchit Kumar Singh. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class DataManager: NSObject {
    static let sharedInstance = DataManager()
    
    //fetching JSON object
    
    func fetchContactListJSON(url:String,completion:([Person]?) -> Void){
        Alamofire.request(.GET, "http://gojek-contacts-app.herokuapp.com/contacts.json").validate().responseJSON{
            response in
            print(response.data)
            let data = response.data
            var decodedData:[Dictionary<String,AnyObject>]!
            do{
                decodedData = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions()) as! [Dictionary<String,AnyObject>]
                //print(decodedData)
            }catch{
                
            }
            var personListing : [Person]
            personListing = [Person]()
            if (decodedData?.first) != nil{
                for personDict in decodedData{
                    let person = Person(json : personDict)
                    personListing.append(person)
                }
            }
            completion(self.sortData(personListing))
        }
    }
    
    //fetching Person Detail
    
    func fetchPersonDetail(url:String,completion:(PersonDetail?) -> Void) {
        Alamofire.request(.GET,url).validate().responseJSON{
            response in
            print(response.data)
            let data = response.data
            var decodedData:Dictionary<String,AnyObject>!
            do{
                decodedData = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions()) as! Dictionary<String,AnyObject>
            }catch{
                
            }
            if(decodedData?.first) != nil{
                let personDetail = PersonDetail(json: decodedData)
                completion(personDetail)
            }

        }
    }
    
    //fetching image
    
    func fetchImage(urlString:String, forceFetch:Bool, completion:(UIImage?, NSError?) -> Void){
        Alamofire.request(.GET, urlString)
            .responseImage { response in
                guard response.result.isSuccess else{
                    print("Error while fetching: \(response.result.error)")
                    completion(nil, response.result.error)
                    return
                }
                
                if let responseObject = response.result.value{
                    completion(responseObject, nil)
                }
        }
        
    }
    
    //Sorting Data
    
    func sortData(dataArray:[Person]) -> [Person] {
        let sortedArray=dataArray.sort{$0.firstName < $1.firstName}
        return sortedArray
    }
}
