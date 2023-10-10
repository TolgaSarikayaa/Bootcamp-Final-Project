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
    
    
    @IBOutlet weak var productPriceLabel: UILabel!
    
    var product : Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
    }
    
    @IBAction func plusButton(_ sender: Any) {
        
    }
    
    @IBAction func AddToButton(_ sender: Any) {
        
    }
    

}
