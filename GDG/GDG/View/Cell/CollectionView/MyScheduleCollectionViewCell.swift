//
//  MyScheduleCollectionViewCell.swift
//  GDG
//
//  Created by 노영재 on 2022/06/26.
//

import UIKit

class MyScheduleCollectionViewCell: UICollectionViewCell {
    static let resueidentifier = "MyScheduleCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setMyScheduleView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: 상단 나의 여행 일정 뷰
    let viewContent : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let viewMySchedule : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.1
        view.layer.cornerRadius = 10
        return view
    }()
    
    let labelMyScheduleText : UILabel = {
        let label = UILabel()
        label.text = "나의 여행 일정"
        label.textColor = .mainBlack
        label.font = UIFont(name: Constant.fontNotoSansKRBold, size: 14)
        return label
    }()
    
    let labelMyScheduleDate : UILabel = {
        let label = UILabel()
        label.text = "2022.06.25(토)-06.28(월)"
        label.textColor = .mainBlack
        label.font = UIFont(name: Constant.fontNotoSansKRRegular, size: 14)
        return label
    }()
    
    let labelMyScheduleDay : UILabel = {
        let label = UILabel()
        label.text = "3일"
        label.textColor = .mainColor
        label.font = UIFont(name: Constant.fontNotoSansKRBold, size: 14)
        return label
    }()
    
    func setMyScheduleView() {
        contentView.addSubview(viewContent)
        viewContent.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        viewContent.addSubview(viewMySchedule)
        viewMySchedule.snp.makeConstraints { make in
            make.center.equalTo(viewContent)
            make.width.equalTo(UIScreen.main.bounds.width * 0.8)
            make.height.equalTo(UIScreen.main.bounds.width * 0.8 * 0.25)
        }
        
        viewMySchedule.addSubview(labelMyScheduleDate)
        labelMyScheduleDate.snp.makeConstraints { make in
            make.centerX.equalTo(viewMySchedule).offset(29)
            make.centerY.equalTo(viewMySchedule)
        }
        
        viewMySchedule.addSubview(labelMyScheduleText)
        labelMyScheduleText.snp.makeConstraints { make in
            make.centerY.equalTo(labelMyScheduleDate)
            make.trailing.equalTo(labelMyScheduleDate.snp.leading).offset(-8)
        }
        
        viewMySchedule.addSubview(labelMyScheduleDay)
        labelMyScheduleDay.snp.makeConstraints { make in
            make.centerY.equalTo(labelMyScheduleDate)
            make.leading.equalTo(labelMyScheduleDate.snp.trailing).offset(8)
        }
    }
}
