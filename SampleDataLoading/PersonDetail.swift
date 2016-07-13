//
//  PersonDetail.swift
//  SampleDataLoading
//
//  Created by Sanchit Kumar Singh on 7/13/16.
//  Copyright © 2016 Sanchit Kumar Singh. All rights reserved.
//

import UIKit
import Gloss

class PersonDetail: Decodable {
    var personID : String?
    var firstName : String?
    var lastName : String?
    var email : String?
    var phoneNumber : String?
    var profilePic : String?
    var isFavorite : Bool?
    var createdAt : String?
    var updatedAt : String?
    required init (json:JSON){
        personID = "id" <~~ json
        firstName = "first_name" <~~ json
        lastName = "last_name" <~~ json
        profilePic = "profile_pic" <~~ json
        email = "email" <~~ json
        phoneNumber = "phone_number" <~~ json
        isFavorite = "favorite" <~~ json
        createdAt = "created_at" <~~ json
        updatedAt = "updated_at" <~~ json
    }
}
