//
//  BagViewModel.swift
//  Bring
//
//  Created by Tolga Sarikaya on 12.10.23.
//

import Foundation
import RxSwift

class BagViewModel {
    var bagrepo = BagDaoRepository()
    var bringTheFood = BehaviorSubject<[BringTheFood]>(value: [BringTheFood]())
    
    var BagList = [BringTheFood]()
    
    
    
    init() {
        bringTheFood = bagrepo.bagList
        uploadBag()
    }
    
    func addToBag(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, 
                  yemek_siparis_adet: Int,
                  kullanici_adi: String) {
        
        bagrepo.addToBag(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat, yemek_siparis_adet: yemek_siparis_adet, kullanici_adi: kullanici_adi)
    }
    
    func uploadBag() {
        bagrepo.uploadBag(kullanici_adi:"tolga_sarikaya")
    }
    
    func delete(sepet_yemek_id: Int, kullanici_adi: String) {
        bagrepo.delete(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
    }
    
}
    
    

