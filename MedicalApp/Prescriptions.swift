//
//  Prescriptions.swift
//  MedicalApp
//
//  Created by Justin  Powell on 12/5/18.
//  Copyright © 2018 Justin  Powell. All rights reserved.
//

import UIKit

class Prescriptions: UIViewController {
    final let baseURL = "https://med-data-92861.herokuapp.com/api/prescriptions/byPatient"
    var patient: Patient!
    var prescriptions = [String: String]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func getJSON(){
        let endpoint = baseURL + patient._id
        let url = URL(string: endpoint)
        guard let getJSON = url else { return }
        URLSession.shared.dataTask(with: getJSON) { (data, urlResponse, error) in
            guard let data = data, error == nil, urlResponse != nil else {
                print("Error in GET of JSON data")
                return
            }
            print("Successful GET")
            do{
                let decoder = JSONDecoder()
                self.prescriptions = try decoder.decode([String: String].self, from: data)
            }catch {
                print(error)
            }
            }.resume()
        print(prescriptions)
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
