//
//  BagVC.swift
//  Bring
//
//  Created by Tolga Sarikaya on 11.10.23.
//

import UIKit
import Kingfisher

class BagVC: UIViewController {

    
    @IBOutlet weak var bagTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bagTableView.delegate = self
        bagTableView.dataSource = self
        
        bagTableView.separatorColor = UIColor(white: 0.96, alpha: 1)
        
    }
    

  

}

extension BagVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "bagCell") as! BagCell
        
        cell.backgroundColor = UIColor(white: 0.95, alpha: 1)
        cell.cellbackground.layer.cornerRadius = 10.0
        cell.selectionStyle = .none
        
        
        return cell
    }
    
    
}
