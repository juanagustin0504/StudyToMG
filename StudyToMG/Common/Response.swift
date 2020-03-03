//
//  Response.swift
//  StudyToMG
//
//  Created by Webcash on 2020/03/02.
//  Copyright © 2020 Moonift. All rights reserved.
//

import Foundation

struct Response<T: Decodable>: Decodable {
    let RSLT_CD         : String
    let RSLT_MSG        : String
    let RSLT_PROC_GB    : String
    let RESP_DATA       : T
}
