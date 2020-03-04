//
//  MultiReceiptModel.swift
//  StudyToMG
//
//  Created by Webcash on 2020/03/04.
//  Copyright © 2020 Moonift. All rights reserved.
//

import Foundation

struct SCMS_METC_R007 {
    
    struct Request: Encodable {
        let PAGE_NO     : String // 페이지번호
        let PAGE_SZ     : String // 페이지사이즈
        let USE_INTT_ID : String // 이용기관아이디
    }
    
    struct Response: Decodable {
        let PAGE_NO : String // 페이지번호
        let PAGE_SZ : String // 페이지사이즈즈
        let REC     : [REC]
        
        struct REC: Decodable {
            let INQ_GRP     : String // 조회그룹
            let REG_SEQ_NO  : String // 등록일련번호
            let STTS        : String // 상태
            let RCPT_TYPE   : String // 영수증타입
            let TRSC_DT     : String // 거래일자
            let TRSC_TM     : String // 거래시간
            let TRSC_WEEK   : String // 거래요일
            let TX_AMT      : String // 거래금액
            let USE_USAG_CD : String // 용도코드
            let USE_USAG_NM : String // 사용용도
            let BZAQ_NM     : String // 사용처명
            let APPR_TITL   : String // 제목
            let APPR_CONT   : String // 내용
            let TX_SEQ      : String // 제출거래번호
            let USER_NM     : String // 사용자명
            let UPD_ABLE_YN : String // 수정가능여부
            let REG_DV      : String // 등록구분
            let CNFM_YN     : String // 확인여부
            let FILE_LIST   : [FILE_LIST]
            
            struct FILE_LIST: Decodable {
                let FILE_REG_NO : String // 파일등록번호
                let FILE_URL    : String // 파일URL
                let THUMB_YN    : String // 썸네일여부
            }
        }
    }
    
}
