//
//  MGViewModel.swift
//  StudyToMG
//
//  Created by Webcash on 2020/03/02.
//  Copyright © 2020 Moonift. All rights reserved.
//

import Foundation

class MGViewModel {
    var mgResposneOjb: MGModel.MGResponse? = nil
    
    func mg(completion: @escaping (NSError?) -> Void) {
        let api = "https://sportal-dev.bizplay.co.kr/MgGate?master_id=I_SEMO_G_1_v1.0.6"
        
        DataAccess.shared.fetchMG(api: api, responseType: MGModel.MGResponse.self) { (result) in
            switch result {
            case .failure(let error):
                completion(error)
            case .success(let responseObj):
                print("====================RESPONSE====================")
                print(responseObj)
                self.mgResposneOjb = responseObj
                completion(nil)
            }
        }
    }
}
