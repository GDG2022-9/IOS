//
//  HomeViewController.swift
//  GDG
//
//  Created by 강민규 on 2022/06/25.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    //MARK: 여행 일정 마이 뷰
    let viewAD: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    //MARK: 지역 카테고리 컬렉션 뷰
    let labelRegionCategory : UILabel = {
        let label = UILabel()
        label.text = "지역 카테고리"
        label.textColor = .black
        label.font = UIFont(name: Constant.fontNotoSansKRBold, size: 20)
        return label
    }()
    
    let collectionViewRegionCategory : UICollectionView = {
        let colllectionView = UICollectionView()
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 29, bottom: 0, right: 29)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = false
        return colllectionView
    }()
    
    //MARK: 나의 여행 일정에 맞는 모임
    let labelMyScheduleMeet : UILabel = {
        let label = UILabel()
        label.text = "나의 여행 일정에 맞는 밋트"
        label.textColor = .black
        label.font = UIFont(name: Constant.fontNotoSansKRBold, size: 20)
        return label
    }()
    
    let buttonMoreMyScheduleMeet :  UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(actionGoMoreMySchedulMeet), for: .touchUpInside)
        button.setTitle("더 보기", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    @objc func actionGoMoreMySchedulMeet() {
        print("더보기")
    }
    
    let labelMySchedule : UILabel = {
        let label = UILabel()
        label.text = "여행 일정 2022.06.25(토) ~ 06.28(월) 3일"
        return label
    }()
    
    let collectionViewMyScheduleMeet : UICollectionView = {
        let colllectionView = UICollectionView()
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsHorizontalScrollIndicator = false
        return colllectionView
    }()
    
    //MARK: 실시간 여행 모임
    let labelRealTimeMeet : UILabel = {
        let label = UILabel()
        label.text = "실시간 밋트"
        label.textColor = .black
        label.font = UIFont(name: Constant.fontNotoSansKRBold, size: 20)
        return label
    }()
    let buttonMoreRealTimeMeet :  UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(actionGoMoreMySchedulMeet), for: .touchUpInside)
        button.setTitle("더 보기", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    @objc func actionGoMoreRealTimeMeet() {
        print("더보기")
    }
    
    let collectionViewRealTimeMeet : UICollectionView = {
        let colllectionView = UICollectionView()
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 10
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsHorizontalScrollIndicator = false
        return colllectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(viewAD)
        let height = view.frame.width/2
        viewAD.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.height.equalTo(height)
        }
        
        view.addSubview(labelRegionCategory)
        labelRegionCategory.snp.makeConstraints { make in
            make.top.equalTo(viewAD.snp.bottom).offset(28)
            make.leading.equalTo(view.snp.leading).offset(20)
        }
        view.addSubview(collectionViewRegionCategory)
        collectionViewRegionCategory.snp.makeConstraints { make in
            make.top.equalTo(labelRegionCategory.snp.bottom)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(92)
        }
               
    }
}
