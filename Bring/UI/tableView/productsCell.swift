//
//  productsCell.swift
//  Bring
//
//  Created by Tolga Sarikaya on 09.10.23.
//

import UIKit

protocol CellProtokol {
    func addButtonClicked(indexPath: IndexPath)
}

class productsCell: UICollectionViewCell {
    

    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var priceLabel: UILabel!
    
    
    var cellProtokol: CellProtokol?
    var indexPath: IndexPath?
    
    
    
    // MARK: - Action
   
    @IBAction func AddButton(_ sender: Any) {
        cellProtokol?.addButtonClicked(indexPath: indexPath!)
    }
    
    
    
}
