//
//  HomePageVC.swift
//  Bring
//
//  Created by Tolga Sarikaya on 09.10.23.
//

import UIKit
import Kingfisher

class HomePageVC: UIViewController {

    
    @IBOutlet weak var collectionViewProduct: UICollectionView!
    
    
    var productsList = [Product]()
    
    
   var viewModel = HomaPageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewProduct.delegate = self
        collectionViewProduct.dataSource = self
        
        _ = viewModel.productsList.subscribe(onNext: { list in
            self.productsList = list
            self.collectionViewProduct.reloadData()
        })
        
        let style = UICollectionViewFlowLayout()
        style.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        style.minimumInteritemSpacing = 10
        style.minimumLineSpacing = 10
        
        let viewWidth = UIScreen.main.bounds.width
        let itemWidth = (viewWidth - 30) / 2
        
        style.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.6)
        
        collectionViewProduct.collectionViewLayout = style
      
        
       
    }
    

}

extension HomePageVC : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let product = productsList[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCell", for: indexPath) as! productsCell
        
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(product.yemek_resim_adi!)") {
            DispatchQueue.main.async {
                cell.imageView.kf.setImage(with: url)
            }
        }
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.3
        cell.layer.cornerRadius = 10.0
        
        return cell
        
    }
    
    /*
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = productsList[indexPath.row]
        
        
    }
    */
    
}
