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
    @IBOutlet weak var REG_DTM: UILabel! // 등록일시
    @IBOutlet weak var TRSC_DT: UILabel! // 사용일자
    @IBOutlet weak var BZAQ_NM: UILabel! // 증빙제목
    @IBOutlet weak var TX_AMT: UILabel!  // 사용금액
    @IBOutlet weak var PAY_TYPE_CD_1: UIButton! // 지급분류_현금
    @IBOutlet weak var PAY_TYPE_CD_2: UIButton! // 지급분류_계좌
    @IBOutlet weak var PAY_TYPE_CD_9: UIButton! // 지급분류_기타
    @IBOutlet weak var APPR_CONT: UILabel! // 내용
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelBtnTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func okBtnTapped(_ sender: UIButton) {
        
    }
    
}
