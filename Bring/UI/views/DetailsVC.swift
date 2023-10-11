//
//  DetailsVC.swift
//  Bring
//
//  Created by Tolga Sarikaya on 10.10.23.
//

import UIKit
import Kingfisher

class DetailsVC: UIViewController {

    // MARK: - UI Elements
    
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var productNameLabel: UILabel!
    
    @IBOutlet weak var productNumber: UILabel!
    
    @IBOutlet weak var productPriceLabel: UILabel!
    
    @IBOutlet weak var minLabel: UILabel!
    
    @IBOutlet weak var versandLabel: UILabel!
    
    @IBOutlet weak var rabatLabel: UILabel!
    
  
    
    
    var product : Product?
    
    var numberOfProduct = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        minLabel.layer.masksToBounds = true
        minLabel.layer.cornerRadius = 5
        minLabel.adjustsFontSizeToFitWidth = true
        minLabel.minimumScaleFactor = 0.2
        versandLabel.layer.masksToBounds = true
        versandLabel.layer.cornerRadius = 5
        rabatLabel.layer.masksToBounds = true
        rabatLabel.layer.cornerRadius = 5
        
        
        
        productNumber.text = "1"
        
        if let p = product {
            productNameLabel.text = p.yemek_adi
            
            if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(p.yemek_resim_adi!)") {
                DispatchQueue.main.async {
                    self.productImageView.kf.setImage(with: url)
                }
            }
            
            productNameLabel.text = "\(p.yemek_adi!)"
            productPriceLabel.text = "\(p.yemek_fiyat!) $"
        }

    }
    

    // MARK: - Actions
    
    
    
    @IBAction func minButton(_ sender: Any) {
        
        if let p = product, let priceString = p.yemek_fiyat, let price = Int(priceString) {
            if numberOfProduct > 0 {
                numberOfProduct -= 1
                productNumber.text = "\(numberOfProduct)"
                let totalPrice = numberOfProduct * price
                productPriceLabel.text = "\(totalPrice) $"
                
            }
        }
      
    }
    
    @IBAction func plusButton(_ sender: Any) {
        
        if let p = product, let priceString = p.yemek_fiyat, let price = Int(priceString) {
            numberOfProduct += 1
            productNumber.text = "\(numberOfProduct)"
            let totalPrice = numberOfProduct * price
            productPriceLabel.text = "\(totalPrice) $"
        }
       
       
    }
    
    @IBAction func AddToButton(_ sender: Any) {
        
    }
    

}
