//
//  BagDaoRepository.swift
//  Bring
//
//  Created by Tolga Sarikaya on 12.10.23.
//

import Foundation
import Alamofire
import RxSwift

class BagDaoRepository {
    var bagList = BehaviorSubject<[BringTheFood]>(value: [BringTheFood]())
    
    
    func addToBag(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, yemek_siparis_adet: Int, kullanici_adi: String) {
        let params : Parameters = ["yemek_adi": yemek_adi,"yemek_resim_adi": yemek_resim_adi,"yemek_fiyat":yemek_fiyat,"yemek_siparis_adet": yemek_siparis_adet,"kullanici_adi":kullanici_adi]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php", method: .post,parameters: params).response { response in
            if let data = response.data {
                do {
                    let answer = try JSONDecoder().decode(CRUDResponse.self, from: data)
                    print("success: \(answer.success!)")
                    print("message: \(answer.message!)")
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func uploadBag(kullanici_adi: String) {
        
       let params: Parameters = ["kullanici_adi":kullanici_adi]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let answer = try JSONDecoder().decode(BringTheFoodResponse.self, from: data)
                    if let list = answer.sepet_yemekler {
                        self.bagList.onNext(list)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
