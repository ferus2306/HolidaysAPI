//
//  HolidaysTableViewController.swift
//  API practice
//
//  Created by Firus Hanov on 11/12/19.
//  Copyright © 2019 Firus Hanov. All rights reserved.
//


import UIKit

class HolidaysTableViewController: UITableViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    var listOfHolidays = [HolidayDetail]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.navigationItem.title = "\(self.listOfHolidays.count) Holidays found"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section:
        Int) -> Int {
        return listOfHolidays.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            
            let holiday = listOfHolidays[indexPath.row]
            
            cell.textLabel?.text = holiday.name
            cell.detailTextLabel?.text = holiday.date.iso
            
            
            
            return cell
    }
    
}


// Search Bar clicked function
extension HolidaysTableViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchBarText = searchBar.text else {return}
        let holidayRequest = HolidayRequest(countryCode: searchBarText)
        holidayRequest.getHolidays { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let holidays):
                self?.listOfHolidays = holidays
            }
            
        }
        
    }
}
