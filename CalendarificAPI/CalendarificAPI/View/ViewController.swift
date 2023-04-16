//
//  ViewController.swift
//  CalendarificAPI
//
//  Created by BerkH on 9.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var CalenderTableView: UITableView!
    
    var response: Response?
    var holidays: [Holiday] = []
    let apiSections = ApiSections()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calendarAPI = CalendarAPI()
        // calendarAPI.getData()
        title = "Holiday Calendar (\(apiSections.country))"
        calendarAPI.getData() {[weak self] (holidays, error) in
            if let error = error {
                print("An error occured: \(error.localizedDescription)")
            } else if let holidays = holidays {
                //print("Total holidays are: \(holidays.count)")
                self?.holidays = holidays
                DispatchQueue.main.async {
                    self?.CalenderTableView.reloadData()
                }
            }
        }
        
        CalenderTableView.delegate = self
        CalenderTableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print("tableview count \(holidays.count)")
        return holidays.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "calendarCell", for: indexPath) as! CalenderTableView
        let holiday = holidays[indexPath.row]
        cell.lblHolidayName.text = holiday.name.capitalized
        cell.lblHolidayDate.text = holiday.date.iso
        return cell
    }
    
}
