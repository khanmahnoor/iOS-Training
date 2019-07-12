//
//  TableViewCell.swift
//  Codable
//
//  Created by Mahnoor Khan on 11/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var street: UILabel!
    @IBOutlet weak var suite: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var zipcode: UILabel!
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var website: UILabel!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var catchphrase: UILabel!
    @IBOutlet weak var bs: UILabel!
    
    func setUser(user : User) {
        if let uid = user.id {
            self.id.text = String(uid)
        }
        else {
            self.id.text = "None"
        }
        name.text = user.name
        username.text = user.username
        street.text = user.address?.street
        suite.text = user.address?.street
        city.text = user.address?.city
        zipcode.text = user.address?.zipcode
        latitude.text = user.address?.geo?.lat
        longitude.text = user.address?.geo?.lng
        phone.text = user.phone
        website.text = user.website
        companyName.text = user.company?.name
        catchphrase.text = user.company?.catchPhrase
        bs.text = user.company?.bs
    }
}
