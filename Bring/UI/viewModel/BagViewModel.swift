//
//  BagViewModel.swift
//  Bring
//
//  Created by Tolga Sarikaya on 12.10.23.
//

import Foundation

class BagViewModel {
    var bagrepo = BagDaoRepository()
    
    func addToBag(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String, yemek_siparis_adet: String, kullanici_adi: String) {
        bagrepo.addToBag(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat, yemek_siparis_adet: yemek_siparis_adet, kullanici_adi: kullanici_adi)
    }
    
}
