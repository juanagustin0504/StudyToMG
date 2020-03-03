//
//  LoginViewModel.swift
//  StudyToMG
//
//  Created by Webcash on 2020/03/02.
//  Copyright © 2020 Moonift. All rights reserved.
//

import Foundation

class LoginViewModel {
    var responseObj: LoginModel.Response? = nil
    
    func requestLogin(USER_GB: String, USER_ID: String, USER_PW: String, APP_OS: String, APP_VER: String, INST_YN: String, RPOD_CD: String, completion: @escaping (NSError?) -> Void) {
        let requestBody = LoginModel.Request(USER_GB    : USER_GB,
                                             USER_ID    : USER_ID,
                                             USER_PW    : USER_PW,
                                             APP_OS     : APP_OS,
                                             APP_VER    : APP_VER,
                                             INST_YN    : INST_YN,
                                             RPOD_CD    : RPOD_CD,
                                             DEVICE_INFO: LoginModel.Request.DEVICE_INFO(
                                                _pushserver_kind: "APNS",
                                                _push_id        : "56583dafefdaebcf8d20230151c19475cf07c14026b925cc9623cface24f3919",
                                                _model_name     : "iPhone",
                                                _os             : "13.3",
                                                _company_id     : "WEBCASH",
                                                _device_id      : "D4A05E71-B42F-4D02-90F6-0B1AF87E0A5B",
                                                _remark         : "iOS",
                                                _gubn           : "C",
                                                _after_push_id  : "56583dafefdaebcf8d20230151c19475cf07c14026b925cc9623cface24f3919"))
        print("==============================LOGIN REQUEST==============================")
        print(requestBody)
        print("=========================================================================")
        DataAccess.shared.fetch(api: "SUPARK_SVC_P001", requestBody: requestBody, responseType: Response<LoginModel.Response>.self) { (result) in
            switch result {
            case .failure(let error):
                completion(error)
            case .success(let responseObj):
                self.responseObj = responseObj.RESP_DATA
                completion(nil)
            }
        }
    }
}
