//
//  MedicalHistory.swift
//  MedicalApp
//
//  Created by Justin  Powell on 12/5/18.
//  Copyright © 2018 Justin  Powell. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class MedicalHistory: UIViewController {
    
    var patient: Patient!
    
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var strokeLabel: UILabel!
    @IBOutlet var seizuresLabel: UILabel!
    @IBOutlet var allergiesLabel: UILabel!
    @IBOutlet var highbpressureLabel: UILabel!
    @IBOutlet var anemiaLabel: UILabel!
    @IBOutlet var drinksLabel: UILabel!
    @IBOutlet var smokesLabel: UILabel!
    @IBOutlet var pacemakerLabel: UILabel!
    @IBOutlet var diabetesLabel: UILabel!
    @IBOutlet var cancerLabel: UILabel!
    @IBOutlet var kidneyDiseaseLabel: UILabel!
    @IBOutlet var liverDiseaseLabel: UILabel!
    @IBOutlet var respiratoryDiseaseLabel: UILabel!
    @IBOutlet var heartDiseaseLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var sexLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonUrlString = "https://med-data-92861.herokuapp.com/api/medicalHistory/" + patient._id
        Alamofire.request(jsonUrlString).responseJSON(completionHandler: { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.weightLabel.text! = json[0]["weight"].string ?? ""
                self.heightLabel.text! = json[0]["height"].string ?? ""
                self.sexLabel.text! = json[0]["sex"].string ?? ""
                self.heartDiseaseLabel.text! = json[0]["heartDisease"].string ?? ""
                self.respiratoryDiseaseLabel.text! = json[0]["respiratoryDisease"].string ?? ""
                self.liverDiseaseLabel.text! = json[0]["liverDisease"].string ?? ""
                self.kidneyDiseaseLabel.text! = json[0]["kidneyDisease"].string ?? ""
                self.cancerLabel.text! = json[0]["cancer"].string ?? ""
                self.diabetesLabel.text! = json[0]["diabetes"].string ?? ""
                self.pacemakerLabel.text! = json[0]["pacemaker"].string ?? ""
                self.smokesLabel.text! = json[0]["smoke"].string ?? ""
                self.drinksLabel.text! = json[0]["alcohol"].string ?? ""
                self.anemiaLabel.text! = json[0]["anemia"].string ?? ""
                self.highbpressureLabel.text! = json[0]["highbPressure"].string ?? ""
                self.allergiesLabel.text! = json[0]["allergies"].string ?? ""
                self.seizuresLabel.text! = json[0]["siezures"].string ?? "N/A"
                self.strokeLabel.text! = json[0]["stroke"].string ?? ""
            case .failure(let error):
                print(error)
            }
        })
    }
        
        
        
        //                self.weightLabel.text! = medhis.weight
        //                self.heightLabel.text! = medhis.height
        //                self.sexLabel.text! = medhis.sex
        //                self.heartDiseaseLabel.text! = medhis.heartDisease
        //                self.respiratoryDiseaseLabel.text! = medhis.respiratoryDisease
        //                self.liverDiseaseLabel.text! = medhis.liverDisease
        //                self.kidneyDiseaseLabel.text! = medhis.kidneyDisease
        //                self.cancerLabel.text! = medhis.cancer
        //                self.diabetesLabel.text! = medhis.diabetes
        //                self.pacemakerLabel.text! = medhis.pacemaker
        //                self.smokesLabel.text! = medhis.smoke
        //                self.drinksLabel.text! = medhis.alcohol
        //                self.anemiaLabel.text! = medhis.anemia
        //                self.highbpressureLabel.text! = medhis.highbPressure
        //                self.allergiesLabel.text! = medhis.allergies
        //                self.seizuresLabel.text! = medhis.siezures
        //                self.strokeLabel.text! = medhis.stroke
}
