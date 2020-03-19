
//
//  UIButton+DJExtension.swift
//  DJSwiftExtensionDemo
//
//  Created by minstone.DJ on 2020/3/19.
//  Copyright © 2020 minstone. All rights reserved.
//

import Foundation

import UIKit

enum ButtonEdgeInsetType {
    case TitleBottomImageUpType //图上字下
    case TitleUpImageBottomType //图下字上
    case TitleLeftImageRightType //图右字左
    case TitleRightImageLeftType //图左字右
}

extension UIButton {
    
    func makeButtonEdgeInsetType(_ type: ButtonEdgeInsetType, space: CGFloat) {
        
        let imageViewWidth = self.imageView?.intrinsicContentSize.width
        let imageViewHeight = self.imageView?.intrinsicContentSize.height
        let titleLabelWidth = self.titleLabel?.intrinsicContentSize.width
        let titleLabelHeight = self.titleLabel?.intrinsicContentSize.height
        
        switch type {
        case .TitleBottomImageUpType:
            print("图片在上标题在下")
            self.contentHorizontalAlignment = .center
            self.titleEdgeInsets = UIEdgeInsets.init(top: 0.0, left: -imageViewWidth!, bottom: -imageViewHeight! - space, right: 0.0)
            self.imageEdgeInsets = UIEdgeInsets.init(top: -titleLabelHeight! - space, left: 0.0, bottom: 0.0, right: -titleLabelWidth!)
            
        case .TitleUpImageBottomType:
            print("图片在下标题在上")
            self.contentHorizontalAlignment = .center
            self.titleEdgeInsets = UIEdgeInsets.init(top: 0.0, left: -imageViewWidth!, bottom: imageViewHeight! + space, right: 0.0)
            self.imageEdgeInsets = UIEdgeInsets.init(top: space, left: 0.0, bottom: -titleLabelHeight!, right: -titleLabelWidth!)
            
        case .TitleLeftImageRightType:
            print("图片在右标题在左")
            self.contentVerticalAlignment = .center
            self.titleEdgeInsets = UIEdgeInsets.init(top: 0.0, left: -imageViewWidth! - space, bottom: 0.0, right: imageViewWidth!)
            self.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: titleLabelWidth!, bottom: 0.0, right: -titleLabelWidth! - space)
            
        case .TitleRightImageLeftType:
            print("图片在左标题在右")
            self.contentVerticalAlignment = .center
            self.titleEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: -space)
            self.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: -space, bottom: 0.0, right: 0.0)
        }
    }

}


