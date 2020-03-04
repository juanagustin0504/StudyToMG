//
//  ReceiptViewController.swift
//  StudyToMG
//
//  Created by Webcash on 2020/03/03.
//  Copyright © 2020 Moonift. All rights reserved.
//

import UIKit

class ReceiptViewController: UIViewController {
    
    let receiptViewModel: ReceiptViewModel = ReceiptViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        receiptViewModel.request_SCMS_METC_R006(PAGE_NO: "0", PAGE_SZ: "10") { (error) in
            if error != nil {
                print(":::::ERROR:::::")
                print(error!)
            }
            print(":::::SUCCESS:::::")
            print(self.receiptViewModel.responseObj ?? "nil")
            print(":::::::::::::::::")
        }
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
