//
//  MGModel.swift
//  StudyToMG
//
//  Created by Webcash on 2020/02/26.
//  Copyright © 2020 Moonift. All rights reserved.
//

import Foundation

struct MGModel {
    
    struct MGRequest: Encodable { }
    
    struct MGResponse: Decodable {
        let RESP_DATA: RES
        
        struct RES: Decodable {
            let _tran_res_data: [TRAN_RES_DATA]
        }
        
        struct TRAN_RES_DATA: Decodable {
            let c_act_yn                    : Bool
            let c_act_close                 : Bool
            let c_register_yn               : Bool
            let c_update_close              : Bool
            let c_available_service         : Bool
            let _locale                     : String
            let _master_id                  : String
            let c_act                       : String
            let c_site_url                  : String // 공통 URL, 뒤에 API 붙여서 사용.
            let c_update_act                : String
            let c_minimum_ver               : String
            let c_program_ver               : String
            let c_update_date               : String
            let c_appstore_url              : String
            let c_register_url              : String
            let c_session_time              : String
            let c_forget_pw_url             : String
            let c_appstore_semotalk_url     : String
            
            let _oid_list                   : [OID_LIST]
            let _bank_list                  : [BANK_LIST]
        }
        
        struct OID_LIST: Decodable {
            let c_oid                   : String
            let c_oid_explain           : String
            let c_oid_gb                : String
        }
        
        struct BANK_LIST: Decodable {
            let c_bank_cd               : String
            let c_bank_name             : String
            let c_bank_scrap_cd         : String
            let c_id_input_yn           : String
            let c_display_order         : Int
        }
    }
    
}
