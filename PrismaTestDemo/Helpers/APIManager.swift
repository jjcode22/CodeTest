//
//  APIManager.swift
//  PrimsaTestDemo
//
//  Created by JJMac on 25/07/24.
//

import Foundation
import UIKit

enum FetchError: Error {
    case invalidResponse
    case invalidUrl
    case invalidData
    case decodingError
}

final class APIManager {
    static let shared = APIManager()
    
    func fetchData(completion: @escaping (Result<[Country],FetchError>) -> Void){
        let request = URLRequest(url: URL(string: "https://countriesnow.space/api/v0.1/countries/flag/images")!)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else{
                completion(.failure(.invalidUrl))
                return
            }
            print(data)
            guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return}
            guard let data = data else {
                completion(.failure(.invalidData))
                return}
            do{
                let response = try JSONDecoder().decode(ApiResponse.self, from: data)
                completion(.success(response.data))
            }catch{
                completion(.failure(.decodingError))
            }
            
        }.resume()
    }
    
    
}
