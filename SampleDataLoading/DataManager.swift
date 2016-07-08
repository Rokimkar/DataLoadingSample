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
    
    func fetchContactListJSON(url:String,completion:([Dictionary<String,AnyObject>]?) -> Void){
        Alamofire.request(.GET, "http://gojek-contacts-app.herokuapp.com/contacts.json").validate().responseJSON{
            response in
            print(response.data)
            let data = response.data
            var decodedData:[Dictionary<String,AnyObject>]!
            do{
                decodedData = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions()) as! [Dictionary<String,AnyObject>]
                completion(decodedData)
                //print(decodedData)
            }catch{
                
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
}
