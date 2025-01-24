//
//  ViewController.swift
//  Project131415
//
//  Created by VII on 24.01.2025.
//

import UIKit

class ViewController: UITableViewController {
    var countries = [Country]()
    var countriesNameList = ["estonia", "france", "germany", "ireland", "italy", "poland", "russia", "spain", "usa"]
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        loadCountries()
    }
    
    func loadCountries() {
            for countryName in countriesNameList {
                let urlString = "https://restcountries.com/v3.1/name/\(countryName)?fields=capital,languages,region,currencies"
                
                if let url = URL(string: urlString) {
                    // URLSession. Этот объект используется для выполнения HTTP-запросов.
                    // dataTask(with: url) — создает задачу для загрузки данных с указанного URL.
                    // URLSession.dataTask работает в фоновом потоке!!!
                    let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                        guard let data = data, error == nil else {
                            print("Ошибка при загрузке данных для \(countryName): \(error?.localizedDescription ?? "неизвестная ошибка")")
                            return
                        }
                        self?.parse(json: data)
                    }
                    // resume() запускает задачу. Без этого вызова задача будет создана, но не начнет выполняться.
                    task.resume()
                }
            }
        print("Массив стран: \(countries)") 
        }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countriesNameList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        cell.textLabel?.text = countriesNameList[indexPath.row].uppercased()
        
        return cell
    }
    
    func parse(json:Data) {
        let decoder = JSONDecoder()
        
        if let jsonCountries = try? decoder.decode([Country].self, from: json) {
            print("Полученные страны: \(jsonCountries)") // Проверим, что приходит
            
            // Любые изменения в интерфейсе, которые зависят от данных, полученных с помощью URLSession, должны выполняться на главном потоке.
            DispatchQueue.main.async {
                self.countries.append(contentsOf: jsonCountries)
                self.tableView.reloadData() // НУЖЕН ЛИ ЗДЕСЬ reload?
            }

        } else {
            print("Ошибка декодирования")
        }
    }
}


// https://restcountries.com/v3.1/name/russia?fields={capital},{language},{region},{currency}

// https://restcountries.com/v3.1/name/russia?fields=capital,languages,region,currencies
