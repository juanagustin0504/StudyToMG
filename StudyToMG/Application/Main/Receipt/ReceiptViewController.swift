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
    
    var pageNo: Int = 0
    var pageSz: Int = 10
    
    var sections: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        sections.removeAll()
        receiptObj?.removeAll()
        receiptViewModel.request_SCMS_METC_R006(PAGE_NO: String(self.pageNo), PAGE_SZ: String(self.pageSz)) { (error) in
            if error != nil {
                print(":::::ERROR:::::")
                print(error!)
            }
            print(":::::SUCCESS:::::")
            self.receiptObj = self.receiptViewModel.responseObj?.REC
            for rec in self.receiptObj! {
                if !self.sections.contains(rec.INQ_GRP) {
                    self.sections.append(rec.INQ_GRP)
                }
            }
            
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
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count : Int = 0
        for index in 0 ..< self.receiptObj!.count {
            if self.receiptObj![index].INQ_GRP == sections[section] {
                count -= -1
            }
        }
        
        return count
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
        if sections[section] == "0000" {
            return "이번주"
        }
        let start = sections[section].index(sections[section].startIndex, offsetBy: 0) ..< sections[section].index(sections[section].endIndex, offsetBy: -2) // 20
        let end   = sections[section].index(sections[section].startIndex, offsetBy: 2) ..< sections[section].index(sections[section].endIndex, offsetBy: 0) // 03
        
        let result =  (sections[section])[start] + "년" + (sections[section])[end] + "월"
        let resultStr = String(result)
        print(result)
        print(resultStr)
        
        return resultStr
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112
    }
    
}
