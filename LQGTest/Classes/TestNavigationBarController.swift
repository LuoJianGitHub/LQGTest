//
//  TestNavigationBarController.swift
//  LQGTest
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

import UIKit
import LQGBaseView
import LQGUIStyle

class TestNavigationBarController: LQGBaseViewController, UITableViewDataSource, UITableViewDelegate {

    //MARK: - NavigationBar
    
    override var lqg_prefersNavigationBarHidden: Bool {
        get {
            return self.navigationBarHidden
        }
        set {
            
        }
    }

    override var lqg_prefersNavigationBarCustom: Bool {
        get {
            return self.navigationBarCustom
        }
        set {
            
        }
    }
    
    override func lqg_setupNavigationBar() {
        self.navigationBar().style = self.navigationBarStyle
    }

    override func lqg_setupNavigationBarItem() {
        self.title = "导航栏"
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
                "cells": [
                    [
                        "text": "隐藏"
                    ],
                    [
                        "text": "白色"
                    ],
                    [
                        "text": "黑色"
                    ],
                    [
                        "text": "白色渐变"
                    ],
                    [
                        "text": "黑色渐变"
                    ]
                ]
            ]
        ]
    ])
    
    var navigationBarHidden: Bool = false
    
    var navigationBarCustom: Bool = false
    
    var navigationBarStyle: UINavigationBarStyle = .white
    
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
            self.pushToTestNavigationBarController(navigationBarHidden: true, navigationBarCustom: false, navigationBarStyle: .white)
            break
        case 1:
            self.pushToTestNavigationBarController(navigationBarHidden: false, navigationBarCustom: false, navigationBarStyle: .white)
            break
        case 2:
            self.pushToTestNavigationBarController(navigationBarHidden: false, navigationBarCustom: false, navigationBarStyle: .black)
            break
        case 3:
            self.pushToTestNavigationBarController(navigationBarHidden: false, navigationBarCustom: true, navigationBarStyle: .white)
            break
        case 4:
            self.pushToTestNavigationBarController(navigationBarHidden: false, navigationBarCustom: true, navigationBarStyle: .black)
            break
        default:
            break
        }
    }
    
    //MARK: - <UIScrollViewDelegate>

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.navigationBarCustom {
            self.navigationBar().alpha = scrollView.contentOffset.y / 100 + 0.8
        }
    }
    
    //MARK: - 界面跳转
    
    func pushToTestNavigationBarController(navigationBarHidden: Bool, navigationBarCustom: Bool, navigationBarStyle: UINavigationBarStyle) {
        let vc: TestNavigationBarController = .init()
        vc.navigationBarHidden = navigationBarHidden
        vc.navigationBarCustom = navigationBarCustom
        vc.navigationBarStyle = navigationBarStyle
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
