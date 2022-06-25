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
    func setLineDot(view: UIView, color: UIColor, radius: CGFloat){
            let borderLayer = CAShapeLayer()
            borderLayer.strokeColor = color.cgColor
            borderLayer.lineDashPattern = [2, 2]
            borderLayer.frame = view.bounds
            borderLayer.fillColor = nil
            borderLayer.path = UIBezierPath(roundedRect: view.bounds, cornerRadius: radius).cgPath

            view.layer.addSublayer(borderLayer)
        }
}
