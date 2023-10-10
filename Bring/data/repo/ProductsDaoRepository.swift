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
        let params: Parameters = ["yemek_adi":searchWord]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let answer = try JSONDecoder().decode(ProductsResponse.self, from: data)
                    if let list = answer.yemekler {
                        self.productsList.onNext(list)
                    }
                } catch {
                    print(error.localizedDescription)
                    
                }
            }
        }
    }
    
}
