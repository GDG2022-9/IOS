//
//  UIView.swift
//  GDG
//
//  Created by 강민규 on 2022/06/25.
//

import Foundation
import UIKit


extension UIView{
    func roundUI(){
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
    }
}
