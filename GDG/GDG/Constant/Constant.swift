//
//  Constant.swift
//  santaApp
//
//  Created by 노영재 on 2021/06/29.
//

import Alamofire

struct Constant {
    #if DEV
    static let baseURL = "https://test.smilesanta.site"
    #else
    static let baseURL = "https://smilesanta.site"
    #endif
    static let TestURL = "https://test.smilesanta.site"
    static let MainURL = "https://smilesanta.site"
    static let fontCocogoose = "Cocogoose"
    static var JWTToken = ""
    static var userIdx : Int?
    static var userEmail : String?
    static var deviceToken = ""
    static var pushToken = ""
    static var loginMethod = ""
    
    static var userPhoneHeight: CGFloat = 0
    static var userPhoneWidth : CGFloat = 0
    
    static let fontNotoSansKRBlack = "NotoSansKR-Black"
    static let fontNotoSansKRBold = "NotoSansKR-Bold"
    static let fontNotoSansKRLight = "NotoSansKR-Light"
    static let fontNotoSansKRMedium = "NotoSansKR-Medium"
    static let fontNotoSansKRRegular = "NotoSansKR-Regular"
    static let fontNotoSansKRThin = "NotoSansKR-Thin"
}

