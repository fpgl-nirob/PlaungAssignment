//
//  Others+Extension.swift
//  PlaungAssignment
//
//  Created by mac 2019 on 3/3/22.
//

import Foundation
import UIKit

extension Bundle {
    var versionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    var buildNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
    
    var formattedVersion: String {
        return "\(versionNumber ?? "1.0").\(buildNumber ?? "1")"
    }
}

extension UISwitch {
    func setScale(width: CGFloat, height: CGFloat) {
        
        let standardHeight: CGFloat = 31
        let standardWidth: CGFloat = 51
        let heightRatio = height / standardHeight
        let widthRatio = width / standardWidth

        transform = CGAffineTransform(scaleX: widthRatio, y: heightRatio)
    }
}
