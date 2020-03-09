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
    
    var pageNo: Int = 0
    var pageSz: Int = 30
    
    var sections: [String] = [String]()
    
    var dict: [String:String] = [String:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        receiptObj?.removeAll()
        receiptViewModel.request_SCMS_METC_R006(PAGE_NO: String(self.pageNo), PAGE_SZ: String(self.pageSz)) { (error) in
            if error != nil {
                print(":::::ERROR:::::")
                print(error!)
            }
            print(":::::SUCCESS:::::")
            self.receiptObj = self.receiptViewModel.responseObj?.REC
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK: - action -
    @IBAction func backToMain(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

//MARK: - delegate -
extension ReceiptViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt indexPath : \(indexPath.row)")
    }
    
}

//MARK: - datasource -
extension ReceiptViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pageSz
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiptCell") as? ReceiptCell else {
            return UITableViewCell()
        }
        cell.titleLb.text   = receiptObj?[indexPath.row].BZAQ_NM ?? ""
        cell.dateLb.text    = receiptObj?[indexPath.row].TRSC_DT ?? ""
        cell.amountLb.text  = receiptObj?[indexPath.row].TX_AMT ?? ""
        cell.dayOfWeek      = receiptObj?[indexPath.row].TRSC_WEEK ?? ""
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "TEST"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112
    }
    
}
