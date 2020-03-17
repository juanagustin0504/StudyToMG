//
//  FillOutTheReceiptModel.swift
//  StudyToMG
//
//  Created by Webcash on 2020/03/17.
//  Copyright © 2020 Moonift. All rights reserved.
//

import Foundation

struct SCMS_METC_C003 {
    
    struct Request: Encodable {
        let REQ_DATA: REQ_DATA
        
        struct REQ_DATA: Encodable {
            let RCPT_TYPE   : String
            let FILE_URL    : String
            let TRSC_DT     : String?
            let TRSC_TM     : String?
            let TX_AMT      : String?
            let USE_USAG_CD : String?
            let BZAQ_NM     : String?
            let APPR_CONT   : String
            let PAY_TYPE_CD : String?
        }
    }
    
    struct Response: Decodable {
        let RESP_DATA: RESP_DATA
        
        struct RESP_DATA: Decodable {
            let REG_SEQ_NO: String
        }
    }
    
    
}
