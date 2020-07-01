//
//  NetworkManager.swift
//  Covid-iOS
//
//  Created by Avijeet Sachdev on 6/30/20.
//  Copyright © 2020 Avijeet Sachdev. All rights reserved.
//

import Foundation

class NetworkManager {
    func fetchCovidCases(completion: @escaping ([Case]?) -> (Void)) {
        guard let url = URL(string: Constants.currentURL) else { fatalError("Invalid URL") }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(nil)
            }
            
            let casesList = try? JSONDecoder().decode([Case].self, from: data)
            completion(casesList)
        }.resume()
    }
}
