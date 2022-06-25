//
//  RegisterScheduleViewController.swift
//  GDG
//
//  Created by 노영재 on 2022/06/26.
//

import UIKit

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
    func viewSetContent() {
        viewContent.backgroundColor = .white
        view.addSubview(viewContent)
        viewContent.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.height.equalTo(470)
            make.width.equalTo(UIScreen.main.bounds.width * 0.9)
        }
    }

}
