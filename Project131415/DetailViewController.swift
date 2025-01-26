//
//  DetailViewController.swift
//  Project131415
//
//  Created by VII on 24.01.2025.
//

import UIKit

class DetailViewController: UITableViewController {
    var detailItem: Country?
    var selectedCountryName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedCountryName
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        guard let country = detailItem else {
            cell.textLabel?.text = "No data"
            return cell
        }
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Capital: \(country.capital[0])"
        case 1:
            let languages = country.languages.values.joined(separator: ", ")
            cell.textLabel?.text = "Language: \(languages)"
        case 2:
            let currencies = country.currencies.keys.joined(separator: "") //joined убрать - [ ]
            cell.textLabel?.text = "Currencies: \(currencies)"
        case 3:
            cell.textLabel?.text = "Region: \(country.region)"
        default:
            cell.textLabel?.text = "- - -"
        }
        return cell
    }

}

//  Example
//{
//  "currencies": {
//    "EUR": {
//      "name": "Euro",
//      "symbol": "€"
//    }
//  },
//  "capital": [
//    "Tallinn"
//  ],
//  "region": "Europe",
//  "languages": {
//    "est": "Estonian"
//  }
//}
//]
