//
//  TestDefaultController.swift
//  LQGTest
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

import UIKit
import LQGBaseView
import LQGTip

class TestDefaultController: LQGBaseViewController {
    
    //MARK: - NavigationBar
    
    override func lqg_setupNavigationBarItem() {
        self.title = "Default"
    }
    
    //MARK: - 属性
    
    var index: Int = 0
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        LQGDefaultView.show(with: {
            let model: LQGDefaultViewModel = .init()
            
            switch self.index {
            case 0:
                model.isProcess = true
                break
            case 1:
                model.image = UIImage.init(named: "icon_default_error", bundleFor: LQGDefaultView.self, urlForResource: "LQGTip")
                break
            case 2:
                model.message = "描述"
                break
            case 3:
                model.message = "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述"
                break
            case 4:
                model.image = UIImage.init(named: "icon_default_error", bundleFor: LQGDefaultView.self, urlForResource: "LQGTip")
                model.message = "描述"
                break
            case 5:
                model.image = UIImage.init(named: "icon_default_error", bundleFor: LQGDefaultView.self, urlForResource: "LQGTip")
                model.message = "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述"
                break
            case 6:
                model.handleBtnTitle = "点击重新加载"
                break
            case 7:
                model.image = UIImage.init(named: "icon_default_error", bundleFor: LQGDefaultView.self, urlForResource: "LQGTip")
                model.handleBtnTitle = "点击重新加载"
                break
            case 8:
                model.message = "描述"
                model.handleBtnTitle = "点击重新加载"
                break
            case 9:
                model.message = "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述"
                model.handleBtnTitle = "点击重新加载"
                break
            case 10:
                model.image = UIImage.init(named: "icon_default_error", bundleFor: LQGDefaultView.self, urlForResource: "LQGTip")
                model.message = "描述"
                model.handleBtnTitle = "点击重新加载"
                break
            case 11:
                model.image = UIImage.init(named: "icon_default_error", bundleFor: LQGDefaultView.self, urlForResource: "LQGTip")
                model.message = "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述"
                model.handleBtnTitle = "点击重新加载"
                break
            default:
                break
            }
            
            return model
        }(), to: self.view)
    }
        
}
