//
//  StringExtensions.swift
//  SWTestApp
//
//  Created by Zach Eidenberger on 8/19/21.
//

import Foundation
import UIKit
import CoreGraphics



extension String {
    func isValidPassword() -> Bool {
        if self.count > 7 {
            var foundFault = false
            for i in self {
                if i == " " {
                    foundFault = true
                }
                if foundFault {
                    return false
                }else {
                    return true
                }
            }
        }
        return false
    }
    
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
}

extension CGFloat {
    func convertDegressToRadians(degrees: CGFloat) -> CGFloat {
        return degrees * .pi / 180
    }
}

extension NSObject {
    var className: String {
        return String(describing: Mirror(reflecting: self).subjectType)
    }
}

extension UIView {
    func loadAndShowNib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.className, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
    }
}

