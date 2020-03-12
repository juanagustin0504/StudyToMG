//
//  DetailViewController.swift
//  StudyToMG
//
//  Created by Webcash on 2020/03/12.
//  Copyright © 2020 Moonift. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView! // 사진
    @IBOutlet weak var REG_DTM: UILabel! { // 등록일시
        didSet {
            self.REG_DTM.text = self.regDtm
        }
    }
    @IBOutlet weak var TRSC_DT: UILabel! { // 사용일자
        didSet {
            if self.trscDt == "" { self.trscDt = "-"}
            self.TRSC_DT.text = self.trscDt
        }
    }
    @IBOutlet weak var BZAQ_NM: UILabel! { // 증빙제목
        didSet {
            if self.bzaqNm == "" { self.bzaqNm = "-"}
            self.BZAQ_NM.text = self.bzaqNm
        }
    }
    @IBOutlet weak var TX_AMT: UILabel!  { // 사용금액
        didSet {
            if self.txAmt == "" { self.txAmt = "-"}
            self.TX_AMT.text = self.txAmt
        }
    }
    @IBOutlet weak var PAY_TYPE_CD_1: UIButton! // 지급분류_현금
    @IBOutlet weak var PAY_TYPE_CD_2: UIButton! // 지급분류_계좌
    @IBOutlet weak var PAY_TYPE_CD_9: UIButton! // 지급분류_기타
    @IBOutlet weak var APPR_CONT: UILabel! { // 내용
        didSet {
            if self.apprCont == "" { self.apprCont = "-"}
            self.APPR_CONT.text = self.apprCont
        }
    }
    
    var imageURL    : String? = ""
    var regDtm      : String? = ""
    var trscDt      : String? = ""
    var bzaqNm      : String? = ""
    var txAmt       : String? = ""
    var payTypeCode : String? = ""
    var apprCont    : String? = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        DispatchQueue.main.async {
            DataAccess.shared.getData(from: URL(string: self.imageURL!)!, completion: { (data, response, error) in
                if error != nil {
                    print(error! as NSError)
                    return
                }
                guard let data = data else {
                    return
                }
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
                
            })
        }
        changeButtonFromPayTypeCode(payTypeCode ?? "1")
    }
    
    @IBAction func cancelBtnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func okBtnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func myViewStyle(_ myView: UIView) {
        myView.layer.masksToBounds = true // 지정된 크기를 넘어가는 이미지 자르기
        myView.layer.cornerRadius = 16 // 코너 둥글게
        myView.layer.borderColor = UIColor.black.cgColor // 테두리 색
        myView.layer.borderWidth = 1.0 // 테두리 굵기
    }
    
    func changeButtonFromPayTypeCode(_ PAY_TYPE_CD: String) {
        if PAY_TYPE_CD == "1" {
            self.PAY_TYPE_CD_1.imageView?.image = UIImage(named: "checkmark.circle.fill")
            self.PAY_TYPE_CD_2.imageView?.image = UIImage(named: "checkmark.circle")
            self.PAY_TYPE_CD_9.imageView?.image = UIImage(named: "checkmark.circle")
        } else if PAY_TYPE_CD == "2" {
            self.PAY_TYPE_CD_1.imageView?.image = UIImage(named: "checkmark.circle")
            self.PAY_TYPE_CD_2.imageView?.image = UIImage(named: "checkmark.circle.fill")
            self.PAY_TYPE_CD_9.imageView?.image = UIImage(named: "checkmark.circle")
        } else if PAY_TYPE_CD == "9" {
            self.PAY_TYPE_CD_1.imageView?.image = UIImage(named: "checkmark.circle")
            self.PAY_TYPE_CD_2.imageView?.image = UIImage(named: "checkmark.circle")
            self.PAY_TYPE_CD_9.imageView?.image = UIImage(named: "checkmark.circle.fill")
        }
        
    }
    
}
