//
//  TableViewCell.swift
//  SampleDataLoading
//
//  Created by Sanchit Kumar Singh on 6/24/16.
//  Copyright © 2016 Sanchit Kumar Singh. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import AlamofireImage

class TableViewCell: UITableViewCell {

    @IBOutlet weak var displayPicture: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bindDataForObject(personData:Person){
        self.userName.text = personData.firstName! + personData.lastName!
        let url = personData.profilePicture!
        self.fetchImage(url, forceFetch: true) { (image, error) in
            self.displayPicture.image = image
            self.displayPicture.layer.cornerRadius=CGRectGetHeight(self.displayPicture.bounds)/2
            self.displayPicture.clipsToBounds=true
        }
    }
    
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
    
    
    
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
