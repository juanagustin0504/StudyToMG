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
    
    func requestLogin(USER_GB: String, USER_ID: String, USER_PW: String, APP_OS: String, APP_VER: String, INST_YN: String, completion: @escaping (NSError?) -> Void) {
        let requestBody = LoginModel.Request(USER_GB: USER_GB,
                                             USER_ID: USER_ID,
                                             USER_PW: USER_PW,
                                             APP_OS: APP_OS,
                                             APP_VER: APP_VER,
                                             INST_YN: INST_YN,
                                             DEVICE_INFO: LoginModel.Request.DEVICE_INFO(_pushserver_kind: "",
                                                                                         _push_id: "",
                                                                                         _model_name: "",
                                                                                         _os: "",
                                                                                         _company_id: "",
                                                                                         _device_id: "",
                                                                                         _remark: "",
                                                                                         _gubn: "",
                                                                                         _after_push_id: ""))
        
        DataAccess.shared.fetch(api: "http://devsemo.wecontent.co.kr/SEMOGate.do?", requestBody: requestBody, responseType: Response<LoginModel.Response>.self) { (result) in
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
