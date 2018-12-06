//
//  PatientInfo.swift
//  MedicalApp
//
//  Created by Justin  Powell on 12/5/18.
//  Copyright © 2018 Justin  Powell. All rights reserved.
//

import UIKit
import MessageUI

class PatientInfo: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet var DOBlabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var emailButton: UIButton!
    @IBOutlet var phoneButton: UIButton!
    var patient: Patient!
    
    @IBAction func phoneAction(_ sender: UIButton) {
        guard let numberStr = sender.titleLabel?.text,
            let url = URL(string:"tel://\(numberStr)") else {return}
        UIApplication.shared.open(url)
        print(numberStr)
    }
    
    @IBAction func emailAction(_ sender: UIButton) {
        let mailVC = MFMailComposeViewController()
        mailVC.mailComposeDelegate = self
        mailVC.setToRecipients([patient.email])
        mailVC.setSubject("COP4330")
        mailVC.setMessageBody("Welcome to Patient Connect", isHTML: false)
        present(mailVC, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addressLabel.text! = patient.address
        DOBlabel.text! = String(patient.dob.prefix(10))
        phoneButton.setTitle(patient.phone, for: .normal)
        emailButton.setTitle(patient.email, for: .normal)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
