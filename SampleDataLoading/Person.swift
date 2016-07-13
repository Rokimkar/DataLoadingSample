//
//  Person.swift
//  SampleDataLoading
//
//  Created by Sanchit Kumar Singh on 6/30/16.
//  Copyright © 2016 Sanchit Kumar Singh. All rights reserved.
//

import UIKit
import Gloss

class Person: Decodable {
        var firstName : String?
        var lastName : String?
        var profilePicture : String?
        var url : String?
        var personId : String?
        required init(json: JSON){
            firstName = "first_name" <~~ json
            lastName = "last_name" <~~ json
            profilePicture = "profile_pic" <~~ json
            url = "url" <~~ json
            
            //Making first letter UPPERCASE useful while sorting.
            
            firstName!.replaceRange(firstName!.startIndex...firstName!.startIndex, with: String(firstName![firstName!.startIndex]).capitalizedString)
    }
}
