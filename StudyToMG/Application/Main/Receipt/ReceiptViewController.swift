//
//  ReceiptViewController.swift
//  StudyToMG
//
//  Created by Webcash on 2020/03/03.
//  Copyright © 2020 Moonift. All rights reserved.
//

import UIKit

class ReceiptViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let receiptViewModel: ReceiptViewModel = ReceiptViewModel()
    var receiptObj : [SCMS_METC_R006.Response.REC]? = nil
    
    var curDate: Date = Date(timeIntervalSinceNow: 0)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        receiptObj?.removeAll()
        receiptViewModel.request_SCMS_METC_R006(PAGE_NO: "0", PAGE_SZ: "10") { (error) in
            if error != nil {
                print(":::::ERROR:::::")
                print(error!)
            }
            print(":::::SUCCESS:::::")
            self.receiptObj = self.receiptViewModel.responseObj?.REC
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
            print(self.curDate)
            
        }
    }
    
    //MARK: - action -
    @IBAction func backToMain(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

//MARK: - delegate -
extension ReceiptViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        if section == 0 {
            title = "이번주"
        } else if section == 1 {
            
        }
        return title
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
        }
    }
    
}

//MARK: - datasource -
extension ReceiptViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiptCell") as? ReceiptCell else {
            return UITableViewCell()
        }
        cell.titleLb.text   = receiptObj?[indexPath.row].BZAQ_NM ?? "목포횟집"
        cell.dateLb.text    = receiptObj?[indexPath.row].TRSC_DT ?? "5월 30일"
        cell.amountLb.text  = receiptObj?[indexPath.row].TX_AMT ?? "-500,000"
        cell.dayOfWeek      = receiptObj?[indexPath.row].TRSC_WEEK ?? "목"
        
        return cell
    }
    
    
}
