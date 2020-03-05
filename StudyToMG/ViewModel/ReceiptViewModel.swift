//
//  ReceiptViewModel.swift
//  StudyToMG
//
//  Created by Webcash on 2020/03/04.
//  Copyright © 2020 Moonift. All rights reserved.
//

import Foundation

class ReceiptViewModel {
    var responseObj: SCMS_METC_R006.Response? = nil
    
    func request_SCMS_METC_R006(PAGE_NO: String, PAGE_SZ: String, completion: @escaping (NSError?) -> Void) {
        let requestBody = SCMS_METC_R006.Request(PAGE_NO: PAGE_NO, PAGE_SZ: PAGE_SZ)
        
        DataAccess.shared.fetch(api: "SCMS_METC_R006", requestBody: requestBody, responseType: Response<SCMS_METC_R006.Response>.self) { (result) in
            switch result {
            case .failure(let error):
                completion(error)
            case .success(let success):
                self.responseObj = success.RESP_DATA
                SharedInstance.shared.receiptData = self.responseObj
                completion(nil)
            }
        }
    }
}
