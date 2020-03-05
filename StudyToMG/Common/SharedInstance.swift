//
//  SharedInstance.swift
//  StudyToMG
//
//  Created by Webcash on 2020/03/03.
//  Copyright © 2020 Moonift. All rights reserved.
//

import Foundation

class SharedInstance {
    static let shared = SharedInstance()
    
    private init() {}
    
    var c_site_url: String = ""
    
    var receiptData: SCMS_METC_R006.Response!
}
