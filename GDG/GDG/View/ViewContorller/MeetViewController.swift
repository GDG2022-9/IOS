//
//  MeetViewController.swift
//  GDG
//
//  Created by 강민규 on 2022/06/25.
//

import UIKit

class MeetViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setTitle()
        setDiv()
        setMyScheduleMeet()
        setDescription()
        setDiv2()
        setDetail()
        setDetail2()
        setDetail3()
        setDetail4()
        setMeetBtn()
        self.navigationItem.title = "밋트 등록하기"
        // Do any additional setup after loading the view.
    }
    //MARK: touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
    }
    //MARK: 초기화
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
    
    //MARK: 제목 입력
    let viewTitle : UITextField = {
        let title = UITextField()
        title.font = UIFont(name: Constant.fontNotoSansKRBold, size: 20)
        title.placeholder = "제목 입력하기"
        
        return title
    }()
    
    func setTitle() {
        viewContent.addSubview(viewTitle)
        viewTitle.snp.makeConstraints { make in
            make.top.equalTo(40)
            make.trailing.equalTo(viewContent.snp.trailing).offset(20)
            make.leading.equalTo(viewContent.snp.leading).offset(20)
            make.size.height.equalTo(40)
        }
    }
    
    //MARK: 구분선
    let divider : UIView = {
        let div = UIView()
        div.layer.borderWidth = 0.5
        div.layer.borderColor = UIColor.mainGray.cgColor
        return div
    }()
    
    func setDiv(){
        viewContent.addSubview(divider)
        divider.snp.makeConstraints { make in
            make.top.equalTo(viewTitle.snp.bottom).offset(10)
            make.centerX.equalTo(viewContent)
            make.width.equalTo(340)
            make.height.equalTo(0.5)
        }

    }
   
    
    //MARK: 사진추가
    
    let viewBackPicture : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.15
        view.layer.shadowRadius = 10
        return view
    }()
    
    let viewPicture : UIView = {
        let view = UIView()
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Vector")
        imageView.contentMode = .scaleAspectFit
        
        let label = UILabel()
        label.text = "모임을 설명할 수 있는 사진을 첨부해주세요!"
        label.textColor = .mainGray
        label.font = UIFont(name: Constant.fontNotoSansKRRegular, size: 14)
        label.textAlignment = .center
        
        let button = UIButton()
        button.addTarget(self, action: #selector(actionSetPicture), for: .touchUpInside)
        
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
    @objc func actionSetPicture() {
        print("클릭")
    }

    func setMyScheduleMeet() {

        viewContent.addSubview(viewBackPicture)
        viewBackPicture.snp.makeConstraints { make in
            make.centerX.equalTo(viewContent)
            make.top.equalTo(divider.snp.bottom).offset(24)
            make.width.equalTo(UIScreen.main.bounds.width * 0.9)
            make.height.equalTo(112)
        }

        viewContent.addSubview(viewPicture)
        viewPicture.snp.makeConstraints { make in
            make.edges.equalTo(viewBackPicture)
        }
    }

    
    //MARK: 내용 입력
    
    let viewDescription : UITextField = {
        let des = UITextField()
        des.font = UIFont(name: Constant.fontNotoSansKRRegular, size: 16)
        des.placeholder = "내용 입력하기"
        
        return des
    }()
    
    func setDescription() {
        viewContent.addSubview(viewDescription)
        viewDescription.snp.makeConstraints { make in
            make.top.equalTo(viewBackPicture.snp.bottom).offset(20)
            make.trailing.equalTo(viewContent.snp.trailing).offset(20)
            make.leading.equalTo(viewContent.snp.leading).offset(20)
            make.size.height.equalTo(80)
        }
    }
    //MARK: 구분선
    let divider2 : UIView = {
        let div = UIView()
        div.layer.borderWidth = 0.5
        div.layer.borderColor = UIColor.mainGray.cgColor
        return div
    }()
    
    func setDiv2(){
        viewContent.addSubview(divider2)
        divider2.snp.makeConstraints { make in
            make.top.equalTo(viewDescription.snp.bottom).offset(20)
            make.centerX.equalTo(viewContent)
            make.width.equalTo(340)
            make.height.equalTo(0.5)
        }

    }
    //MARK: 상세 주소 추가 1
    let viewDetail : UIView = {
        let view = UIView()
        let detailLabel : UILabel = {
            let label = UILabel()
            label.text = "지역/역명"
            label.textColor = .mainBlack
            label.font = UIFont(name:Constant.fontNotoSansKRBold, size: 14)
            return label
        }()
        
        let detailTF : UITextField = {
            let tf = UITextField()
            tf.textColor = .mainBlack
            tf.font = UIFont(name:Constant.fontNotoSansKRRegular, size: 14)
            tf.placeholder = "어떤 역이 제일 가까운가요?"
            return tf
        }()
        
        view.addSubview(detailLabel)
        detailLabel.snp.makeConstraints{make in
            make.top.left.equalTo(0)
            make.size.width.equalTo(100)
            make.size.height.equalTo(60)
        }

        view.addSubview(detailTF)
        detailTF.snp.makeConstraints { make in
            make.left.equalTo(detailLabel.snp.right).offset(16)
            make.top.equalTo(detailLabel.snp.top).offset(18)
        }
        
        return view
    }()
    

    
    //MARK: setDetail 1
    func setDetail(){
        viewContent.addSubview(viewDetail)
        viewDetail.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(divider2)
            make.height.equalTo(40)
        }

    }
    
    //MARK: 상세 주소 추가 2
    let viewDetail2 : UIView = {
        let view = UIView()
       
        let detailLabel : UILabel = {
            let label = UILabel()
            label.text = "상세 주소"
            label.textColor = .mainBlack
            label.font = UIFont(name:Constant.fontNotoSansKRBold, size: 14)
            return label
        }()
        
        let detailTF : UITextField = {
            let tf = UITextField()
            tf.textColor = .mainBlack
            tf.font = UIFont(name:Constant.fontNotoSansKRRegular, size: 14)
            tf.placeholder = "어디로 가면 되나요?"
            return tf
        }()
        
        view.addSubview(detailLabel)
        detailLabel.snp.makeConstraints{make in
            make.top.left.equalTo(0)
            make.size.width.equalTo(100)
            make.size.height.equalTo(60)
        }

        view.addSubview(detailTF)
        detailTF.snp.makeConstraints { make in
            make.left.equalTo(detailLabel.snp.right).offset(16)
            make.top.equalTo(detailLabel.snp.top).offset(18)
        }
        
        return view
    }()
    

    
    //MARK: setDetail 2
    func setDetail2(){
        viewContent.addSubview(viewDetail2)
        viewDetail2.snp.makeConstraints { make in
            make.top.equalTo(viewDetail.snp.bottom).offset(0)
            make.leading.trailing.equalTo(viewDetail)
            make.height.equalTo(40)
        }

    }
    //MARK: 상세 주소 추가 3
    let viewDetail3 : UIView = {
        let view = UIView()
        let detailLabel : UILabel = {
            let label = UILabel()
            label.text = "밋트 시간"
            label.textColor = .mainBlack
            label.font = UIFont(name:Constant.fontNotoSansKRBold, size: 14)
            return label
        }()
        
        let detailTF : UITextField = {
            let tf = UITextField()
            tf.textColor = .mainBlack
            tf.font = UIFont(name:Constant.fontNotoSansKRRegular, size: 14)
            tf.placeholder = "몇 시에 만나나요?"
            return tf
        }()
        
        view.addSubview(detailLabel)
        detailLabel.snp.makeConstraints{make in
            make.top.left.equalTo(0)
            make.size.width.equalTo(100)
            make.size.height.equalTo(60)
        }

        view.addSubview(detailTF)
        detailTF.snp.makeConstraints { make in
            make.left.equalTo(detailLabel.snp.right).offset(16)
            make.top.equalTo(detailLabel.snp.top).offset(18)
        }
        
        return view
    }()
    

    
    //MARK: setDetail 3
    func setDetail3(){
        viewContent.addSubview(viewDetail3)
        viewDetail3.snp.makeConstraints { make in
            make.top.equalTo(viewDetail2.snp.bottom).offset(0)
            make.leading.trailing.equalTo(viewDetail2)
            make.height.equalTo(40)
        }

    }
    //MARK: 상세 주소 추가 4
    let viewDetail4 : UIView = {
        let view = UIView()
        let detailLabel : UILabel = {
            let label = UILabel()
            label.text = "밋트 인원"
            label.textColor = .mainBlack
            label.font = UIFont(name:Constant.fontNotoSansKRBold, size: 14)
            return label
        }()
        
        let detailTF : UITextField = {
            let tf = UITextField()
            tf.textColor = .mainBlack
            tf.font = UIFont(name:Constant.fontNotoSansKRRegular, size: 14)
            tf.placeholder = "몇 명까지 만날 수 있나요?"
            return tf
        }()
        
        view.addSubview(detailLabel)
        detailLabel.snp.makeConstraints{make in
            make.top.left.equalTo(0)
            make.size.width.equalTo(100)
            make.size.height.equalTo(60)
        }

        view.addSubview(detailTF)
        detailTF.snp.makeConstraints { make in
//            make.left.equalTo(detailLabel.snp.right).offset(16)
//            make.top.equalTo(detailLabel.snp.top).offset(18)
            make.centerY.equalTo(detailLabel)
            make.left.equalTo(detailLabel.snp.right).offset(16)
           
        }
        
        return view
    }()
    

    
    //MARK: setDetail 4
    func setDetail4(){
        viewContent.addSubview(viewDetail4)
        viewDetail4.snp.makeConstraints { make in
            make.top.equalTo(viewDetail3.snp.bottom).offset(0)
            make.leading.trailing.equalTo(viewDetail3)
            make.height.equalTo(40)
        }

    }
    
    let buttonMakeMeet: UIButton = {
        let button = UIButton()
        button.roundUI()
        button.layer.cornerRadius = 18
        button.backgroundColor = .mainColor
        button.setTitle("밋트 만들기",for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(actionMakeMeet), for: .touchUpInside)
        return button
    }()
    @objc func actionMakeMeet() {
        print("밋트 생성")
    }
    func setMeetBtn(){
        viewContent.addSubview(buttonMakeMeet)
        buttonMakeMeet.snp.makeConstraints { make in
            make.top.equalTo(viewDetail4.snp.bottom).offset(60)
            make.leading.trailing.equalTo(viewDetail4)
            make.height.equalTo(36)
        }
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
