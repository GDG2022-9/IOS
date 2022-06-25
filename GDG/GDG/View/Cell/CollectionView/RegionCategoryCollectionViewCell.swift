//
//  RegionCategoryCollectionViewCell.swift
//  GDG
//
//  Created by 노영재 on 2022/06/25.
//

import UIKit

class RegionCategoryCollectionViewCell: UICollectionViewCell {
    static let resueidentifier = "RegionCategoryCollectionViewCell"
    
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
    let imageViewRegion: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let labelRegionName : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.textColor = .mainBlack
        label.font = UIFont(name: Constant.fontNotoSansKRRegular, size: 14)
        return label
    }()
    
    func setContentView() {
        contentView.addSubview(viewContent)
        viewContent.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        viewContent.addSubview(imageViewRegion)
        imageViewRegion.snp.makeConstraints { make in
            make.centerX.top.equalTo(viewContent)
            make.height.width.equalTo(32)
        }
        
        viewContent.addSubview(labelRegionName)
        labelRegionName.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalTo(viewContent)
        }
    }
}
