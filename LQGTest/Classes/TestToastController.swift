//
//  TestToastController.swift
//  LQGTest
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

import UIKit
import LQGBaseView
import LQGTip

class TestToastController: LQGBaseViewController {
    
    //MARK: - NavigationBar
    
    override func lqg_setupNavigationBarItem() {
        self.title = "Toast"
    }
    
    //MARK: - 属性
    
    var index: Int = 0
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        switch self.index {
        case 0:
            LQGToastView.showHUD(withMessage: nil, to: self.view)
            break
        case 1:
            LQGToastView.showHUD(withMessage: "提示", to: self.view)
            break
        case 2:
            LQGToastView.showHUD(withMessage: "提示提示提示提示提示提示提示提示提示提示提示提示提示提示提示提示提示提示", to: self.view)
            break
        case 3:
            LQGToastView.showToast(withMessage: "提示")
            break
        case 4:
            LQGToastView.showToast(withMessage: "提示提示提示提示提示提示提示提示提示提示提示提示提示提示提示提示提示提示")
            break
        default:
            break
        }
    }
    
}
