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
        copyDatabase()
        productsList = productRepo.productsList
        uploadProduct()
       
    }
    
    func uploadProduct() {
        productRepo.uploadProducts()
    }
    
    func search(searchWord: String) {
        productRepo.search(searchWord: searchWord)
    }
    
    func copyDatabase(){
            let bundleWay = Bundle.main.path(forResource: "products", ofType: ".sqlite")
            let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let placeToCopy = URL(fileURLWithPath: targetPath).appendingPathComponent("products.sqlite")
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: placeToCopy.path){
                print("Database already exists")
            }else{
                do{
                    try fileManager.copyItem(atPath: bundleWay!, toPath: placeToCopy.path)
                }catch{}
            }
    }
}
