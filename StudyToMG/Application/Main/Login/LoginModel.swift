//
//  LoginModel.swift
//  StudyToMG
//
//  Created by Webcash on 2020/03/02.
//  Copyright © 2020 Moonift. All rights reserved.
//

import Foundation

// Login API : http://devsemo.wecontent.co.kr/SEMOGate.do
struct LoginModel {
    
    struct Request: Encodable {
        let USER_GB     : String
        let USER_ID     : String
        let USER_PW     : String
        let APP_OS      : String
        let APP_VER     : String
        let INST_YN     : String
        let RPOD_CD     : String
        let DEVICE_INFO : DEVICE_INFO
        
        struct DEVICE_INFO: Encodable {
            let _pushserver_kind: String
            let _push_id        : String
            let _model_name     : String
            let _os             : String
            let _company_id     : String
            let _device_id      : String
            let _remark         : String
            let _gubn           : String
            let _after_push_id  : String
        }
        
    }
    
    struct Response: Decodable {
        let PAGE_NO : String
        let PAGE_SZ : String
        let CTNU_YN : String
        let RSLT_CD : String
        let RSLT_MSG: String
        let REC     : [REC]
        
        struct REC: Decodable {
            let BIZ_NO      : String
            let TX_AMT      : String
            let REG_DTM     : String
            let APPR_CONT   : String
            let BZAQ_NM     : String
            let PAY_TYPE_CD : String
            let SPLY_AMT    : String
            let FILE_URL    : String
            let ITEM_TAX    : String
            let TRSC_WEEK   : String
            let STTS        : String
            let REG_SEQ_NO  : String
            let TRSC_TM     : String
            let TX_SEQ      : String
            let USER_NM     : String
            let INQ_GRP     : String
            let TRSC_DT     : String
            let RCPT_TYPE   : String
        }

    }
    
}
