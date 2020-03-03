//
//  LoginModel.swift
//  StudyToMG
//
//  Created by Webcash on 2020/03/02.
//  Copyright © 2020 Moonift. All rights reserved.
//

import Foundation

struct LoginModel {
    
    struct Request: Encodable {
        let USER_GB     : String
        let USER_ID     : String
        let USER_PW     : String
        let APP_OS      : String
        let APP_VER     : String
        let INST_YN     : String
        let DEVICE_INFO : DEVICE_INFO
        
        struct DEVICE_INFO: Encodable {
            let _pushserver_kind: String
            let _push_id        : String
            let _model_name     : String
            let _os             : String
            let _company_id     : String
            let _device_id      : String
            let _remark         : String
            let _gubn           : String
            let _after_push_id  : String
        }
        
    }
    
    struct Response: Decodable {
        let USER_ID         : String
        let DEVICE_ID       : String
        let CERT_YN         : String
        let USER_NM         : String
        let BSNN_NO         : String
        let BSNN_NM         : String
        let RPPR_NM         : String
        let ADRS            : String
        let DTL_ADRS        : String
        let EML             : String
        let CLPH_NO         : String
        let USER_LOGIN_NO   : String
        let PAID_SVC_NTRY_YN: String
        let USE_INTT_ID     : String
        let RINST_CERT_YN   : String
        let RINST_CERT_TYPE : String
        let DEVICE_INST_ID  : String
        let TPBS_DIV        : String
        let SETL_DIV        : String
        let CASH_REG_YN     : String
        let CERT_EXPI_STTS  : String
        let BRIF_LIST       : BRIF_LIST
        let POPU_NOTI_LIST  : POPU_NOTI_LIST
        let AC_REG_YN       : String

        struct BRIF_LIST: Decodable {
            let BRIF_TYPE       : String
            let BRIF_CTT        : String
        }

        struct POPU_NOTI_LIST: Decodable {
            let POPUP_REG_NO    : String
            let LNK_PAGE_URL    : String
            let POPU_WDTH_LEN   : String
            let POPU_HIGH_LEN   : String
            let OTPT_SQNC       : String
            let TITL_NM         : String
            let TITL_YN         : String
            let VW_SEUP         : String
        }

    }
    
    
//    {
//      "TRAN_NO": "SCMS_METC_R006",
//      "RESP_DATA": {
//        "PAGE_NO": "1",
//        "PAGE_SZ": "10",
//        "CTNU_YN": "Y",
//        "RSLT_CD": "0000",
//        "REC": [
//          {
//            "BIZ_NO": "",
//            "TX_AMT": "15000.00",
//            "REG_DTM": "20200302181330",
//            "APPR_CONT": "제목1euwueueuwuuwueuuwueuueueueueuueueue",
//            "BZAQ_NM": "사용처",
//            "PAY_TYPE_CD": "9",
//            "SPLY_AMT": "13636.00",
//            "FILE_URL": "http://devsemo.wecontent.co.kr/file/METC/20200303_650b2703-b616-46b8-8edb-159a5ffe2d43.jpg",
//            "ITEM_TAX": "1364.00",
//            "TRSC_WEEK": "금",
//            "STTS": "1",
//            "REG_SEQ_NO": "20200302000000000002",
//            "TRSC_TM": "000000",
//            "TX_SEQ": "",
//            "USER_NM": "박지은",
//            "INQ_GRP": "0000",
//            "TRSC_DT": "20200320",
//            "RCPT_TYPE": "R"
//          },
//          {
//            "BIZ_NO": "",
//            "TX_AMT": "0.00",
//            "REG_DTM": "20200303131743",
//            "APPR_CONT": "",
//            "BZAQ_NM": "",
//            "PAY_TYPE_CD": "1",
//            "SPLY_AMT": "0.00",
//            "FILE_URL": "http://devsemo.wecontent.co.kr/file/METC/20200303_7680378b-28d5-4999-90d5-496142bf0eec.png",
//            "ITEM_TAX": "0.00",
//            "TRSC_WEEK": "화",
//            "STTS": "1",
//            "REG_SEQ_NO": "20200303000000000004",
//            "TRSC_TM": "131733",
//            "TX_SEQ": "",
//            "USER_NM": "",
//            "INQ_GRP": "0000",
//            "TRSC_DT": "20200303",
//            "RCPT_TYPE": "R"
//          },
//          {
//            "BIZ_NO": "",
//            "TX_AMT": "10000.00",
//            "REG_DTM": "20200303104628",
//            "APPR_CONT": "u",
//            "BZAQ_NM": "u",
//            "PAY_TYPE_CD": "1",
//            "SPLY_AMT": "9090.00",
//            "FILE_URL": "http://devsemo.wecontent.co.kr/file/METC/20200303_4fc74173-326b-41c5-b1d5-0ed1c86f99f7.png",
//            "ITEM_TAX": "910.00",
//            "TRSC_WEEK": "화",
//            "STTS": "1",
//            "REG_SEQ_NO": "20200303000000000002",
//            "TRSC_TM": "104628",
//            "TX_SEQ": "",
//            "USER_NM": "박지은",
//            "INQ_GRP": "0000",
//            "TRSC_DT": "20200303",
//            "RCPT_TYPE": "R"
//          },
//          {
//            "BIZ_NO": "",
//            "TX_AMT": "25000.00",
//            "REG_DTM": "20200302182614",
//            "APPR_CONT": "ㄹㄹㄹㄹㄹ",
//            "BZAQ_NM": "ㅇㅇㅇㅇㅇ",
//            "PAY_TYPE_CD": "1",
//            "SPLY_AMT": "22727.00",
//            "FILE_URL": "http://devsemo.wecontent.co.kr/file/METC/20200302_ab7016f6-0c87-4e99-b620-c67fa0982788.jpg",
//            "ITEM_TAX": "2273.00",
//            "TRSC_WEEK": "월",
//            "STTS": "1",
//            "REG_SEQ_NO": "20200302000000000003",
//            "TRSC_TM": "000000",
//            "TX_SEQ": "",
//            "USER_NM": "박지은",
//            "INQ_GRP": "0000",
//            "TRSC_DT": "20200302",
//            "RCPT_TYPE": "R"
//          },
//          {
//            "BIZ_NO": "",
//            "TX_AMT": "0.00",
//            "REG_DTM": "20200302141352",
//            "APPR_CONT": "",
//            "BZAQ_NM": "",
//            "PAY_TYPE_CD": "1",
//            "SPLY_AMT": "0.00",
//            "FILE_URL": "http://devsemo.wecontent.co.kr/file/METC/20200302_d26bba58-4fd4-4fcc-afce-e90d44d424ec.png",
//            "ITEM_TAX": "0.00",
//            "TRSC_WEEK": "월",
//            "STTS": "1",
//            "REG_SEQ_NO": "20200302000000000001",
//            "TRSC_TM": "000000",
//            "TX_SEQ": "",
//            "USER_NM": "박지은",
//            "INQ_GRP": "0000",
//            "TRSC_DT": "20200302",
//            "RCPT_TYPE": "R"
//          },
//          {
//            "BIZ_NO": "",
//            "TX_AMT": "1000000.00",
//            "REG_DTM": "20200227182240",
//            "APPR_CONT": "제목",
//            "BZAQ_NM": "사용처",
//            "PAY_TYPE_CD": "1",
//            "SPLY_AMT": "909090.00",
//            "FILE_URL": "http://devsemo.wecontent.co.kr/file/METC/20200227_0b493fbe-229a-4cef-b59f-22d25a43e157.jpg",
//            "ITEM_TAX": "90910.00",
//            "TRSC_WEEK": "금",
//            "STTS": "1",
//            "REG_SEQ_NO": "20200227000000000007",
//            "TRSC_TM": "000000",
//            "TX_SEQ": "",
//            "USER_NM": "박지은",
//            "INQ_GRP": "2002",
//            "TRSC_DT": "20200228",
//            "RCPT_TYPE": "R"
//          },
//          {
//            "BIZ_NO": "",
//            "TX_AMT": "4545454545545.00",
//            "REG_DTM": "20200227172323",
//            "APPR_CONT": "Title Update",
//            "BZAQ_NM": "Usage",
//            "PAY_TYPE_CD": "1",
//            "SPLY_AMT": "4132231405040.00",
//            "FILE_URL": "http://devsemo.wecontent.co.kr/file/METC/20200227_01124bd3-6c9f-4132-94af-1e8f89fed747.jpg",
//            "ITEM_TAX": "413223140505.00",
//            "TRSC_WEEK": "목",
//            "STTS": "1",
//            "REG_SEQ_NO": "20200227000000000004",
//            "TRSC_TM": "172323",
//            "TX_SEQ": "",
//            "USER_NM": "",
//            "INQ_GRP": "2002",
//            "TRSC_DT": "20200227",
//            "RCPT_TYPE": "R"
//          },
//          {
//            "BIZ_NO": "",
//            "TX_AMT": "50000.00",
//            "REG_DTM": "20200227104508",
//            "APPR_CONT": "ㅇㅌㅌ",
//            "BZAQ_NM": "ㅌㅌ",
//            "PAY_TYPE_CD": "1",
//            "SPLY_AMT": "45454.00",
//            "FILE_URL": "http://devsemo.wecontent.co.kr/file/METC/20200227_c1439d0c-99f4-48e6-9015-ad491d941d25.jpg",
//            "ITEM_TAX": "4546.00",
//            "TRSC_WEEK": "목",
//            "STTS": "1",
//            "REG_SEQ_NO": "20200227000000000001",
//            "TRSC_TM": "104508",
//            "TX_SEQ": "",
//            "USER_NM": "",
//            "INQ_GRP": "2002",
//            "TRSC_DT": "20200227",
//            "RCPT_TYPE": "R"
//          },
//          {
//            "BIZ_NO": "",
//            "TX_AMT": "1000.00",
//            "REG_DTM": "20200220105832",
//            "APPR_CONT": "다이소에 샀다 ",
//            "BZAQ_NM": "누구지?",
//            "PAY_TYPE_CD": "1",
//            "SPLY_AMT": "909.00",
//            "FILE_URL": "http://devsemo.wecontent.co.kr/file/METC/20200221_3e5e5f2a-6a80-4a5a-96ae-d12d26d697a0.jpg",
//            "ITEM_TAX": "91.00",
//            "TRSC_WEEK": "수",
//            "STTS": "1",
//            "REG_SEQ_NO": "20200220000000000001",
//            "TRSC_TM": "102301",
//            "TX_SEQ": "",
//            "USER_NM": "박지은",
//            "INQ_GRP": "2002",
//            "TRSC_DT": "20200226",
//            "RCPT_TYPE": "R"
//          },
//          {
//            "BIZ_NO": "",
//            "TX_AMT": "0.00",
//            "REG_DTM": "20200227140555",
//            "APPR_CONT": "",
//            "BZAQ_NM": "",
//            "PAY_TYPE_CD": "1",
//            "SPLY_AMT": "0.00",
//            "FILE_URL": "http://devsemo.wecontent.co.kr/file/METC/20200227_4f9c288d-d829-4153-8ed6-a90e9547b91f.jpg",
//            "ITEM_TAX": "0.00",
//            "TRSC_WEEK": "월",
//            "STTS": "1",
//            "REG_SEQ_NO": "20200227000000000002",
//            "TRSC_TM": "000000",
//            "TX_SEQ": "",
//            "USER_NM": "",
//            "INQ_GRP": "2002",
//            "TRSC_DT": "20200224",
//            "RCPT_TYPE": "R"
//          }
//        ],
//        "RSLT_MSG": "정상처리 되었습니다."
//      },
//      "RESP_TIME": "135213",
//      "RSLT_CD": "0000",
//      "RESP_DATE": "20200303",
//      "RSLT_MSG": "정상처리 되었습니다."
//    }
    
}
