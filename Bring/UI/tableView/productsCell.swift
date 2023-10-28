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
    
    // MARK: - UI Elements
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Properties
    var cellProtokol: CellProtokol?
    var indexPath: IndexPath?
    
    
    
    // MARK: - Action
    @IBAction func AddButton(_ sender: Any) {
        cellProtokol?.addButtonClicked(indexPath: indexPath!)
    }
    
    
    
}
