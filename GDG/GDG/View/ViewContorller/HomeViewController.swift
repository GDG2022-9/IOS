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
        
    }
}
