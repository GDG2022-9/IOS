//
//  MoreRealTimeViewController.swift
//  GDG
//
//  Created by 노영재 on 2022/06/26.
//

import UIKit

class MoreRealTimeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setNavigation()
        setCollectionView()
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.post(name: Notification.Name("middleButtonAppear"), object: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.post(name: Notification.Name("middleButtonHidden"), object: nil)
    }
    //MARK: navigation
    func setNavigation() {
        navigationItem.title = "실시간 밋트"
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .mainBlack

        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: Constant.fontNotoSansKRBold, size: 16)!]
    }
    
    
    //MARK: collectionView
    let collectionViewRealTime: UICollectionView = {
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
    
    func setCollectionView() {
        collectionViewRealTime.delegate = self
        collectionViewRealTime.dataSource = self
        collectionViewRealTime.register(RealTimeCollectionViewCell.self, forCellWithReuseIdentifier: RealTimeCollectionViewCell.resueidentifier)
        
        view.addSubview(collectionViewRealTime)
        collectionViewRealTime.snp.makeConstraints { make in
            make.top.equalTo(view).offset(100)
            make.bottom.leading.trailing.equalTo(view)
        }
    }
}

extension MoreRealTimeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: (UIScreen.main.bounds.width * 0.9), height: 220)

    }
}
