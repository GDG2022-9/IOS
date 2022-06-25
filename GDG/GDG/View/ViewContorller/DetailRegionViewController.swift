//
//  DetailRegionViewController.swift
//  GDG
//
//  Created by 노영재 on 2022/06/26.
//

import UIKit
import PagingKit
class DetailRegionViewController: UIViewController {
    var dataSource = [(menuTitle: "수도권", vc: RegionViewController(region: "수도권")), (menuTitle: "충청권", vc: RegionViewController(region: "충청권")), (menuTitle: "강원권", vc: RegionViewController(region: "강원권")), (menuTitle: "경상권", vc: RegionViewController(region: "경상권")), (menuTitle: "전라권", vc: RegionViewController(region: "전라권"))]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setMenu()
        setNavigation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.post(name: Notification.Name("middleButtonAppear"), object: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.post(name: Notification.Name("middleButtonHidden"), object: nil)
    }
    
    let menuVC = PagingMenuViewController()
    let contentVC = PagingContentViewController()

    //MARK: navigation
    func setNavigation() {
        navigationItem.title = "밋트 지역"
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .mainBlack

        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: Constant.fontNotoSansKRBold, size: 16)!]
    }
    func setMenu() {
        menuVC.register(nib: UINib(nibName: "PagingMenuTableViewCell", bundle: nil), forCellWithReuseIdentifier: "PagingMenuTableViewCell")
        menuVC.registerFocusView(nib: UINib(nibName: "FocusTableViewCell", bundle: nil))

        menuVC.delegate = self
        menuVC.dataSource = self
        view.addSubview(menuVC.view)
        menuVC.view.snp.makeConstraints { make in
            make.top.equalTo(view).offset(100)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(50)
        }
        
        view.addSubview(contentVC.view)
        contentVC.delegate = self
        contentVC.dataSource = self
        contentVC.view.snp.makeConstraints { make in
            make.top.equalTo(menuVC.view.snp.bottom)
            make.leading.trailing.equalTo(view)
            make.bottom.equalTo(view)
        }
        
        contentVC.reloadData()
        menuVC.reloadData()
    }
}




extension DetailRegionViewController : PagingMenuViewControllerDelegate, PagingMenuViewControllerDataSource {
    func menuViewController(viewController: PagingMenuViewController, widthForItemAt index: Int) -> CGFloat {
        return UIScreen.main.bounds.width / 5
    }
    
    func menuViewController(viewController: PagingMenuViewController, cellForItemAt index: Int) -> PagingMenuViewCell {
        guard let cell = viewController.dequeueReusableCell(withReuseIdentifier: "PagingMenuTableViewCell", for: index) as? PagingMenuTableViewCell else {
            return PagingMenuViewCell()
        }
        cell.regionTitle.text = dataSource[index].menuTitle
        return cell
    }
    
    func menuViewController(viewController: PagingMenuViewController, didSelect page: Int, previousPage: Int) {
        contentVC.scroll(to: page, animated: true)
    }
    
    func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int {
        return dataSource.count
    }
    
    
}

extension DetailRegionViewController: PagingContentViewControllerDelegate, PagingContentViewControllerDataSource {
    func contentViewController(viewController: PagingContentViewController, viewControllerAt index: Int) -> UIViewController {
        return dataSource[index].vc
    }
    
    func numberOfItemsForContentViewController(viewController: PagingContentViewController) -> Int {
        return dataSource.count
    }
    
    
}
