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
        let USER_GB: String
        let USER_ID: String
        let USER_PW: String
        let APP_OS : String
        let APP_VER: String
        let INST_YN: String
    }
    
    struct Response: Decodable {
        
    }
    
}
