//
//  CountryCell.swift
//  PrimsaTestDemo
//
//  Created by JJMac on 25/07/24.
//

import UIKit

class CountryCell: UITableViewCell {


    @IBOutlet weak var backgroundCellView: UIView!
    
    @IBOutlet weak var countryPhone: UILabel!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    var country: Country? {
        didSet{//property observer
            configureCountry()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundCellView.clipsToBounds = true
        backgroundCellView.layer.cornerRadius = 15
        
        flagImageView.layer.cornerRadius = 10
        self.backgroundCellView.backgroundColor = .systemGray6.withAlphaComponent(0.4)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configureCountry(){
        guard let country = country else {return}
        //Country Name
        countryName.text = country.name
        //Country Phone
        countryPhone.text = "+ 91"
        //Country Flag
        flagImageView.setImage(with: country.flag)
    }
}
