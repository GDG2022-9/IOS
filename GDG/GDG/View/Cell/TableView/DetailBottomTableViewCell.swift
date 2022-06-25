//
//  DetailBottomTableViewCell.swift
//  GDG
//
//  Created by 노영재 on 2022/06/26.
//

import UIKit

class DetailBottomTableViewCell: UITableViewCell {

    static let resueidentifier = "DetailBottomTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setContent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let viewContent : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let labelParticipationMember : UILabel = {
        let label = UILabel()
        label.text = "00명 참여중"
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
    
    let viewLine : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: 0xd2d2d2)
        return view
    }()
    
    let buttonJoinMeet : UIButton = {
       let button = UIButton()
        button.backgroundColor = .mainColor
        button.setTitle("밋트 신청하기!", for: .normal)
        button.setTitle("밋트 신청완료!", for: .selected)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: Constant.fontNotoSansKRBold, size: 16)
        button.layer.cornerRadius = 20
        return button
    }()
    
    func setContent() {
        contentView.addSubview(viewContent)
        viewContent.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        contentView.addSubview(labelParticipationMember)
        labelParticipationMember.snp.makeConstraints { make in
            make.leading.equalTo(viewContent).offset(20)
            make.top.equalTo(viewContent).offset(40)
        }
        contentView.addSubview(labelRemainTime)
        labelRemainTime.snp.makeConstraints { make in
            make.trailing.equalTo(viewContent).offset(-20)
            make.centerY.equalTo(labelParticipationMember)
        }
        viewContent.addSubview(viewLine)
        viewLine.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(labelRemainTime.snp.bottom).offset(12)
            make.leading.equalTo(viewContent).offset(20)
            make.trailing.equalTo(viewContent).offset(-20)
        }
        
        viewContent.addSubview(buttonJoinMeet)
        buttonJoinMeet.snp.makeConstraints { make in
            make.leading.trailing.equalTo(viewLine)
            make.height.equalTo(40)
            make.top.equalTo(viewLine.snp.bottom).offset(32)
            make.bottom.equalTo(viewContent).offset(-60)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
