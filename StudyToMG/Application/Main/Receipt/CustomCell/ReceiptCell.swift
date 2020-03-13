//
//  ReceiptCell.swift
//  StudyToMG
//
//  Created by Webcash on 2020/03/03.
//  Copyright © 2020 Moonift. All rights reserved.
//

import UIKit

class ReceiptCell: UITableViewCell {
    
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var dateLb: UILabel!
    @IBOutlet weak var amountLb: UILabel!
    
    var dayOfWeek: String? = nil
    var receiptImage: UIImage? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        myViewStyle(myView)
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        shrink(down: isSelected)
    }

}

class PhotoReceiptCell : UITableViewCell {
    
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var dateLb: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    var imageURL: String = ""
    var receiptImage: UIImage? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        myViewStyle(myView)
        DispatchQueue.main.async {
            DataAccess.shared.getData(from: URL(string: self.imageURL)!, completion: { (data, response, error) in
                if error != nil {
                    print(error! as NSError)
                    return
                }
                guard let data = data else {
                    return
                }
                DispatchQueue.main.async {
                    self.myImageView.image = UIImage(data: data)
                }
                
            })
        }
        
        self.selectionStyle = .none
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        shrink(down: isSelected)
    }
    
    
}

//MARK: - extension -
extension UITableViewCell {
    
    func shrink(down: Bool) {
        UIView.animate(withDuration: 0.3, animations: {
            if down {
                self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            }
        }) { (_) in
            UIView.animate(withDuration: 0.3) {
                self.transform = .identity
            }
        }
    }
    
    func myViewStyle(_ myView: UIView) {
        myView.layer.masksToBounds = true // 지정된 크기를 넘어가는 이미지 자르기
        myView.layer.cornerRadius = 10 // 코너 둥글게
        myView.layer.borderColor = UIColor.black.cgColor // 테두리 색
        myView.layer.borderWidth = 1.0 // 테두리 굵기
    }
}
