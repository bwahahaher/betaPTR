//
//  File.swift
//  betaPTR
//
//  Created by UNIFORM on 27.04.2023.
//

import Foundation

struct ApiRequests {
    func fetchApi() {
        let urlString = "https://api.bm-app.com/search"
        let url = URL(string: urlString)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) {
            data, response, error in
            if let data = data {
                let dataString = String(data: data, encoding: .utf8)
                print(dataString)
            }
            
        }
        task.resume()
    }
}
