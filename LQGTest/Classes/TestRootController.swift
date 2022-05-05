//
//  TestRootController.swift
//  LQGTest
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

import UIKit
import SnapKit
import LQGBaseView
import LQGCTMediator

public class TestRootController: LQGBaseViewController, UITableViewDataSource, UITableViewDelegate {

    //MARK: - NavigationBar
    
    public override func lqg_setupNavigationBarItem() {
        self.title = "调试"
    }
    
    //MARK: - 属性

    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: UITableView.Style.grouped)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.registerHeaderFooterView(with: UITableViewHeaderFooterView.self, isNib: false)
        tableView.registerCell(with: UITableViewCell.self, isNib: false)
        
        return tableView
    }()

    var tableViewMdoel: LQGTableViewModel? = LQGTableViewModel.lqg_model(with: [
        "sections": [
            [
                "header": [
                    "height": 32,
                    "params": [
                        "title": "基础组件"
                    ]
                ],
                "cells": [
                    [
                        "text": "LQGBases"
                    ]
                ]
            ],
            [
                "header": [
                    "height": 32,
                    "params": [
                        "title": "公共工具组件"
                    ]
                ],
                "cells": [
                    [
                        "text": "LQGTip"
                    ],
                    [
                        "text": "LQGPrivacy"
                    ]
                ]
            ],
            [
                "header": [
                    "height": 32,
                    "params": [
                        "title": "业务工具组件"
                    ]
                ],
                "cells": [
                    [
                        "text": ""
                    ]
                ]
            ],
            [
                "header": [
                    "height": 32,
                    "params": [
                        "title": "业务组件"
                    ]
                ],
                "cells": [
                    [
                        "text": ""
                    ]
                ]
            ]
        ]
    ])
    
    //MARK: - 初始化
    
    public override func lqg_addSubviews() {
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    //MARK: - TableView

    //MARK: number

    public func numberOfSections(in tableView: UITableView) -> Int {
        let count = self.tableViewMdoel?.sections?.count
        return count != nil ? count! : 0
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.tableViewMdoel?.sections?[section].cells?.count
        return count != nil ? count! : 0
    }

    //MARK: height

    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let height = self.tableViewMdoel?.sections?[section].header?.height
        return height != nil && height != 0 ? height! : CGFloat.leastNormalMagnitude
    }

    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let height = self.tableViewMdoel?.sections?[section].footer?.height
        return height != nil && height != 0 ? height! : CGFloat.leastNormalMagnitude
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = self.tableViewMdoel?.sections?[indexPath.section].cells?[indexPath.row].height
        return height != nil && height != 0 ? height! : 44
    }

    //MARK: 视图

    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerModel = self.tableViewMdoel?.sections?[section].header
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: UITableViewHeaderFooterView.description())
        let textLable: UILabel? = {
            var lab = headerView?.viewWithTag(9000) as? UILabel
            if lab == nil {
                lab = UILabel.init()
                lab?.tag = 9000
                lab?.font = .systemFont(ofSize: 12)

                headerView?.contentView.addSubview(lab!)
                lab?.snp.makeConstraints({ make in
                    make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15))
                })
            }
            return lab
        }()
        textLable?.text = headerModel?.params?["title"]
        return headerView
    }

    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = self.tableViewMdoel?.sections?[indexPath.section].cells?[indexPath.row]
        let cell = (tableView.dequeueReusableCell(withIdentifier: UITableViewCell.description()))!
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = cellModel?.text
        cell.detailTextLabel?.text = cellModel?.detailText
        return cell
    }

    //MARK: 事件

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch (indexPath.section * 10000 + indexPath.row) {
        case 0:
            self.pushToTestBasesController()
            break
        case 10000:
            self.pushToTestTipController()
            break
        case 10001:
            self.pushToTestPrivacyController()
            break
        case 20000:
            LQGCTMediator.sharedInstance().performTarget("a", action: "b", params: nil, shouldCacheTarget: false)
            break
        case 30000:
            LQGCTMediator.sharedInstance().performTarget("a", action: "func_", params: nil, shouldCacheTarget: false)
            break
        default:
            break
        }
    }
    
    //MARK: - 界面跳转
    
    func pushToTestBasesController() {
        let vc: TestBasesController = .init()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func pushToTestTipController() {
        let vc: TestTipController = .init()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func pushToTestPrivacyController() {
        let vc: TestPrivacyController = .init()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
