//
//  Patient.swift
//  MedicalApp
//
//  Created by Justin  Powell on 11/27/18.
//  Copyright © 2018 Justin  Powell. All rights reserved.
//

import UIKit

class Patients: Codable {
    let patients: [Patient]
    
    init(patients: [Patient]) {
        self.patients = patients
    }
}

class Patient: Codable {
    let firstName: String
    let lastName: String
    let dob: String
    let _id: String
    let email: String
    let phone: String
    let address: String
    
    init(firstName: String, lastName: String, dob: String, _id: String, email: String, phone: String, address: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.dob = dob
        self._id = _id
        self.email = email
        self.phone = phone
        self.address = address
    }
    
    
}
