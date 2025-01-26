//
//  DetailViewController.swift
//  Project131415
//
//  Created by VII on 24.01.2025.
//

import UIKit

class DetailViewController: UITableViewController {
    var detailItem: Country?

    override func viewDidLoad() {
        super.viewDidLoad()

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
        default:
            cell.textLabel?.text = "- - -"
        }
        return cell
    }

}
