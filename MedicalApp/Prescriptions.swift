//
//  Prescriptions.swift
//  MedicalApp
//
//  Created by Justin  Powell on 12/5/18.
//  Copyright © 2018 Justin  Powell. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class Prescriptions: UIViewController {
    var patient: Patient!
    
    
    
    @IBOutlet var instructionsLabel: UILabel!
    @IBOutlet var refillDateLabel: UILabel!
    @IBOutlet var refillLabel: UILabel!
    @IBOutlet var quantityLabel: UILabel!
    @IBOutlet var doseLabel: UILabel!
    @IBOutlet var expirationLabel: UILabel!
    @IBOutlet var dateprescribedLabel: UILabel!
    @IBOutlet var rxLabel: UILabel!
    @IBOutlet var medNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "https://med-data-92861.herokuapp.com/api/prescriptions/byPatient" + patient._id
        Alamofire.request(url).responseJSON(completionHandler: { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.instructionsLabel.text! = json[0]["instructions"].string ?? ""
                let refillDate = json[0]["refillDate"].string ?? ""
                self.refillDateLabel.text! = String(refillDate.prefix(10))
                let refillNum: Int = json[0]["numRefills"].int!
                self.refillLabel.text! = String(refillNum)
                self.doseLabel.text! = json[0]["dose"].string ?? ""
                let expirDate = json[0]["expirationDate"].string ?? ""
                self.expirationLabel.text! = String(expirDate.prefix(10))
                let datePrescr = json[0]["datePrescribed"].string ?? ""
                self.dateprescribedLabel.text! = String(datePrescr.prefix(10))
                self.rxLabel.text! = json[0]["Rx"].string ?? ""
                self.medNameLabel.text! = json[0]["name"].string ?? ""
                self.quantityLabel.text! = json[0]["quantity"].string ?? ""
            case .failure(let error):
                print(error)
            }
        })
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
