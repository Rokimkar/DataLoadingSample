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
    
    func fetchContactListJSON(url:String,completion:(NSData?) -> Void){
        Alamofire.request(.GET, "http://gojek-contacts-app.herokuapp.com/contacts.json").validate().responseJSON{
            response in
            print(response.data)
            //if(response.response)
        }
//        let headers = [
//            "content-type": "application/json",
//            "cache-control": "no-cache"]
//        let request = NSMutableURLRequest(URL : NSURL(string: "http://gojek-contacts-app.herokuapp.com/contacts.json")!, cachePolicy: .UseProtocolCachePolicy,timeoutInterval: 60.0)
//        
//        request.HTTPMethod="GET"
//        request.allHTTPHeaderFields = headers
//        
//        let session = NSURLSession.sharedSession()
//        let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
//            if (error != nil) {
//                print(error)
//            } else {
//                let httpResponse = response as? NSHTTPURLResponse
//                print(httpResponse)
//                completion(data)
//            }
//        })
//        
//        dataTask.resume()
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
