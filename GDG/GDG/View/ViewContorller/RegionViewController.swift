//
//  RegionViewController.swift
//  GDG
//
//  Created by 노영재 on 2022/06/26.
//

import UIKit

class RegionViewController: UIViewController {
    var region : String = ""
    var arrayRegion : [String] = []
    var region1 = ["전체", "서울", "용산"]
    var region2 = ["전체", "대전", "단양"]
    var region3 = ["전체", "강릉", "정동진", "동해"]
    var region4 = ["전체", "부산", "대구", "경주"]
    var region5 = ["전체", "보성", "여수"]
    
    init(region: String) {
        self.region = region
        super.init(nibName: nil, bundle: nil)
        switch region {
        case "수도권":
            arrayRegion = region1
        case "충청권":
            arrayRegion = region2
        case "강원권":
            arrayRegion = region3
        case "경상권":
            arrayRegion = region4
        case "전라권":
            arrayRegion = region5
        default:
            arrayRegion = []
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFilter()
        setContent()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }

    let collectionViewFilter: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 8
        flowLayout.sectionInset = UIEdgeInsets(top: 24, left: 20, bottom: 24, right: 20)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    let label : UILabel = {
        let label = UILabel()
        label.textColor = .mainBlack
        label.font = UIFont(name: Constant.fontNotoSansKRBold, size: 14)
        return label
    }()
    
    func setFilter() {
        collectionViewFilter.delegate = self
        collectionViewFilter.dataSource = self
        collectionViewFilter.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: FilterCollectionViewCell.resueidentifier)
        view.addSubview(collectionViewFilter)
        collectionViewFilter.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view)
            make.height.equalTo(76)
        }
        
        label.text = "\(region)에서 00개의 밋트가 예정되어 있어요!"
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(20)
            make.top.equalTo(collectionViewFilter.snp.bottom)
        }
    }
    
    let collectionViewContent: UICollectionView = {
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
    
    func setContent() {
        collectionViewContent.delegate = self
        collectionViewContent.dataSource = self
        collectionViewContent.register(MyScheduleMeetCollectionViewCell.self, forCellWithReuseIdentifier: MyScheduleMeetCollectionViewCell.resueidentifier)
        view.addSubview(collectionViewContent)
        collectionViewContent.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom)
            make.leading.trailing.bottom.equalTo(view)
        }
    }
}

extension RegionViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewFilter {
            return arrayRegion.count
        } else {
            return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewFilter {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.resueidentifier, for: indexPath) as? FilterCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.button.setTitle(arrayRegion[indexPath.row], for: .normal)
            if indexPath.row == 0 {
                cell.button.isSelected = true
                cell.button.backgroundColor = .mainColor
            } else {
                cell.button.isSelected = false
            }
            cell.button.addTarget(self, action: #selector(actionButton), for: .touchUpInside)

           
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

    @objc func actionButton(_ button: UIButton) {
        if button.isSelected {
            button.isSelected = false
            button.backgroundColor = .white
        } else {
            button.isSelected = true
            button.backgroundColor = .mainColor
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViewFilter {
            return CGSize(width: 74, height: 24)
        } else {
            return CGSize(width: (UIScreen.main.bounds.width * 0.9), height: 220)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionViewFilter {
            
        } else {
            let nextVC = DetailMeetViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}
