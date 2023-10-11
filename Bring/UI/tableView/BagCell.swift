//
//  BagCell.swift
//  Bring
//
//  Created by Tolga Sarikaya on 11.10.23.
//

import UIKit

class BagCell: UITableViewCell {

  
    
    @IBOutlet weak var cellbackground: UIView!
    
    @IBOutlet weak var imageViewBag: UIImageView!
    
    @IBOutlet weak var yemekAdiLabel: UILabel!
    
    @IBOutlet weak var yemekFiyatiLabel: UILabel!
    
    @IBOutlet weak var urunSayisiLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
