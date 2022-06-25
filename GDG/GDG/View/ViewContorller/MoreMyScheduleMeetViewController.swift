//
//  MoreMyScheduleMeetViewController.swift
//  GDG
//
//  Created by 노영재 on 2022/06/26.
//

import UIKit

class MoreMyScheduleMeetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigation()
        setCollectionView()
    }
    //MARK: navigation
    func setNavigation() {
        navigationItem.title = "나의 여행 일정에 맞는 밋트"
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .mainBlack

        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: Constant.fontNotoSansKRBold, size: 16)!]
    }
    
    
    //MARK: collectionView
    let collectionViewMySchedule: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 16
        flowLayout.sectionInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    func setCollectionView() {
        collectionViewMySchedule.delegate = self
        collectionViewMySchedule.dataSource = self
        collectionViewMySchedule.register(MyScheduleMeetCollectionViewCell.self, forCellWithReuseIdentifier: MyScheduleMeetCollectionViewCell.resueidentifier)
        collectionViewMySchedule.register(MyScheduleCollectionViewCell.self, forCellWithReuseIdentifier: MyScheduleCollectionViewCell.resueidentifier)
        
        view.addSubview(collectionViewMySchedule)
        collectionViewMySchedule.snp.makeConstraints { make in
            make.top.equalTo(view).offset(100)
            make.bottom.leading.trailing.equalTo(view)
        }
    }
}

extension MoreMyScheduleMeetViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyScheduleCollectionViewCell.resueidentifier, for: indexPath) as? MyScheduleCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyScheduleMeetCollectionViewCell.resueidentifier, for: indexPath) as? MyScheduleMeetCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.contentView.layer.cornerRadius = 10
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOpacity = 0.15
            cell.layer.shadowRadius = 10
            cell.contentView.clipsToBounds = true
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0{
            return CGSize(width: (UIScreen.main.bounds.width * 0.9), height: 80)

        } else {
            return CGSize(width: (UIScreen.main.bounds.width * 0.9), height: 220)

        }
    }
}
