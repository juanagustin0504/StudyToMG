//
//  FillOutTheReceiptViewModel.swift
//  StudyToMG
//
//  Created by Webcash on 2020/03/17.
//  Copyright © 2020 Moonift. All rights reserved.
//

import Foundation

class FillOutTheReceiptViewModel {
    var responseObj: SCMS_METC_C003.Response? = nil
    
    func request_SCMS_METC_C003(RCPT_TYPE: String,
                                FILE_URL: String,
                                TRSC_DT: String,
                                TRSC_TM: String,
                                TX_AMT: String,
                                USE_USAG_CD: String,
                                BZAQ_NM: String,
                                APPR_CONT: String,
                                USER_NM: String,
                                PAY_TYPE_CD: String,
                                completion: @escaping (NSError?) -> Void) {
        let requestBody = SCMS_METC_C003.Request.REQ_DATA(
                RCPT_TYPE: RCPT_TYPE,
                FILE_URL: FILE_URL,
                TRSC_DT: TRSC_DT,
                TRSC_TM: TRSC_TM,
                TX_AMT: TX_AMT,
                USE_USAG_CD: USE_USAG_CD,
                BZAQ_NM: BZAQ_NM,
                APPR_CONT: APPR_CONT,
                PAY_TYPE_CD: PAY_TYPE_CD)
        
        let api = "SCMS_METC_C0003"
        DataAccess.shared.fetch(api: api, requestBody: requestBody, responseType: Response<SCMS_METC_C003.Response>.self) { (result) in
            switch result {
            case .failure(let error):
                print("result error in ViewModel : \(error)")
                completion(error)
            case .success(let success):
                print(":::::RESPONSE:::::")
                print(":::> \(success)")
                completion(nil)
            }
        }
    }
    
}
