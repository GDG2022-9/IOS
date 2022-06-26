//
//  MyScheduleMeetCollectionViewCell.swift
//  GDG
//
//  Created by 노영재 on 2022/06/25.
//

import UIKit

class MyScheduleMeetCollectionViewCell: UICollectionViewCell {
    static let resueidentifier = "MyScheduleMeetCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setContentView()
        
    }
    override func layoutSubviews() {
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let viewContent : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let imageViewMeet : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "image1")
        imageView.backgroundColor = .mainColor
        return imageView
    }()
    
    let viewFilter : UIView = {
        let view = UIView()
        view.backgroundColor = .mainBlack
        view.alpha = 0.1
        return view
    }()
    
    let labelMeetTitle : UILabel = {
        let label = UILabel()
        label.text = "게스트 하우스에서 다같이 파티 어때요?"
        label.textColor = .white
        label.font = UIFont(name: Constant.fontNotoSansKRBold, size: 16)
        return label
    }()
    
    let labelMeetDate : UILabel = {
        let label = UILabel()
        label.text = "경상권*경주 06.25 19:00"
        label.textColor = .white
        label.font = UIFont(name: Constant.fontNotoSansKRRegular, size: 12)
        return label
    }()
    
    let viewBackWhite : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    let labelParticipationMember : UILabel = {
        let label = UILabel()
        label.text = "4명 참여중"
        label.textColor = .mainColor
        label.font = UIFont(name: Constant.fontNotoSansKRBold, size: 12)
        return label
    }()
    let labelRemainTime : UILabel = {
        let label = UILabel()
        label.text = "1시간 남음"
        label.textColor = .mainColor
        label.font = UIFont(name: Constant.fontNotoSansKRBold, size: 12)
        return label
    }()
    
    func setContentView() {
        contentView.addSubview(viewContent)
        viewContent.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        viewContent.addSubview(imageViewMeet)
        imageViewMeet.snp.makeConstraints { make in
            make.edges.equalTo(viewContent)
        }
        imageViewMeet.addSubview(viewFilter)
        viewFilter.snp.makeConstraints { make in
            make.edges.equalTo(viewContent)
        }
        
        viewContent.addSubview(viewBackWhite)
        viewBackWhite.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalTo(viewFilter)
            make.height.equalTo(40)
        }
        viewBackWhite.addSubview(labelParticipationMember)
        labelParticipationMember.snp.makeConstraints { make in
            make.centerY.equalTo(viewBackWhite)
            make.leading.equalTo(viewBackWhite).offset(16)
        }
        
        viewBackWhite.addSubview(labelRemainTime)
        labelRemainTime.snp.makeConstraints { make in
            make.centerY.equalTo(viewBackWhite)
            make.trailing.equalTo(viewBackWhite).offset(-16)
        }
        
        viewContent.addSubview(labelMeetDate)
        labelMeetDate.snp.makeConstraints { make in
            make.leading.equalTo(viewFilter).offset(16)
            make.bottom.equalTo(viewBackWhite.snp.top).offset(-12)
        }
        
        viewContent.addSubview(labelMeetTitle)
        labelMeetTitle.snp.makeConstraints { make in
            make.leading.equalTo(labelMeetDate)
            make.bottom.equalTo(labelMeetDate.snp.top).offset(-4)
        }
    }
}
