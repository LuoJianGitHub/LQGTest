//
//  LQGTableViewModel.swift
//  LQGTest
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

import Foundation
import LQGBaseModel

@objcMembers class LQGTableViewModel: LQGBaseModel {
    
    var sections: [LQGTableViewSectionModel]?
    
    override class func lqg_modelContainerPropertyGenericClass() -> [AnyHashable : Any]! {
        return [
            "sections": LQGTableViewSectionModel.classForCoder()
        ]
    }
    
}

@objcMembers class LQGTableViewSectionModel: LQGBaseModel {

    var header: LQGTableViewHeaderModel?
    
    var footer: LQGTableViewFooterModel?
    
    var cells: [LQGTableViewCellModel]?

    override class func lqg_modelContainerPropertyGenericClass() -> [AnyHashable : Any]! {
        return [
            "cells": LQGTableViewCellModel.classForCoder()
        ]
    }
    
}

@objcMembers class LQGTableViewItemModel: LQGBaseModel {
    
    var height: CGFloat = 0
    
    var params: [String: String]?

}

@objcMembers class LQGTableViewHeaderModel: LQGTableViewItemModel {
    
}

@objcMembers class LQGTableViewFooterModel: LQGTableViewItemModel {
    
}

@objcMembers class LQGTableViewCellModel: LQGTableViewItemModel {

    var text: String?

    var detailText: String?

}
