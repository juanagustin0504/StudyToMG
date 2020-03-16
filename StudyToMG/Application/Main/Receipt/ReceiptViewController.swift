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
    var receiptDataResult : [(key: String, value: [SCMS_METC_R006.Response.REC])]? = nil
    var pageNo: Int = 0
    var pageSz: Int = 50
    
    var sections: [String] = [String]()

    
//    var dic : SCMS_METC_R006.Response.REC! = nil
    
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
                return
            }
            print(":::::SUCCESS:::::")
            self.receiptObj = self.receiptViewModel.responseObj?.REC
            
            let dictionary = Dictionary(grouping: self.receiptObj!, by: { (element: SCMS_METC_R006.Response.REC) in
                return element.INQ_GRP
            })
            print("===================> dictionary \(dictionary)")
            
            var sortedDic = dictionary.sorted { $0.0! > $1.0! }
            
            if sortedDic[0].key == "0000" {
                let startGroupElement = sortedDic.popLast()
                sortedDic.insert(startGroupElement!, at: 0)
            }
            
            self.receiptDataResult = sortedDic as? [(key: String, value: [SCMS_METC_R006.Response.REC])]
            print("===================> sorted Array \(String(describing: self.receiptDataResult))")
            print("===================> sorted Array Count \(self.receiptDataResult!.count)")
            
//            for rec in self.receiptObj! {
//                if !self.sections.contains(rec.INQ_GRP) {
//                    self.sections.append(rec.INQ_GRP)
//                }
//            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    func calcDate(section: Int, row: Int) -> String {
        let data = self.receiptDataResult![section].value[row]
        guard data.TRSC_DT != "", data.TRSC_WEEK != "" else {
            return ""
        }
        let month = data.TRSC_DT!.index(data.TRSC_DT!.startIndex, offsetBy: 4) ..< data.TRSC_DT!.index(data.TRSC_DT!.startIndex, offsetBy: 6)
        let day   = data.TRSC_DT!.index(data.TRSC_DT!.startIndex, offsetBy: 6) ..< data.TRSC_DT!.index(data.TRSC_DT!.startIndex, offsetBy: 8)
        let monthInt = Int(data.TRSC_DT![month])!
        let dayInt   = Int(data.TRSC_DT![day])!
        let dateDataResult = String(monthInt) + "월 " + String(dayInt) + "일"
        return dateDataResult
    }
    
    
    
    //MARK: - action -
    @IBAction func backToMain(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

//MARK: - delegate -
extension ReceiptViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = self.receiptDataResult![indexPath.section].value[indexPath.row]
        print("didSelectRowAt indexPath : \(indexPath.row)")
        let detailSb = UIStoryboard(name: "Detail", bundle: nil)
        let vc = detailSb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.imageURL     = data.FILE_URL
        vc.regDtm       = data.REG_DTM
        vc.trscDt       = data.TRSC_DT
        vc.bzaqNm       = data.BZAQ_NM
        vc.txAmt        = data.TX_AMT
        vc.payTypeCode  = data.PAY_TYPE_CD
        vc.apprCont     = data.APPR_CONT
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

//MARK: - datasource -
extension ReceiptViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return receiptDataResult?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.receiptDataResult![section].value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = self.receiptDataResult![indexPath.section].value[indexPath.row]
        if data.RCPT_TYPE == "R" {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiptCell") as? ReceiptCell else {
                return UITableViewCell()
            }
            
            cell.titleLb.text   = data.BZAQ_NM
            cell.dateLb.text    = calcDate(section: indexPath.section, row: indexPath.row)
            cell.amountLb.text  = data.TX_AMT
            
            return cell
        } else if data.RCPT_TYPE == "P" {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoReceiptCell") as? PhotoReceiptCell else {
                return UITableViewCell()
            }
            
            cell.titleLb.text   = data.BZAQ_NM
            cell.dateLb.text    = calcDate(section: indexPath.section, row: indexPath.row)
            cell.imageURL       = data.FILE_URL!
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = self.receiptDataResult![section].key
        if section == "0000" {
            return "이번주"
        }
        let start = section.index(section.startIndex, offsetBy: 0) ..< section.index(section.endIndex, offsetBy: -2)
        let end   = section.index(section.startIndex, offsetBy: 2) ..< section.index(section.endIndex, offsetBy: 0)
        
        let result =  section[start] + "년" + section[end] + "월"
        let resultStr = String(result)
//        print(result)
//        print(resultStr)
        
        return resultStr
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let data = self.receiptDataResult![indexPath.section].value[indexPath.row]
        if data.RCPT_TYPE == "R" { return 100 }
        else if data.RCPT_TYPE == "P" { return 180 }
        else { return 0 }
    }
    
}
