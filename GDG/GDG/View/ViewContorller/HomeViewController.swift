//
//  HomeViewController.swift
//  GDG
//
//  Created by 강민규 on 2022/06/25.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    let arrayRegion = ["수도권", "충청권", "강원권", "경상권", "전라권"]
    let boolHaveMySchedule : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = imageViewLogo
        setScrollView()
        setAD()
        setRegionCategory()
        setMyScheduleMeet()
       setRealTime()
        
        if boolHaveMySchedule {
            
            viewBackNoSchedule.alpha = 0
            buttonMoreMyScheduleMeet.alpha = 1
            labelMyScheduleText.alpha = 1
            labelMyScheduleDate.alpha = 1
            labelMyScheduleDays.alpha = 1
            collectionViewMyScheduleMeet.alpha = 1
        } else {
            viewBackNoSchedule.alpha = 1
            buttonMoreMyScheduleMeet.alpha = 0
            labelMyScheduleText.alpha = 0
            labelMyScheduleDate.alpha = 0
            labelMyScheduleDays.alpha = 0
            collectionViewMyScheduleMeet.alpha = 0
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(buttonHidden), name: Notification.Name("middleButtonHidden"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(buttonApper), name: Notification.Name("middleButtonAppear"), object: nil)
    }
    
    @objc func buttonHidden() {
        self.tabBarController?.tabBar.isHidden = true
    }
    @objc func buttonApper() {
        self.tabBarController?.tabBar.isHidden = false
    }
    
   override func viewDidLayoutSubviews() {
        viewNoSchedule.setLineDot(view: viewNoSchedule, color: .mainGray, radius: 10)
    }
    let imageViewLogo : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "LogoTitle")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    //MARK: 스크롤뷰 구현
    let scrollViewContent : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    let viewContent = UIView()

    func setScrollView() {
        scrollViewContent.delegate = self
        view.addSubview(scrollViewContent)
        scrollViewContent.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(view)
            make.top.equalTo(view).offset(100)
        }
        scrollViewContent.addSubview(viewContent)
        viewContent.snp.makeConstraints { make in
            make.edges.equalTo(scrollViewContent)
            make.height.equalTo(1500)
            make.width.equalTo(UIScreen.main.bounds.width)
        }
    }
    //MARK: 광고 뷰
    let viewAD: UIView = {
        let view = UIView()
        return view
    }()
    let imageViewAD: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Banner")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    func setAD() {
        viewContent.addSubview(viewAD)
        let height = view.frame.width/2
        viewAD.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.height.equalTo(height)
        }
        
        viewContent.addSubview(imageViewAD)
        imageViewAD.snp.makeConstraints { make in
            make.edges.equalTo(viewAD)
        }
    }
    
    //MARK: 지역 카테고리 컬렉션 뷰
    let labelRegionCategory : UILabel = {
        let label = UILabel()
        label.text = "밋트 지역 고르기"
        label.textColor = .mainBlack
        label.font = UIFont(name: Constant.fontNotoSansKRBold, size: 16)
        return label
    }()
    let collectionViewRegionCategory: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 28
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 29, bottom: 0, right: 29)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    func setRegionCategory() {
        //MARK: addSubview 밋트 지역 고르기
        viewContent.addSubview(labelRegionCategory)
        labelRegionCategory.snp.makeConstraints { make in
            make.top.equalTo(viewAD.snp.bottom).offset(28)
            make.leading.equalTo(view.snp.leading).offset(20)
        }
        
        collectionViewRegionCategory.delegate = self
        collectionViewRegionCategory.dataSource = self
        collectionViewRegionCategory.register(RegionCategoryCollectionViewCell.self, forCellWithReuseIdentifier: RegionCategoryCollectionViewCell.resueidentifier)
        viewContent.addSubview(collectionViewRegionCategory)
        collectionViewRegionCategory.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.top.equalTo(labelRegionCategory.snp.bottom).offset(16)
            make.height.equalTo(92)
        }
        
    }
    //MARK: 나의 여행 일정에 맞는 모임
    let labelMyScheduleMeet : UILabel = {
        let label = UILabel()
        label.text = "나의 여행 일정에 맞는 밋트"
        label.textColor = .mainBlack
        label.font = UIFont(name: Constant.fontNotoSansKRBold, size: 16)
        return label
    }()
    
    let viewBackNoSchedule : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.15
        view.layer.shadowRadius = 10
        return view
    }()
    
    let viewNoSchedule : UIView = {
        let view = UIView()
        
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "plus")
        imageView.contentMode = .scaleAspectFit
        
        let label = UILabel()
        label.text = "나의 여행 일정을 등록해주세요.\n일정에 맞는 밋트를 알려드릴께요!"
        label.textColor = .mainGray
        label.font = UIFont(name: Constant.fontNotoSansKRRegular, size: 14)
        label.textAlignment = .center
        
        let button = UIButton()
        button.addTarget(self, action: #selector(actionSetSchedule), for: .touchUpInside)
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view).offset(20)
            make.width.height.equalTo(16)
        }
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.equalTo(imageView)
            make.bottom.equalTo(view).offset(-20)
        }
        
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
        return view
    }()
    @objc func actionSetSchedule() {
        let nextVC = RegisterScheduleViewController()
        nextVC.modalPresentationStyle = .overFullScreen
        self.present(nextVC, animated: false)
    }
    
    let buttonMoreMyScheduleMeet :  UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(actionGoMoreMySchedulMeet), for: .touchUpInside)
        button.setTitle("더보기", for: .normal)
        button.titleLabel?.font = UIFont(name: Constant.fontNotoSansKRBold, size: 12)
        button.setTitleColor(.mainGray, for: .normal)
        return button
    }()
    @objc func actionGoMoreMySchedulMeet() {
        let nextVC = MoreMyScheduleMeetViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    let labelMyScheduleText : UILabel = {
        let label = UILabel()
        label.text = "여행 일정"
        label.textColor = .mainBlack
        label.font = UIFont(name: Constant.fontNotoSansKRBold, size: 14)
        return label
    }()
    let labelMyScheduleDate : UILabel = {
        let label = UILabel()
        label.text = "2022.06.25(토) ~ 06.28(월)"
        label.textColor = .mainBlack
        label.font = UIFont(name: Constant.fontNotoSansKRRegular, size: 14)
        return label
    }()
    let labelMyScheduleDays : UILabel = {
        let label = UILabel()
        label.text = "3일"
        label.textColor = .mainColor
        label.font = UIFont(name: Constant.fontNotoSansKRBold, size: 14)
        return label
    }()
    
    let collectionViewMyScheduleMeet : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 8
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    //MARK: addSubview 나의 여행 일정에 맞는 밋트
    func setMyScheduleMeet() {
        viewContent.addSubview(labelMyScheduleMeet)
        labelMyScheduleMeet.snp.makeConstraints { make in
            make.leading.equalTo(labelRegionCategory)
            make.top.equalTo(collectionViewRegionCategory.snp.bottom).offset(24)
        }
        
        
        viewContent.addSubview(viewBackNoSchedule)
        viewBackNoSchedule.snp.makeConstraints { make in
            make.centerX.equalTo(viewContent)
            make.top.equalTo(labelMyScheduleMeet.snp.bottom).offset(16)
            make.width.equalTo(UIScreen.main.bounds.width * 0.9)
            make.height.equalTo(112)
        }
        
        viewBackNoSchedule.addSubview(viewNoSchedule)
        viewNoSchedule.snp.makeConstraints { make in
            make.edges.equalTo(viewBackNoSchedule)
        }
        
        viewContent.addSubview(buttonMoreMyScheduleMeet)
        buttonMoreMyScheduleMeet.snp.makeConstraints { make in
            make.trailing.equalTo(viewContent).offset(-20)
            make.centerY.equalTo(labelMyScheduleMeet)
            make.width.equalTo(40)
            make.height.equalTo(16)
        }
        
        viewContent.addSubview(labelMyScheduleText)
        labelMyScheduleText.snp.makeConstraints { make in
            make.leading.equalTo(viewContent).offset(28)
            make.top.equalTo(labelMyScheduleMeet.snp.bottom).offset(16)
        }
        viewContent.addSubview(labelMyScheduleDate)
        labelMyScheduleDate.snp.makeConstraints { make in
            make.leading.equalTo(labelMyScheduleText.snp.trailing).offset(12)
            make.centerY.equalTo(labelMyScheduleText)
        }
        viewContent.addSubview(labelMyScheduleDays)
        labelMyScheduleDays.snp.makeConstraints { make in
            make.leading.equalTo(labelMyScheduleDate.snp.trailing).offset(8)
            make.centerY.equalTo(labelMyScheduleText)
        }
        
        collectionViewMyScheduleMeet.delegate = self
        collectionViewMyScheduleMeet.dataSource = self
        collectionViewMyScheduleMeet.register(MyScheduleMeetCollectionViewCell.self, forCellWithReuseIdentifier: MyScheduleMeetCollectionViewCell.resueidentifier)
        viewContent.addSubview(collectionViewMyScheduleMeet)
        collectionViewMyScheduleMeet.snp.makeConstraints { make in
            make.leading.trailing.equalTo(viewContent)
            make.top.equalTo(labelMyScheduleText.snp.bottom)
            make.height.equalTo(252)
        }
    }
    
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
        button.addTarget(self, action: #selector(actionGoMoreRealTimeMeet), for: .touchUpInside)
        button.setTitle("더보기", for: .normal)
        button.titleLabel?.font = UIFont(name: Constant.fontNotoSansKRBold, size: 12)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    @objc func actionGoMoreRealTimeMeet() {
        let nextVC = MoreRealTimeViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    let collectionViewRealTime : UICollectionView = {
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

    //MARK: addSubView 실시간 미트
    func setRealTime() {
        viewContent.addSubview(labelRealTimeMeet)
        labelRealTimeMeet.snp.makeConstraints { make in
            make.leading.equalTo(labelRegionCategory)
            make.top.equalTo(collectionViewMyScheduleMeet.snp.bottom).offset(24)
        }
        
        viewContent.addSubview(buttonMoreRealTimeMeet)
        buttonMoreRealTimeMeet.snp.makeConstraints { make in
            make.centerY.equalTo(labelRealTimeMeet)
            make.trailing.equalTo(viewContent).offset(-20)
        }

        collectionViewRealTime.delegate = self
        collectionViewRealTime.dataSource = self
        collectionViewRealTime.register(RealTimeCollectionViewCell.self, forCellWithReuseIdentifier: RealTimeCollectionViewCell.resueidentifier)
        viewContent.addSubview(collectionViewRealTime)
        collectionViewRealTime.snp.makeConstraints { make in
            make.top.equalTo(labelRealTimeMeet.snp.bottom)
            make.leading.trailing.equalTo(viewContent)
            make.height.equalTo(730)
        }
    }
    
    
}

extension HomeViewController : UIScrollViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewRegionCategory {
            return 5
        } else if collectionView == collectionViewMyScheduleMeet {
            return 5
        } else {
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewRegionCategory {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RegionCategoryCollectionViewCell.resueidentifier, for: indexPath) as? RegionCategoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.labelRegionName.text = arrayRegion[indexPath.row]
            cell.imageViewRegion.image = UIImage(named: arrayRegion[indexPath.row])
            return cell
        } else if collectionView == collectionViewMyScheduleMeet {
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
        else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RealTimeCollectionViewCell.resueidentifier, for: indexPath) as? RealTimeCollectionViewCell else {
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViewRegionCategory {
            return CGSize(width: (UIScreen.main.bounds.width - 170)/5, height: 60)
        } else if collectionView == collectionViewMyScheduleMeet {
            return CGSize(width: (UIScreen.main.bounds.width * 0.9), height: 220)
        } else {
            return CGSize(width: (UIScreen.main.bounds.width * 0.9), height: 220)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionViewMyScheduleMeet {
            let nextVC = DetailMeetViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
        } else if  collectionView == collectionViewRealTime{
            let nextVC = DetailMeetViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
        } else {
            
        }
    }
}
