//
//  RegisterScheduleViewController.swift
//  GDG
//
//  Created by 노영재 on 2022/06/26.
//

import UIKit
import FSCalendar

class RegisterScheduleViewController: UIViewController {

    
    
    
    private let dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        view.alpha = 0.7
            return view
        }()
      
      // 2
      override func viewDidLoad() {
          super.viewDidLoad()
          setupUI()
          viewSetContent()
      }
    
      // 3
      private func setupUI() {
          view.addSubview(dimmedView)
        dimmedView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
      }
    // MARK: 내용이 들어갈 뷰
    let viewContent = UIView()
    
    let labelTitle : UILabel = {
        let label = UILabel()
        label.text = "나의 여행 일정 등록하기"
        label.numberOfLines = 0
        label.textColor = .mainBlack
        label.font = UIFont(name: Constant.fontNotoSansKRBold, size: 16)
        return label
    }()
    
    let buttonDismiss : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 14
        button.layer.borderColor = UIColor.mainColor.cgColor
        button.layer.borderWidth = 1
        button.setTitle("닫기", for: .normal)
        button.titleLabel?.font = UIFont(name: Constant.fontNotoSansKRBold, size: 14)
        button.setTitleColor(UIColor.mainColor, for: .normal)
        button.addTarget(self, action: #selector(actionDismiss), for: .touchUpInside)
        return button
    }()
    @objc func actionDismiss() {
        self.dismiss(animated: false)
    }
    
    let buttonRegister : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 14
        button.backgroundColor = .mainColor
        button.setTitle("등록", for: .normal)
        button.titleLabel?.font = UIFont(name: Constant.fontNotoSansKRBold, size: 14)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(actionRegister), for: .touchUpInside)
        return button
    }()
    @objc func actionRegister() {
        if lastDate == nil {
            print("아아아")
            self.dismiss(animated: false)
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
            let firstDateStr = dateFormatter.string(from: firstDate ?? Date())
            let lastDateStr = dateFormatter.string(from: lastDate ?? Date())
            UserDefaults.standard.set(firstDateStr, forKey: "firstDate")
            UserDefaults.standard.set(lastDateStr, forKey: "lastDate")
            Constant.userFirstDate = firstDateStr
            Constant.userLastDate = lastDateStr
            print(Constant.userFirstDate)
            NotificationCenter.default.post(name: NSNotification.Name("upload"), object: nil)
            self.dismiss(animated: false)
        }
    }
    
    //MARK: 캘린더 설정
    // 첫날 설정 및 마지막 날 설정
    private var firstDate : Date?
    private var lastDate : Date?
    private var dateRange : [Date]?
    func datesRange(from: Date, to: Date) -> [Date] {
        // in case of the "from" date is more than "to" date,
        // it should returns an empty array:
        if from > to { return [Date]() }

        var tempDate = from
        var array = [tempDate]

        while tempDate < to {
            tempDate = Calendar.current.date(byAdding: .day, value: 1, to: tempDate)!
            array.append(tempDate)
        }

        return array
    }
    let calendarView : FSCalendar = {
        let view = FSCalendar()
        
        return view
    }()
    
    func viewSetContent() {
        viewContent.layer.cornerRadius = 10
        viewContent.backgroundColor = .white
        view.addSubview(viewContent)
        viewContent.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.height.equalTo(470)
            make.width.equalTo(UIScreen.main.bounds.width * 0.9)
        }
        
        viewContent.addSubview(labelTitle)
        labelTitle.snp.makeConstraints { make in
            make.centerX.equalTo(viewContent)
            make.top.equalTo(viewContent).offset(20)
        }
        
        viewContent.addSubview(buttonRegister)
        buttonRegister.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(viewContent).offset(-20)
            make.width.equalTo(74)
            make.height.equalTo(28)
        }
        
        viewContent.addSubview(buttonDismiss)
        buttonDismiss.snp.makeConstraints { make in
            make.trailing.equalTo(buttonRegister.snp.leading).offset(-12)
            make.centerY.equalTo(buttonRegister)
            make.width.equalTo(74)
            make.height.equalTo(28)
        }
        
        setCalender()
    }
    
    func setCalender(){
        calendarView.delegate = self
        calendarView.dataSource = self
        viewContent.addSubview(calendarView)
        calendarView.snp.makeConstraints { make in
            make.centerX.equalTo(viewContent)
            make.top.equalTo(labelTitle.snp.bottom).offset(15)
            make.bottom.equalTo(buttonRegister.snp.top).offset(16)
            make.leading.equalTo(viewContent).offset(36)
            make.trailing.equalTo(viewContent).offset(-36)
        }
        // calender 한국어로 바꾸기
        calendarView.locale = Locale(identifier: "ko_KR")
        // 스크롤 불가능
        // calendarView.scrollEnabled = false
        // 다중 선택
        calendarView.allowsMultipleSelection = true
        // 드래그 다중 선택
        calendarView.swipeToChooseGesture.isEnabled = true
        
        //headr 꾸미기
        calendarView.appearance.headerMinimumDissolvedAlpha = 0.0
        calendarView.appearance.headerDateFormat = "YYYY년 MM월"
        calendarView.appearance.headerTitleColor = UIColor.mainBlack
        calendarView.appearance.headerTitleFont = UIFont(name: Constant.fontNotoSansKRBold, size: 16)
        calendarView.headerHeight = 30
        
        calendarView.appearance.eventDefaultColor = UIColor.green
        calendarView.appearance.titleDefaultColor = .mainColor  // 평일
        calendarView.appearance.titleWeekendColor = .mainColor    // 주말
        calendarView.appearance.weekdayFont = UIFont(name: Constant.fontNotoSansKRBold, size: 14)
        calendarView.appearance.weekdayTextColor = .mainBlack
        
        calendarView.appearance.selectionColor = .mainColor
    }

}

extension RegisterScheduleViewController : FSCalendarDelegate, FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        if firstDate == nil {
            firstDate = date
            dateRange = [firstDate ?? Date()]
            
            return
        } else if firstDate != nil , lastDate == nil {
            if date <= (firstDate ?? Date()) {
                calendar.deselect(firstDate ?? Date())
                firstDate = date
                dateRange = [firstDate ?? Date()]
                return
            }
            let range = datesRange(from: firstDate ?? Date(), to: date)
            
            if range.count == 3 || range.count == 7 {
                lastDate = range.last
                for i in range {
                    calendar.select(i)
                }
                
                dateRange = range
                
                return
            } else {
                presentAlert(title: "3일 또는 7일만 가능합니다.")
                calendar.deselect(firstDate ?? Date())
                calendar.deselect(date)
                
                firstDate = nil
                return
            }
            
        }
        
        if firstDate != nil, lastDate != nil {
            for i in calendar.selectedDates {
                calendar.deselect(i)
            }
            
            lastDate = nil
            firstDate = nil
            
            dateRange = []
        }
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        if firstDate != nil && lastDate != nil {
                for d in calendar.selectedDates {
                    calendar.deselect(d)
                }

                lastDate = nil
                firstDate = nil

                dateRange = []
            }
    }
}
