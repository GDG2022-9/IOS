//
//  DetailMeetViewController.swift
//  GDG
//
//  Created by 노영재 on 2022/06/26.
//

import UIKit

class DetailMeetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigation()
        setTableView()
    }
    
    //MARK: navigation
    func setNavigation() {
        navigationItem.title = "밋트"
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .mainBlack

        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: Constant.fontNotoSansKRBold, size: 16)!]
    }
    
    //MARK: TableView 구현
    let tableViewContent : UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
    }()
    
    func setTableView() {
        tableViewContent.delegate = self
        tableViewContent.dataSource = self
        tableViewContent.rowHeight = UITableView.automaticDimension
        tableViewContent.estimatedRowHeight = 130
        tableViewContent.register(DetailTitleTableViewCell.self, forCellReuseIdentifier: DetailTitleTableViewCell.resueidentifier)
        tableViewContent.register(DetailBottomTableViewCell.self, forCellReuseIdentifier: DetailBottomTableViewCell.resueidentifier)
        view.addSubview(tableViewContent)
        tableViewContent.snp.makeConstraints { make in
            make.top.equalTo(view).offset(100)
            make.bottom.leading.trailing.equalTo(view)
        }
    }
}

extension DetailMeetViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTitleTableViewCell.resueidentifier, for: indexPath) as? DetailTitleTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailBottomTableViewCell.resueidentifier, for: indexPath) as? DetailBottomTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }
        
    }
    
    
}
