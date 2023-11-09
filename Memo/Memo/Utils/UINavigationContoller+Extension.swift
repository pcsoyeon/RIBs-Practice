//
//  UINavigationContoller+Extension.swift
//  Memo
//
//  Created by 김소연 on 11/9/23.
//

import UIKit
import RIBs

extension UINavigationController: ViewControllable {
    
    public var uiViewController: UIViewController {
        return self
    }
    
    convenience init(root: ViewControllable) {
        self.init(rootViewController: root.uiviewController)
    }
    
}
