//
//  FilterCollectionViewCell.swift
//  GDG
//
//  Created by 노영재 on 2022/06/26.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    static let resueidentifier = "FilterCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setContentView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let viewContent : UIView = {
        let view = UIView()
        return view
    }()
    
    let button : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 14
        button.layer.borderColor = UIColor.mainColor.cgColor
        button.layer.borderWidth = 1
        button.setTitle("서울", for: .normal)
        button.titleLabel?.font = UIFont(name: Constant.fontNotoSansKRBold, size: 14)
        button.setTitleColor(UIColor.mainColor, for: .normal)
        button.setTitleColor(UIColor.white, for: .selected)
        return button
    }()
    
   
    func setContentView() {
        contentView.addSubview(viewContent)
        viewContent.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        viewContent.addSubview(button)
        button.snp.makeConstraints { make in
            make.edges.equalTo(viewContent)
        }
    }
}
