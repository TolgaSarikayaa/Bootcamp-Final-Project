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
    
   
    
    var allProducts: [Product] = []
    
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
        let lowercaseSearchWord = searchWord.lowercased()
        
        var searchResult = [Product]()
        
        for product in allProducts {
            if product.yemek_adi!.lowercased().contains(lowercaseSearchWord) {
                searchResult.append(product)
            }
        }
        
        self.productsList.onNext(searchResult)
    }
    
  
    
}
