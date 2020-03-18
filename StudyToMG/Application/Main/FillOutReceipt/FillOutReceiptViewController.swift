//
//  FillOutReceiptViewController.swift
//  StudyToMG
//
//  Created by Webcash on 2020/03/13.
//  Copyright © 2020 Moonift. All rights reserved.
//

import UIKit

class FillOutReceiptViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var payTypeCash: UIView!
    @IBOutlet weak var payTypeAccount: UIView!
    @IBOutlet weak var payTypeOther: UIView!
    
    @IBOutlet weak var checkCashImg: UIImageView!
    @IBOutlet weak var checkAccountImg: UIImageView!
    @IBOutlet weak var checkOtherImg: UIImageView!
    
    
    @IBOutlet weak var REG_DTM: UILabel! {
        didSet {
            let now = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy년 MM월 dd일"
            self.REG_DTM.text = dateFormatter.string(from: now)
        }
    }
    
    var FILE_URL    : String?
    var TRSC_DT     : String?
    var TRSC_TM     : String?
    var TX_AMT      : String?
    var USE_USAG_CD : String?
    var BZAQ_NM     : String?
    var APPR_CONT   : String?
    var PAY_TYPE_CD : String?
    
    var photoArr: [UIImage?] = []
    var contentArr: [String] = ["사용일시", "증빙제목", "사용내역", "사용금액"]
    var contentDscrArr: [String] = ["사용날짜를 입력하세요", "목록에 보여질 제목을 입력하세요", "사용 내역을 입력하세요", "금액을 입력하세요"]
    var fileURL: [String] = []
    
    let checkImgs: [UIImage?] = [UIImage(named: "ico-info-middle-d-check.png"), UIImage(named: "ico-info-check.png")]
    
    let picker = UIImagePickerController()
    let fillOutTheReceiptViewModel: FillOutTheReceiptViewModel = FillOutTheReceiptViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.picker.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.payTypeCash.addGestureRecognizer(tap1)
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.payTypeAccount.addGestureRecognizer(tap2)
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.payTypeOther.addGestureRecognizer(tap3)
    }
    
    @IBAction func cancelBtnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func okBtnTapped(_ sender: UIButton) {
        self.fillOutTheReceiptViewModel.request_SCMS_METC_C003(
            RCPT_TYPE: "R",
            FILE_URL: "",
            TRSC_DT: "",
            TRSC_TM: "",
            TX_AMT: "",
            USE_USAG_CD: "",
            BZAQ_NM: "ttestt",
            APPR_CONT: "ttestt",
            USER_NM: "",
            PAY_TYPE_CD: "1") { (error) in
                if error != nil {
                    print("FillOutTheReceiptRequest Error ::::: \(error!)")
                    return
                }
                print(self.fillOutTheReceiptViewModel.responseObj?.RESP_DATA.REG_SEQ_NO)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        let tag = sender?.view?.tag
        switch tag {
        case 0:
            self.checkCashImg.image = self.checkImgs[1]
            self.checkAccountImg.image = self.checkImgs[0]
            self.checkOtherImg.image = self.checkImgs[0]
        case 1:
            self.checkCashImg.image = self.checkImgs[0]
            self.checkAccountImg.image = self.checkImgs[1]
            self.checkOtherImg.image = self.checkImgs[0]
        case 2:
            self.checkCashImg.image = self.checkImgs[0]
            self.checkAccountImg.image = self.checkImgs[0]
            self.checkOtherImg.image = self.checkImgs[1]
        default:
            print("Default")
        }
    }
    
    func openLibrary() {
        self.picker.sourceType = .photoLibrary
        self.picker.modalPresentationStyle = .fullScreen
        self.present(self.picker, animated: true)
    }
    
}

//MARK: - delegate -
extension FillOutReceiptViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0, indexPath.row == photoArr.count {
            self.openLibrary()
        } else if indexPath.section == 0 {
            DispatchQueue.main.async {
                self.photoArr.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .fade)
                self.tableView.reloadData()
            }
        }
    }
}

extension FillOutReceiptViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            photoArr.append(image)
            dismiss(animated: true) {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
        if let imageUrl = info[.referenceURL] as? URL {
            print(imageUrl)
            self.fileURL.append(imageUrl.absoluteString)
        }
    }
    
}

//MARK: - dataSource -
extension FillOutReceiptViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.photoArr.count + 1
        } else if section == 1 {
            return self.contentArr.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell") as? PhotoCell else {
                return UITableViewCell()
            }
            
            if indexPath.row == 0 {
                cell.photoLb.attributedText = "사진".addAsterix(at: .first)
            } else {
                cell.photoLb.attributedText = .none
            }
            
            if photoArr.count != 0, indexPath.row != photoArr.count {
                cell.photoView.image = self.photoArr[indexPath.row]
                cell.photoView.contentMode = .scaleToFill
                cell.delBtn.isHidden = false
            } else {
                cell.photoView.image = UIImage(named: "ic-camera.png")
                cell.photoView.contentMode = .center
                cell.delBtn.isHidden = true
            }
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCell") as? ContentCell else {
                return UITableViewCell()
            }
            cell.titleLb.text = contentArr[indexPath.row]
            cell.contentTF.placeholder = contentDscrArr[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
    }
    
    
}
