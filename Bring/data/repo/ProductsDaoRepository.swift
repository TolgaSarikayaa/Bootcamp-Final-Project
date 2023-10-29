//
//  ProductsDaoRepository.swift
//  Bring
//
//  Created by Tolga Sarikaya on 09.10.23.
//

import Foundation
import RxSwift
import Alamofire

class ProductsDaoRepository {
    var productsList = BehaviorSubject<[Product]>(value: [Product]())
   
    
    let db:FMDatabase?
    
    init() {
        let bundleWay = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: bundleWay).appendingPathComponent("products.sqlite")
        db = FMDatabase(path: databaseURL.path)
    }
    
    // MARK: - Funtions
    func uploadProducts() {
        
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php", method: .get).response { response in
            if let data = response.data {
                do {
                    let response = try JSONDecoder().decode(ProductsResponse.self, from: data)
                    if let list = response.yemekler {
                        self.productsList.onNext(list)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }

    }
    
    func search(searchWord: String) {
        db?.open()
        var list = [Product]()
       
        
        do {
            let result = try db!.executeQuery("SELECT * FROM products WHERE yemek_adi like '%\(searchWord)%' ",
                                              values: nil)
            
            while result.next(){
                let products = Product(yemek_id: result.string(forColumn: "yemek_id")!,
                                       yemek_adi: result.string(forColumn: "yemek_adi")!,
                                       yemek_resim_adi: "",
                                       yemek_fiyat: "")
                
                list.append(products)
            }
            productsList.onNext(list)
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
        
    }
    
}
