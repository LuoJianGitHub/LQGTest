//
//  TestTipController.swift
//  LQGTest
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

import UIKit
import LQGBaseView
import LQGTip

class TestTipController: LQGBaseViewController, UITableViewDataSource, UITableViewDelegate {

    //MARK: - NavigationBar
    
    override func lqg_setupNavigationBarItem() {
        self.title = "LQGTip"
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
                        "title": "Default"
                    ]
                ],
                "cells": [
                    [
                        "text": "加载中"
                    ],
                    [
                        "text": "图片"
                    ],
                    [
                        "text": "文本"
                    ],
                    [
                        "text": "文本（长）"
                    ],
                    [
                        "text": "图片+文本"
                    ],
                    [
                        "text": "图片+文本（长）"
                    ],
                    [
                        "text": "按钮"
                    ],
                    [
                        "text": "图片+按钮"
                    ],
                    [
                        "text": "文本+按钮"
                    ],
                    [
                        "text": "文本（长）+按钮"
                    ],
                    [
                        "text": "图片+文本+按钮"
                    ],
                    [
                        "text": "图片+文本（长）+按钮"
                    ]
                ]
            ],
            [
                "header": [
                    "height": 32,
                    "params": [
                        "title": "Toast"
                    ]
                ],
                "cells": [
                    [
                        "text": "加载"
                    ],
                    [
                        "text": "加载+提示"
                    ],
                    [
                        "text": "加载+提示（长）"
                    ],
                    [
                        "text": "提示"
                    ],
                    [
                        "text": "提示（长）"
                    ]
                ]
            ],
            [
                "header": [
                    "height": 32,
                    "params": [
                        "title": "Alert"
                    ]
                ],
                "cells": [
                    [
                        "text": "Alert一个按钮"
                    ],
                    [
                        "text": "Alert两个按钮"
                    ],
                    [
                        "text": "ActionSheet"
                    ]
                ]
            ],
            [
                "header": [
                    "height": 32,
                    "params": [
                        "title": "ActionSheet"
                    ]
                ],
                "cells": [
                    [
                        "text": "ActionSheet"
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
        
        switch (indexPath.section * 10000 + indexPath.row) {
        case 0:
            fallthrough
        case 1:
            fallthrough
        case 2:
            fallthrough
        case 3:
            fallthrough
        case 4:
            fallthrough
        case 5:
            fallthrough
        case 6:
            fallthrough
        case 7:
            fallthrough
        case 8:
            fallthrough
        case 9:
            fallthrough
        case 10:
            fallthrough
        case 11:
            self.pushToTestDefaultController(index: indexPath.row)
            break
        case 10000:
            fallthrough
        case 10001:
            fallthrough
        case 10002:
            fallthrough
        case 10003:
            fallthrough
        case 10004:
            self.pushToTestToastController(index: indexPath.row)
            break
        case 20000:
            fallthrough
        case 20001:
            fallthrough
        case 20002:
            fallthrough
        case 20003:
            fallthrough
        case 20004:
            fallthrough
        case 20005:
            fallthrough
        case 20006:
            fallthrough
        case 20007:
            fallthrough
        case 20008:
            fallthrough
        case 20009:
            fallthrough
        case 20010:
            fallthrough
        case 20011:
            LQGAlertController.show(with: {
                let model = LQGAlertModel.init()
                switch (indexPath.row) {
                case 0:
                    model.title = "标题"
                    model.message = "描述"
                    model.normalActionTitles = ["确定"]
                    break
                case 1:
                    model.title = "标题"
                    model.message = "描述"
                    model.normalActionTitles = ["确定"]
                    model.cancelActionTitle = "取消"
                    break
                case 2:
                    model.preferredStyle = .actionSheet
                    model.title = "标题"
                    model.message = "描述"
                    model.normalActionTitles = ["选项一", "选项二", "选项三"]
                    model.cancelActionTitle = "取消"
                    break
                default:
                    break
                }
                return model
            }(), from: self)
            break
        case 30000:
            fallthrough
        case 30001:
            fallthrough
        case 30002:
            LQGActionSheet.show(with: {
                let model = LQGActionSheetModel.init()
                switch (indexPath.row) {
                case 0:
                    model.message = "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述"
                    model.normalActions = [
                        {
                            let actionModel = LQGActionSheetActionModel.init()
                            actionModel.image = UIImage.init(size: CGSize(width: 20, height: 20), color: .red)
                            return actionModel
                        }(),
                        {
                            let actionModel = LQGActionSheetActionModel.init()
                            actionModel.title = "标题"
                            return actionModel
                        }(),
                        {
                            let actionModel = LQGActionSheetActionModel.init()
                            actionModel.image = UIImage.init(size: CGSize(width: 20, height: 20), color: .red)
                            actionModel.title = "标题"
                            return actionModel
                        }(),
                        {
                            let actionModel = LQGActionSheetActionModel.init()
                            actionModel.message = "描述"
                            return actionModel
                        }(),
                        {
                            let actionModel = LQGActionSheetActionModel.init()
                            actionModel.image = UIImage.init(size: CGSize(width: 20, height: 20), color: .red)
                            actionModel.message = "描述"
                            return actionModel
                        }(),
                        {
                            let actionModel = LQGActionSheetActionModel.init()
                            actionModel.image = UIImage.init(size: CGSize(width: 20, height: 20), color: .red)
                            actionModel.title = "标题"
                            actionModel.message = "（描述）"
                            return actionModel
                        }()
                    ]
                    model.cancelActionTitle = "取消"
                    break
                default:
                    break
                }
                return model
            }())
            break
        default:
            break
        }
    }

     //MARK: - 界面跳转

    func pushToTestDefaultController(index: Int) {
        let vc: TestDefaultController = .init()
        vc.index = index
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func pushToTestToastController(index: Int) {
        let vc: TestToastController = .init()
        vc.index = index
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
