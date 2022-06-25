//
//  MypageViewController.swift
//  GDG
//
//  Created by 강민규 on 2022/06/25.
//

import UIKit
import SnapKit


class MypageViewController: UIViewController, UIScrollViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setUserInfo()
        //setMyScheduleMeet()
        
        self.navigationItem.title = "마이페이지"
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    override func viewDidAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
    override func viewDidLayoutSubviews() {
        viewNoSchedule.setLineDot(view: viewNoSchedule, color: .mainGray, radius: 10)
    }
   
    let viewContent : UIView = {
        let view = UIView()
        return view
    }()

    func setView() {
        view.addSubview(viewContent)
        viewContent.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(view)
            make.top.equalTo(view).offset(100)
            
        }
    }

    
    //MARK: 프로필 사진, 이름, 구분선
    let viewUser : UIView = {
        let view = UIView()
        
        let imageUser : UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(systemName: "plus")
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        
        let labelUser : UILabel = {
            let label = UILabel()
            label.text = "소금찍은 계란"
            label.textColor = .mainBlack
            label.font = UIFont(name:Constant.fontNotoSansKRBold, size: 16)
            return label
        }()
        
        view.addSubview(imageUser)
        imageUser.snp.makeConstraints{make in
            make.top.left.equalTo(40)
            make.size.width.height.equalTo(40)
        }

        view.addSubview(labelUser)
        labelUser.snp.makeConstraints { make in
            make.left.equalTo(imageUser.snp.right).offset(16)
            make.top.equalTo(imageUser.snp.top).offset(8)
        }
        
        return view
    }()
    
    let divider : UIView = {
        let div = UIView()
        div.layer.borderWidth = 0.5
        return div
    }()

    
    //MARK: addSubView 프로필 사진, 이름, 구분선
    func setUserInfo(){
        viewContent.addSubview(viewUser)
        viewUser.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(viewContent)
            make.height.equalTo(100)
        }
        
        viewContent.addSubview(divider)
        divider.snp.makeConstraints { make in
            make.top.equalTo(viewUser.snp.bottom).offset(0)
            make.centerX.equalTo(viewContent)
            make.width.equalTo(320)
            make.height.equalTo(1)
        }
    }
    
    
    //MARK: 나의 여행 일정에 맞는 모임
    let labelMyScheduleMeet : UILabel = {
        let label = UILabel()
        label.text = "나의 여행 일정"
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
        print("클릭")
    }
    
    //MARK: addSubview 나의 여행 일정에 맞는 밋트
    func setMyScheduleMeet() {
        viewContent.addSubview(labelMyScheduleMeet)
        labelMyScheduleMeet.snp.makeConstraints { make in
            make.top.equalToSuperview()
        }
//        labelMyScheduleMeet.snp.makeConstraints { make in
//            make.leading.equalTo(UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
//            make.top.equalTo(UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
//        }
//
//
//        viewContent.addSubview(viewBackNoSchedule)
//        viewBackNoSchedule.snp.makeConstraints { make in
//            make.centerX.equalTo(viewContent)
//            make.top.equalTo(labelMyScheduleMeet.snp.bottom).offset(16)
//            make.width.equalTo(UIScreen.main.bounds.width * 0.9)
//            make.height.equalTo(112)
//        }
//
//        viewContent.addSubview(viewNoSchedule)
//        viewNoSchedule.snp.makeConstraints { make in
//            make.edges.equalTo(viewBackNoSchedule)
//        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
