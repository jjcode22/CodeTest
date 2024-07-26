//
//  CountryViewController.swift
//  PrimsaTestDemo
//
//  Created by JJMac on 25/07/24.
//

import UIKit

class CountryViewController: UIViewController {
    
    //MARK: - properties
    private var viewModel = CountryViewModel()
    
    @IBOutlet weak var tableView = UITableView()
    
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    //MARK: - Helpers
    

}

extension CountryViewController{
    
    func configuration(){

        tableView?.register(UINib(nibName: "CountryCell", bundle: nil), forCellReuseIdentifier: "CountryCell")
        initViewModel()
        observeEvent()
    }
    
    func initViewModel(){
        viewModel.fetchCountries()
        
    }
    
    func observeEvent(){
        viewModel.eventHandler = { [weak self] event in
            guard let self = self else {return}
            
            switch event{
            case .loading:
                //show indicator
                print("countries loading...")
            case .stopLoading:
                //hide indicator
                print("Stopped loading...")
            case .dataLoaded:
                print("data loaded...")
                DispatchQueue.main.async {
                    // UI related task in main thread
                    self.tableView?.reloadData()
                }
            case .error(let error):
                print(error)
            }
        }
    }
}


extension CountryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.countryData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell") as? CountryCell else {return UITableViewCell()}
        let country = viewModel.countryData[indexPath.row]
        cell.country = country
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
    
    
    
    
}
