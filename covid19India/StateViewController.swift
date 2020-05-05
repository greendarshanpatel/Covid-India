//
//  StateViewController.swift
//  covid19India
//
//  Created by Darshan Patel on 2020-04-22.
//  Copyright © 2020 Darshan. All rights reserved.
//

import UIKit

class StateViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var StateTableView: UITableView!
    var DataRecived = [State]()
    var result : StateResponce?
    var selectedItem : State!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "State"
        // Do any additional setup after loading the view.
        callit()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataRecived.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = StateTableView.dequeueReusableCell(withIdentifier: "stateCell") as! StateTableViewCell
        cell.stateLabel.text = DataRecived[indexPath.row].state
        return cell
    }
    
    private func callit() {
            let jsonUrlString = "https://api.covid19india.org/v2/state_district_wise.json"
                    guard let url = URL(string: jsonUrlString) else { return }
                    
                    URLSession.shared.dataTask(with: url) { (data, response, err) in
                        //perhaps check err
                        //also perhaps check response status 200 OK
                        
                        guard let data = data else { return }
                       
                        do {
                            self.result = try JSONDecoder().decode(StateResponce.self, from: data)
                            print(self.result?.data.count as Any)
    //                        guard let _result = self.result else {return}
    //                        onResult(_result)
                            self.DataRecived = self.result?.data ?? []
                             DispatchQueue.main.async {
                                self.StateTableView.reloadData()
                            }
                            
                        } catch let jsonErr {
                            print("Error serializing json:", jsonErr)
                        }
                    }.resume()
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
