//
//  Country.swift
//  Project131415
//
//  Created by VII on 24.01.2025.
//

import Foundation

struct Country: Codable {
    var capital: [String] // Массив строк для столицы
    var languages: [String: String] // Словарь для языков
    var currencies: [String: [String: String]] // Словарь для валюты
    var region: String
}
