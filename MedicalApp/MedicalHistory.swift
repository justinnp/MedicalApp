//
//  MedicalHistory.swift
//  MedicalApp
//
//  Created by Justin  Powell on 12/5/18.
//  Copyright © 2018 Justin  Powell. All rights reserved.
//

import UIKit

class MedicalHistory: UIViewController {
    
    struct MedHis: Decodable {
        let sex: String
        let height: String
        let weight: String
        let heartDisease: String
        let highbPressure: String
        let stroke: String
        let pacemaker: String
        let respiratoryDisease: String
        let siezures: String
        let anemia: String
        let liverDisease: String
        let kidneyDisease: String
        let diabetes: String
        let cancer: String
        let allergies: String
        let alcohol: String
        let smoke: String
        
//        init(json: [String: Any]){
//            sex = json["sex"] as? String ?? ""
//            height = json["height"] as? String ?? ""
//            weight = json["weight"] as? String ?? ""
//            heartDisease = json["heartDisease"] as? String ?? ""
//            highbPressure = json["highbPressure"] as? String ?? ""
//            stroke = json["stroke"] as? String ?? ""
//            pacemaker = json["pacemaker"] as? String ?? ""
//            respiratoryDisease = json["respiratoryDisease"] as? String ?? ""
//            siezures = json["siezures"] as? String ?? ""
//            anemia = json["anemia"] as? String ?? ""
//            liverDisease = json["liverDisease"] as? String ?? ""
//            kidneyDisease = json["kidneyDisease"] as? String ?? ""
//            diabetes = json["diabetes"] as? String ?? ""
//            cancer = json["cancer"] as? String ?? ""
//            allergies = json["allergies"] as? String ?? ""
//            alcohol = json["alcohol"] as? String ?? ""
//            smoke = json["smoke"] as? String ?? ""
//        }
    }
    
    var patient: Patient!
    var medicalHistory = [String: Any]()
    
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
        print("yoot")
        let jsonUrlString = "https://med-data-92861.herokuapp.com/api/medicalHistory/" + patient._id
        
        
        
        //                let medhis = MedHis(json: json)
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
}
