//
//  String.swift
//  StudyToMG
//
//  Created by Webcash on 2020/03/16.
//  Copyright © 2020 Moonift. All rights reserved.
//

import Foundation
import UIKit

enum FirstOrLast {
    case first
    case last
}

extension String {
    func addAsterix(at: FirstOrLast, color: UIColor = .red) -> NSMutableAttributedString {
        let attriburedString = NSMutableAttributedString(string: "")
        let asterix = NSAttributedString(string: "*", attributes: [.foregroundColor: color.cgColor])
        switch at {
        case .first:
            attriburedString.append(asterix)
            attriburedString.append(NSMutableAttributedString(string: self))
        case .last:
            attriburedString.append(NSMutableAttributedString(string: self))
            attriburedString.append(asterix)
        }
        return attriburedString
    }
}
