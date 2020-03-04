//
//  ReceiptModel.swift
//  StudyToMG
//
//  Created by Webcash on 2020/03/04.
//  Copyright © 2020 Moonift. All rights reserved.
//

import Foundation

struct ReceiptModel {
    
    struct Request: Encodable {
        let PAGE_NO : String // 페이지번호
        let PAGE_SZ : String // 페이지사이즈
    }
    
    struct Response: Decodable {
        let PAGE_NO : String // 페이지번호
        let PAGE_SZ : String // 페이지사이즈
        let REC     : [REC]
        
        struct REC: Decodable {
            let INQ_GRP     : String // 조회그룹
            let REG_SEQ_NO  : String // 등록일련번호
            let STTS        : String // 상태
            let RECPT_TYPE  : String // 영수증타입
            let FILE_URL    : String // 파일URL
            let TRSC_DT     : String // 거래일자
            let TRSC_TM     : String // 거래시간
            let TRSC_WEEK   : String // 거래요일
            let TX_AMT      : String // 거래금액
            let USE_USAG_CD : String // 용도코드
            let USE_USAG_NM : String // 사용용도
            let BZAQ_NM     : String // 사용처명
            let APPR_CONT   : String // 내용
            let TX_SEQ      : String // 제출거래번호
            let USER_NM     : String // 사용자명
            let UPD_ABLE_YN : String // 수정가능여부
            let BIZ_NO      : String // 사업자번호
            let SPLY_AMT    : String // 공급가액
            let ITEM_TAX    : String // 부가세액
            let PAY_TYPE_CD : String // 지급분류코드
            let REG_DTM     : String // 등록일시
        }
    }
}
