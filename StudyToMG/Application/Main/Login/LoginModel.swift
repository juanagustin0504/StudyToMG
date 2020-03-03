//
//  LoginModel.swift
//  StudyToMG
//
//  Created by Webcash on 2020/03/02.
//  Copyright © 2020 Moonift. All rights reserved.
//

import Foundation

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
        
        let RINST_CERT_YN   : String?
        let BSNN_NO         : String?
        let USER_LOGN_NO    : String?
        let USER_ID         : String?
        let USE_INTT_ID     : String?
        let AC_REG_YN       : String?
        let ADRS            : String?
        let TPBS_DIV        : String?
        let CLPH_NO         : String?
        let SETL_DIV        : String?
        let PROD_CD         : String?
        let BSNN_NM         : String?
        let CERT_EXPI_STTS  : String?
        let CERT_YN         : String?
        let USER_NM         : String?
        let RINST_CERT_TYPE : String?
        let EMAIL_YN        : String?

    }
    
}
