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
    @IBOutlet weak var myImageView: UIImageView! {
        didSet {
            let image = downloadImage(from: URL(string: imageURL))
            myImageView.image = image
        }
    }
    
    var imageURL: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        myViewStyle(myView)
        self.selectionStyle = .none
//        receiptImage = downloadImage(from: URL(string: imageURL)!)
        
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
        myView.layer.cornerRadius = 16 // 코너 둥글게
        myView.layer.borderColor = UIColor.black.cgColor // 테두리 색
        myView.layer.borderWidth = 1.0 // 테두리 굵기
    }
    
    func downloadImage(from url: URL?) -> UIImage? {
        guard let url = url else {
            return UIImage()
        }
        print("Download Started")
        var image: UIImage? = nil
        DataAccess.shared.getData(from: url) { (data, response, error) in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            image = UIImage(data: data)
        }
        return image
    }
}
