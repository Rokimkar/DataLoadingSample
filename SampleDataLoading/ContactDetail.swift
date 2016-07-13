//
//  ContactDetail.swift
//  SampleDataLoading
//
//  Created by Sanchit Kumar Singh on 7/13/16.
//  Copyright © 2016 Sanchit Kumar Singh. All rights reserved.
//

import UIKit

class ContactDetail: UIViewController {
    
    @IBOutlet weak var contactNumber: UILabel!
    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var displayPicture: UIImageView!
    var personDetail:PersonDetail!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contactName.text = "\(personDetail!.firstName!) \(personDetail!.lastName!)"
        self.contactNumber.text = personDetail!.phoneNumber!;
        //fetch contact Display picture
        DataManager.sharedInstance.fetchImage(personDetail!.profilePic!, forceFetch: true) { (image, error) in
            if(error==nil){
                self.displayPicture.image = image!;
                self.displayPicture.layer.cornerRadius=CGRectGetHeight(self.displayPicture.bounds)/2
                self.displayPicture.clipsToBounds=true
            }else{
               self.displayPicture.image = UIImage(named:"displayPicture") 
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
