//
//  MGViewModel.swift
//  StudyToMG
//
//  Created by Webcash on 2020/03/02.
//  Copyright © 2020 Moonift. All rights reserved.
//

import Foundation

class MGViewModel {
    var mgResponseObj: MGModel.MGResponse? = nil
    
    func mg(completion: @escaping (NSError?) -> Void) {
        let api = "https://sportal-dev.bizplay.co.kr/MgGate?master_id=I_SEMO_G_1_v1.0.6"
        
        print("==============================MG==============================")
        DataAccess.shared.fetchMG(api: api, responseType: MGModel.MGResponse.self) { (result) in
            switch result {
            case .failure(let error):
                completion(error)
            case .success(let responseObj):
                print("==============================RESPONSE==============================")
                print(responseObj)
                self.mgResponseObj = responseObj
                SharedInstance.shared.mgData = responseObj
                SharedInstance.shared.c_site_url = responseObj.RESP_DATA._tran_res_data[0].c_site_url // http://devsemo.wecontent.co.kr
                completion(nil)
            }
        }
    }
}
