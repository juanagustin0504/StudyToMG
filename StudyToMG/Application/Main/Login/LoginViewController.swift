//
//  LoginViewController.swift
//  StudyToMG
//
//  Created by Webcash on 2020/03/02.
//  Copyright © 2020 Moonift. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginViewModel: LoginViewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loginViewModel.requestLogin(USER_GB: "1", USER_ID: "1039900001", USER_PW: "697EEFBFFF73D587E809CBAA5A6DFD0E0B4CB018DC850AB6C0F54C07C98D17BE143761E6106148A77F3082C831CBDDECF4613877E111B0FE66F92DBC28AF9C9BDAC5382DBD9EDC97F769446A5207FF0B9620731CA620A5CD11A3A191E4F3C016", APP_OS: "iOS", APP_VER: "1.0.6", INST_YN: "N", RPOD_CD: "SEMO_000") { (error) in
            if error != nil {
                print("ERROR:::::\(error!)")
                return
            }
            print("=====SUCCESS=====")
        }
    }

}
