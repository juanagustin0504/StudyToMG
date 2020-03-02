//
//  MainViewController.swift
//  StudyToMG
//
//  Created by Webcash on 2020/03/02.
//  Copyright © 2020 Moonift. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let mgViewModel: MGViewModel = MGViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mgViewModel.mg { (error) in
            if error != nil {
                print(":::ERROR:::")
                print(error!)
                return
            }
            
            DispatchQueue.main.async {
                self.showLoginScreen()
            }
            
            
        }
    }
    
    //MARK: - custom method -
    func showLoginScreen() {
        let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(loginVC, animated: true)
        
    }
}
