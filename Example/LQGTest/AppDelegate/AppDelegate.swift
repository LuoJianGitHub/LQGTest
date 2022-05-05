//
//  AppDelegate.swift
//  LQGTest
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

import UIKit
import LQGBaseAppDelegate
import LQGBaseView
import LQGTest

@UIApplicationMain
class AppDelegate: LQGBaseAppDelegate {

    override init() {
        super.init()
        
        self.getMainVCBlock = {
            return LQGBaseNavigationController.init(rootViewController: TestRootController.init())
        }
    }

}
