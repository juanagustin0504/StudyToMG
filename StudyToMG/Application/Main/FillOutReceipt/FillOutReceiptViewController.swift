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
    
    var photoArr: [UIImage?] = []
    var contentArr: [String] = ["사용일시", "증빙제목", "사용내역", "사용금액"]
    var contentDscrArr: [String] = ["사용날짜를 입력하세요", "목록에 보여질 제목을 입력하세요", "사용 내역을 입력하세요", "금액을 입력하세요"]
    
    let checkImgs: [UIImage?] = [UIImage(named: "ico-info-middle-d-check.png"), UIImage(named: "ico-info-check.png")]
    
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.picker.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.payTypeCash.addGestureRecognizer(tap)
        self.payTypeAccount.addGestureRecognizer(tap)
        self.payTypeOther.addGestureRecognizer(tap)
    }
    
    @IBAction func cancelBtnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func okBtnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deletePhotoBtnTapped(_ sender: UIButton) {
        
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
    }
    
}

//MARK: - dataSource -
extension FillOutReceiptViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return photoArr.count + 1
        } else if section == 1 {
            return contentArr.count
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
