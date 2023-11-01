//
//  BagVC.swift
//  Bring
//
//  Created by Tolga Sarikaya on 11.10.23.
//

import UIKit
import Kingfisher

class BagVC: UIViewController {

    // MARK: - UI Elements
    @IBOutlet weak var bagTableView: UITableView!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    @IBOutlet weak var payButton: UIButton!
    
    // MARK: - Properties
    var viewModel = BagViewModel()
    var bagList = [BringTheFood]()
    
     override func viewDidLoad() {
        super.viewDidLoad()
         
         if let tabBarController = self.tabBarController {
             if let tabBarItem = tabBarController.tabBar.items?[1] {
                 tabBarItem.badgeValue = nil
             }
         }
        
        payButton.layer.cornerRadius = 10.0
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.trash, target: self, action: #selector(deleteButton))
        
        bagTableView.delegate = self
        bagTableView.dataSource = self
        
        bagTableView.separatorColor = UIColor(white: 0.96, alpha: 1)
        
        _ = viewModel.bringTheFood.subscribe(onNext: { list in
            self.bagList = list
            
            DispatchQueue.main.async {
                self.bagTableView.reloadData()
            }
        })
    }
    
    // MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        viewModel.uploadBag()
        updateTotalPriceLabel()
    }
   
    // MARK: - Actions
    @IBAction func payButton(_ sender: Any) {
        
    }
    
    @objc func deleteButton() {
        let trashMode = bagTableView.isEditing
        bagTableView.setEditing(!trashMode, animated: true)
        updateTotalPriceLabel()
       
    }
    
    
    // MARK: - Funtions
    func updateTotalPriceLabel() {
        let totalAmount = bagList.reduce(0.0) { (result, item) -> Double in
            if let priceString = item.yemek_fiyat, let price = Double(priceString) {
                return result + price
            }
            return result
        }

        let formattedTotalAmount = String(format: "%.2f$", totalAmount)
        
        DispatchQueue.main.async {
            self.totalPriceLabel.text = formattedTotalAmount
        }
    }
}

// MARK: - Extensions
extension BagVC : UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bagList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bag = bagList[indexPath.row]
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "BagCell") as! BagCell
            cell.urunSayisiLabel.text = "Stück:  \(String(bag.yemek_siparis_adet!))"
            cell.yemekAdiLabel.text = bag.yemek_adi
            cell.yemekFiyatiLabel.text = "Preis: \(String(bag.yemek_fiyat!))$"
            
            if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(bag.yemek_resim_adi!)") {
                DispatchQueue.main.async {
                    cell.imageViewBag.kf.setImage(with: url)
                }
            }
            
            cell.backgroundColor = UIColor(white: 0.95, alpha: 1)
            cell.cellbackground.layer.cornerRadius = 10.0
            cell.selectionStyle = .none
            return cell
    }
    
    // MARK: - Funtions
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { contextualAction, view, bool in
            let product = self.bagList[indexPath.row]
            
            let alert = UIAlertController(title: "Delete", message: "\(product.yemek_adi!) should it be deleted", preferredStyle: UIAlertController.Style.alert)
            
            let cancelAction = UIAlertAction(title: "cancel", style: .cancel)
            alert.addAction(cancelAction)
            
            let yesAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.destructive) { action in
                self.viewModel.delete(sepet_yemek_id: Int(product.sepet_yemek_id!)!, kullanici_adi: product.kullanici_adi!)
            }
            alert.addAction(yesAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return.delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { contextualAction, view, bool in
                let product = self.bagList[indexPath.row]
                
                let alert = UIAlertController(title: "Delete", message: "\(product.yemek_adi!) should it be deleted", preferredStyle: UIAlertController.Style.alert)
                
                let cancelAction = UIAlertAction(title: "cancel", style: .cancel)
                alert.addAction(cancelAction)
                
                let yesAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.destructive) { action in
                    self.viewModel.delete(sepet_yemek_id: Int(product.sepet_yemek_id!)!, kullanici_adi: product.kullanici_adi!)
                }
                alert.addAction(yesAction)
                self.present(alert, animated: true)
            }
        }
    }
}
