//
//  TestPrivacyController.swift
//  LQGTest
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

import UIKit
import LQGBaseView
import LQGTip
import LQGPrivacy

class TestPrivacyController: LQGBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - NavigationBar
    
    override func lqg_setupNavigationBarItem() {
        self.title = "LQGPrivacy"
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
                        "title":"无提示"
                    ]
                ],
                "cells": [
                    [
                        "text": "相册"
                    ],
                    [
                        "text": "相机"
                    ],
                    [
                        "text": "麦克风"
                    ],
                    [
                        "text": "通讯录"
                    ],
                    [
                        "text": "位置（使用期间）"
                    ],
                    [
                        "text": "位置（始终）"
                    ]
                ]
            ],
            [
                "header": [
                    "height": 32,
                    "params": [
                        "title":"提示"
                    ]
                ],
                "cells": [
                    [
                        "text": "相册"
                    ],
                    [
                        "text": "相机"
                    ],
                    [
                        "text": "麦克风"
                    ],
                    [
                        "text": "通讯录"
                    ],
                    [
                        "text": "位置（使用期间）"
                    ],
                    [
                        "text": "位置（始终）"
                    ]
                ]
            ],
            [
                "header": [
                    "height": 32,
                    "params": [
                        "title":"提示加跳转"
                    ]
                ],
                "cells": [
                    [
                        "text": "相册"
                    ],
                    [
                        "text": "相机"
                    ],
                    [
                        "text": "麦克风"
                    ],
                    [
                        "text": "通讯录"
                    ],
                    [
                        "text": "位置（使用期间）"
                    ],
                    [
                        "text": "位置（始终）"
                    ]
                ]
            ]
        ]
    ])
    
    //MARK: - 初始化
    
    override func lqg_addSubviews() {
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    //MARK: - TableView

    //MARK: number

    func numberOfSections(in tableView: UITableView) -> Int {
        let count = self.tableViewMdoel?.sections?.count
        return count != nil ? count! : 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.tableViewMdoel?.sections?[section].cells?.count
        return count != nil ? count! : 0
    }

    //MARK: height

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let height = self.tableViewMdoel?.sections?[section].header?.height
        return height != nil && height != 0 ? height! : CGFloat.leastNormalMagnitude
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let height = self.tableViewMdoel?.sections?[section].footer?.height
        return height != nil && height != 0 ? height! : CGFloat.leastNormalMagnitude
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = self.tableViewMdoel?.sections?[indexPath.section].cells?[indexPath.row].height
        return height != nil && height != 0 ? height! : 44
    }

    //MARK: 视图

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
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

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = self.tableViewMdoel?.sections?[indexPath.section].cells?[indexPath.row]
        let cell = (tableView.dequeueReusableCell(withIdentifier: UITableViewCell.description()))!
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = cellModel?.text
        cell.detailTextLabel?.text = cellModel?.detailText
        return cell
    }

    //MARK: 事件

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        LQGPrivacy.privacy(with: LQGPrivacyType(rawValue: indexPath.row)!, completion: { code in
            LQGToastView.showToast(withMessage: code == .authorized ? "获取权限成功" : "获取权限失败")
        }, alertType: LQGPrivacyAlertType(rawValue: indexPath.section)!, from: self)
    }

}
