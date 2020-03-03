//
//  Request.swift
//  StudyToMG
//
//  Created by Webcash on 2020/03/02.
//  Copyright © 2020 Moonift. All rights reserved.
//

import Foundation

struct Request<T: Encodable>: Encodable {
    let CNTS_CRTS_KEY   : String
    let TRAN_NO         : String
    let DEVICE_INST_ID  : String
    let ENC_YN          : String
    let REQ_DATA        : T
}
