//
//  DataAccess.swift
//  StudyToMG
//
//  Created by Webcash on 2020/03/02.
//  Copyright © 2020 Moonift. All rights reserved.
//

import Foundation

class DataAccess {
    private static var sharedInstance = DataAccess()
    private static var sessionConfig: URLSessionConfiguration!
    
    static var shared: DataAccess = {
        sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 120
        sessionConfig.timeoutIntervalForResource = 120
        return sharedInstance
    }()
    
    func fetchMG(api: String,
                 responseType: MGModel.MGResponse.Type,
                 completion: @escaping (Result<MGModel.MGResponse, NSError>) -> Void) {
        guard let URL = URL(string: api) else {
            return
        }
        
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL) { (data, response, error) in
            if error != nil {
                completion(.failure(error! as NSError))
                return
            }
            
            guard let data = data else {
                let dataError = NSError(domain: "data error", code: 1001, userInfo: [:])
                completion(.failure(dataError))
                return
            }
            
            guard let dataString = String(data: data, encoding: .utf8) else { return }
            //            print("dataString:::::\(dataString)")
            guard let decodeString = dataString.removingPercentEncoding else { return }
            print("decodeString::::::\(decodeString)")
            guard let dataResult = decodeString.data(using: .utf8) else { return }
            print("dataResult::::::\(dataResult)")
            
            do {
                let responseObj = try JSONDecoder().decode(responseType.self, from: dataResult)
                completion(.success(responseObj))
            } catch {
                let decodeError = NSError(domain: "decode error", code: 1002, userInfo: [:])
                completion(.failure(decodeError))
            }
            
        }.resume()
        
    }
    
    func fetch<I: Encodable, O: Decodable>(api: String,
                                           requestBody: I,
                                           responseType: O.Type,
                                           completion: @escaping (Result<O, NSError>) -> Void) {
        guard let URL = URL(string: SharedInstance.shared.c_site_url + "/SEMOGate.do") else {
            return
        }
        
        let requestData = Request(CNTS_CRTS_KEY: "d18b0e32-4f3f-408e-ba27-d106a67ec98b",
                                  TRAN_NO: api,
                                  DEVICE_INST_ID: "DEVICE_INST_ID",
                                  ENC_YN: "",
                                  REQ_DATA: requestBody)
        
        let session = URLSession(configuration: .default)
        
        var request = URLRequest(url: URL)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(requestData)
        
        session.dataTask(with: request) { (data, response, error) in
            if error != nil {
                completion(.failure(error! as NSError))
                return
            }
            
            guard let data = data else {
                let dataError = NSError(domain: "data binding Error", code: 1001, userInfo: [:])
                completion(.failure(dataError))
                return
            }
            
            guard let dataString = String(data: data, encoding: .utf8) else { return }
            guard let decodeString = dataString.removingPercentEncoding else { return }
            print("decodeString::::::\(decodeString)")
            guard let dataResult = decodeString.data(using: .utf8) else { return }
            
            do {
                let responseObj = try JSONDecoder().decode(responseType.self, from: dataResult)
                print("==============================RESPONSE==============================")
                print(responseObj)
                print("====================================================================")
                completion(.success(responseObj))
                
            } catch {
                completion(.failure(error as NSError))
            }
        }.resume()
    }
}
