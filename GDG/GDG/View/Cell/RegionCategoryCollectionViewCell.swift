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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageViewRegion: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let labelRegionName : UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: Constant.fontNotoSansKRRegular, size: 14)
        return label
    }()
    
    func setContentView() {
        
    }
}
