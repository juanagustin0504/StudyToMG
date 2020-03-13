//
//  DetailViewController.swift
//  StudyToMG
//
//  Created by Webcash on 2020/03/12.
//  Copyright © 2020 Moonift. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var imageView: UIImageView! // 사진
    @IBOutlet weak var REG_DTM: UILabel! { // 등록일시
        didSet {
            let year = self.regDtm!.index(self.regDtm!.startIndex, offsetBy: 0) ..< self.regDtm!.index(self.regDtm!.startIndex, offsetBy: 4)
            let month = self.regDtm!.index(self.regDtm!.startIndex, offsetBy: 4) ..< self.regDtm!.index(self.regDtm!.startIndex, offsetBy: 6)
            let day = self.regDtm!.index(self.regDtm!.startIndex, offsetBy: 6) ..< self.regDtm!.index(self.regDtm!.startIndex, offsetBy: 8)
            let resultString = String(self.regDtm![year]) + "년 " + String(self.regDtm![month]) + "월 " + String(self.regDtm![day]) + "일"
            self.REG_DTM.text = resultString
        }
    }
    @IBOutlet weak var photoText: UILabel! { // *사진
        didSet {
            let attriburedString = NSMutableAttributedString(string: "")
            let asterix = NSAttributedString(string: "*", attributes: [.foregroundColor: UIColor.red.cgColor])
            attriburedString.append(asterix)
            attriburedString.append(NSMutableAttributedString(string: "사진"))
            self.photoText.attributedText = attriburedString
        }
    }
    @IBOutlet weak var TRSC_DT: UILabel! { // 사용일자
        didSet {
            var resultString = ""
            if self.trscDt == "" {
                resultString = "-"
            } else {
                let year = self.trscDt!.index(self.trscDt!.startIndex, offsetBy: 0) ..< self.trscDt!.index(self.trscDt!.startIndex, offsetBy: 4)
                let month = self.trscDt!.index(self.trscDt!.startIndex, offsetBy: 4) ..< self.trscDt!.index(self.trscDt!.startIndex, offsetBy: 6)
                let day = self.trscDt!.index(self.trscDt!.startIndex, offsetBy: 6) ..< self.trscDt!.index(self.trscDt!.startIndex, offsetBy: 8)
                resultString = String(self.trscDt![year]) + "년 " + String(self.trscDt![month]) + "월 " + String(self.trscDt![day]) + "일"
            }
            self.TRSC_DT.text = resultString
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
            var resultString = ""
            if self.txAmt == "" {
                resultString = "-"
            } else {
                let txAmtInt = (txAmt! as NSString).integerValue
                let value: NSNumber = txAmtInt as NSNumber
                let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                guard let resultValue = formatter.string(from: value) else { return }
                resultString = resultValue
            }
            self.TX_AMT.text = resultString + "원"
        }
    }
    @IBOutlet weak var PAY_TYPE_CD_1: UIImageView! // 지급분류_현금
    @IBOutlet weak var PAY_TYPE_CD_2: UIImageView! // 지급분류_계좌
    @IBOutlet weak var PAY_TYPE_CD_9: UIImageView! // 지급분류_기타
    @IBOutlet weak var APPR_CONT: UITextView! { // 내용
        didSet {
            if self.apprCont == "" { self.apprCont = "-" }
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
    
    var checkImg: [UIImage?] = [ UIImage(named: "ico-info-middle-d-check.png"), UIImage(named: "ico-info-check.png")]

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
        myViewStyle(imageView)
        myViewStyle(myView)
    }
    
    @IBAction func cancelBtnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func okBtnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func myViewStyle(_ myView: UIView) {
        myView.layer.masksToBounds = true // 지정된 크기를 넘어가는 이미지 자르기
        myView.layer.cornerRadius = 10 // 코너 둥글게
        myView.layer.borderColor = UIColor.lightGray.cgColor // 테두리 색
        myView.layer.borderWidth = 1.0 // 테두리 굵기
    }
    
    func changeButtonFromPayTypeCode(_ PAY_TYPE_CD: String) {
        if PAY_TYPE_CD == "1" {
            self.PAY_TYPE_CD_1.image = checkImg[1]
            self.PAY_TYPE_CD_2.image = checkImg[0]
            self.PAY_TYPE_CD_9.image = checkImg[0]
        } else if PAY_TYPE_CD == "2" {
            self.PAY_TYPE_CD_1.image = checkImg[0]
            self.PAY_TYPE_CD_2.image = checkImg[1]
            self.PAY_TYPE_CD_9.image = checkImg[0]
        } else if PAY_TYPE_CD == "9" {
            self.PAY_TYPE_CD_1.image = checkImg[0]
            self.PAY_TYPE_CD_2.image = checkImg[0]
            self.PAY_TYPE_CD_9.image = checkImg[1]
        }
        
    }
    
}
