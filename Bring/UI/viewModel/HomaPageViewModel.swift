//
//  HomaPageViewModel.swift
//  Bring
//
//  Created by Tolga Sarikaya on 09.10.23.
//

import Foundation
import RxSwift

class HomaPageViewModel {
    var productRepo = ProductsDaoRepository()
    var productsList = BehaviorSubject<[Product]>(value: [Product]())
    
    init() {
        productsList = productRepo.productsList
        uploadProduct()
    }
    
    func uploadProduct() {
        productRepo.uploadProducts()
    }
    
    func search(searchWord: String) {
        productRepo.search(searchWord: searchWord)
    }
}
