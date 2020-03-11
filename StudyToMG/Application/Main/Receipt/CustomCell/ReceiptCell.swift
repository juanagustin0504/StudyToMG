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
    
    func shrink(down: Bool) {
        UIView.animate(withDuration: 0.3, animations: {
            if down {
                self.myView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            }
        }) { (_) in
            UIView.animate(withDuration: 0.3) {
                self.myView.transform = .identity
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        myViewStyle()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        shrink(down: isSelected)
    }
    
    func myViewStyle() {
        self.myView.layer.masksToBounds = true // 지정된 크기를 넘어가는 이미지 자르기
        self.myView.layer.cornerRadius = 16 // 코너 둥글게
        self.myView.layer.borderColor = UIColor.black.cgColor // 테두리 색
        self.myView.layer.borderWidth = 1.0 // 테두리 굵기
    }

}
