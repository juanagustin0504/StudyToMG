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
        let requestBody = LoginModel.Request(USER_GB: USER_GB, USER_ID: USER_ID, USER_PW: USER_PW, APP_OS: APP_OS, APP_VER: APP_VER, INST_YN: INST_YN)
        
        DataAccess.shared.fetch(api: "http://devsemo.wecontent.co.kr/SEMOGate.do?", requestBody: requestBody, responseType: LoginModel.Response.self) { (result) in
            switch result {
            case .failure(let error):
                completion(error)
            case .success(let responseObj):
                self.responseObj = responseObj
                completion(nil)
            }
        }
    }
}
