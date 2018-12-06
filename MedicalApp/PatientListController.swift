//
//  ViewController.swift
//  MedicalApp
//
//  Created by Justin  Powell on 11/12/18.
//  Copyright © 2018 Justin  Powell. All rights reserved.
//

import UIKit

class PatientListController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    final let url = URL(string: "https://med-data-92861.herokuapp.com/api/patients/")
    var patients = [Patient]()
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        getJSON()
    }
    
    func getJSON() {
        guard let getJSON = url else { return }
        URLSession.shared.dataTask(with: getJSON) { (data, urlResponse, error) in
            guard let data = data, error == nil, urlResponse != nil else {
                print("Error in GET of JSON data")
                return
            }
            print("Successful GET")
            do{
                let decoder = JSONDecoder()
                self.patients = try decoder.decode(Array<Patient>.self, from: data)
                print(self.patients[0]._id)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch {
                print(error)
            }
        }.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Patient Cell") as? PatientCell
            else { return UITableViewCell() }
        cell.nameLabel.text = patients[indexPath.row].firstName + " " + patients[indexPath.row].lastName
        return cell
    }
    
    var pat: Patient?
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("yeet")
        pat = patients[indexPath.row]
        self.performSegue(withIdentifier: "Patient Select", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let info = segue.destination as! RootPageViewController
        info.patient = pat
    }
}

