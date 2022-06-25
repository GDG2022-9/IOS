//
//  DetatilContentTableViewCell.swift
//  GDG
//
//  Created by 노영재 on 2022/06/26.
//

import UIKit

class DetailTitleTableViewCell: UITableViewCell {
    static let resueidentifier = "DetailTitleTableViewCell"
    
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
    
    let labelMeetTitle : UILabel = {
        let label = UILabel()
        label.text = "밋트 제목"
        label.numberOfLines = 0
        label.textColor = .mainBlack
        label.font = UIFont(name: Constant.fontNotoSansKRBold, size: 20)
        return label
    }()
    let labelMeetDate : UILabel = {
        let label = UILabel()
        label.text = "경상권*경주 06.25 19:00"
        label.textColor = .mainGray
        label.font = UIFont(name: Constant.fontNotoSansKRRegular, size: 12)
        return label
    }()
    let imageViewMeet : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .mainColor
        return imageView
    }()
    let labelContent : UILabel = {
        let label = UILabel()
        label.text = "내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용"
        label.textColor = .mainBlack
        label.numberOfLines = 0
        label.font = UIFont(name: Constant.fontNotoSansKRRegular, size: 16)
        return label
    }()
    
    func setContent() {
        contentView.addSubview(viewContent)
        viewContent.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        viewContent.addSubview(labelMeetTitle)
        labelMeetTitle.snp.makeConstraints { make in
            make.leading.equalTo(viewContent).offset(20)
            make.trailing.equalTo(viewContent).offset(-20)
            make.top.equalTo(viewContent).offset(24)
        }
        
        viewContent.addSubview(labelMeetDate)
        labelMeetDate.snp.makeConstraints { make in
            make.leading.equalTo(labelMeetTitle)
            make.top.equalTo(labelMeetTitle.snp.bottom).offset(8)
        }
        
        viewContent.addSubview(imageViewMeet)
        imageViewMeet.snp.makeConstraints { make in
            make.top.equalTo(labelMeetDate.snp.bottom).offset(20)
            make.leading.trailing.equalTo(labelMeetTitle)
            make.height.equalTo(200)
        }
        
        viewContent.addSubview(labelContent)
        labelContent.snp.makeConstraints { make in
            make.leading.trailing.equalTo(labelMeetTitle)
            make.bottom.equalTo(contentView)
            make.top.equalTo(imageViewMeet.snp.bottom).offset(16)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
