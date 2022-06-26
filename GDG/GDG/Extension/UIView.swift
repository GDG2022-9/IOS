//
//  UIView.swift
//  GDG
//
//  Created by 노영재 on 2022/06/26.
//

import Foundation
import UIKit

extension UIView {
    func setGradient(color1:UIColor,color2:UIColor){
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [color1.cgColor,color2.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradient.frame = bounds
        layer.addSublayer(gradient)
    }
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
