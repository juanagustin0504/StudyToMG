//
//  FillOutReceiptCell.swift
//  StudyToMG
//
//  Created by Webcash on 2020/03/13.
//  Copyright © 2020 Moonift. All rights reserved.
//

import Foundation
import UIKit

class PhotoCell: UITableViewCell {
    
    @IBOutlet weak var receiptImageView: UIImageView!
    @IBOutlet weak var photoLb: UILabel!
    @IBOutlet weak var photoView: UIImageView! {
        didSet {
            self.photoView.image = photo
        }
    }
    @IBOutlet weak var delBtn: UIButton!
    
    let photo = UIImage(named: "ic-camera.png")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        myViewStyle(self.receiptImageView, color: .lightGray)
        self.delBtn.tintColor = .lightGray
        self.selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}

class ContentCell: UITableViewCell {
    
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var contentTF: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
