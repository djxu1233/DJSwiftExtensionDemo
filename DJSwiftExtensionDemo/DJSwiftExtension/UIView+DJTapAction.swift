//
//  UIView+DJTapAction.swift
//  DJSwiftExtensionDemo
//
//  Created by minstone.DJ on 2020/3/19.
//  Copyright © 2020 minstone. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func dj_addTapAction() {
        let sel: Selector!
        let name : String = NSStringFromClass(type(of: self))
        let rIndex = name.index(name.startIndex, offsetBy: 2)
        let newname = name.prefix(upTo: rIndex)
        
        if newname == "UI" {
            sel = Selector(("tapAction"))
        }else {
            sel = Selector("\(newname.lowercased())Action")
        }
        dj_addTapAction(sel)
    }
    
    func dj_addTapAction(_ selector: Selector) {
        var vc: NSObject = self
        while true {
            vc = (vc as! UIResponder).next!
            if vc.isKind(of: UIViewController.self) {
                dj_addTapAction(vc, selector)
                return
            }
        }
    }
        
    func dj_addTapAction(_ target : Any ,_ selector : Selector) {
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(UITapGestureRecognizer(target: target, action: selector))
    }
}
