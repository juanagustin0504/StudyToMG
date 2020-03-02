//
//  LoginViewController.swift
//  StudyToMG
//
//  Created by Webcash on 2020/03/02.
//  Copyright © 2020 Moonift. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let mgViewModel: MGViewModel = MGViewModel()
    let loginViewModel: LoginViewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let mgResponseObj = mgViewModel.mgResponseObj
//        loginViewModel.requestLogin(USER_GB: <#T##String#>, USER_ID: <#T##String#>, USER_PW: <#T##String#>, APP_OS: <#T##String#>, APP_VER: <#T##String#>, INST_YN: <#T##String#>) { (error) in
//            
//        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
