//
//  CountryViewModel.swift
//  PrimsaTestDemo
//
//  Created by JJMac on 25/07/24.
//

import Foundation
import SwiftUI

class CountryViewModel {
    var countryData: [Country] = []
    let url = "https://countriesnow.space/api/v0.1/countries/flag/images"
    
    var eventHandler: ((_ event: Event) -> Void)? // data binding closure
    
    func fetchCountries(){
        APIManager.shared.fetchData { [weak self] result
            in
            guard let self = self else {return}
            self.eventHandler?(.stopLoading)
            switch result {
            case .success(let countries):
                self.countryData = countries
                self.eventHandler?(.dataLoaded)
                print("countries are \(countries)")
            case .failure(let error):
                print("Error getting data w \(error.localizedDescription)")
                self.eventHandler?(.error(error))

            }
        }
    }
    
}

extension CountryViewModel{
    enum Event {
            case loading
            case stopLoading
            case dataLoaded
            case error(Error?)
        }
}
