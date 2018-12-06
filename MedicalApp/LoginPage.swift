//
//  Login.swift
//  MedicalApp
//
//  Created by Justin  Powell on 11/12/18.
//  Copyright © 2018 Justin  Powell. All rights reserved.
//

import UIKit

class Login: UIViewController {

    @IBOutlet var passwordText: UITextField!
    @IBOutlet var usernameText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameText.delegate = self
        passwordText.delegate = self
    }

}

extension Login : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
