//
//  Fonts.swift
//  DesignSystem
//
//  Created by 상은 on 6/17/25.
//

import Foundation

import UIKit

public extension UIFont {
    enum PretendardStyle: String {
        case regular = "Pretendard-Regular"
        case semibold = "Pretendard-SemiBold"
        case bold = "Pretendard-Bold"
        case medium = "Pretendard-Medium"
    }
    
    static func pretendard(_ style: PretendardStyle, size: CGFloat) -> UIFont {
        return UIFont(name: style.rawValue, size: size) ?? .systemFont(ofSize: size)
    }
}

public enum Typography {
    case headingH1Bold
    case headingH2Bold
    case headingH3Bold
    case headingH4Bold
    
    
    case headingH1SemiBold
    case headingH2SemiBold
    case headingH3SemiBold
    case headingH4SemiBold
    case headingH5SemiBold
    case headingH6SemiBold
    
    case headingH1Medium
    case headingH2Medium
    case headingH3Medium
    case headingH4Medium
    case headingH5Medium
    case headingH6Medium
    
    case body1Regular
    case body2Regular
    case body3Regular
    case body4Regular
    case body5Regular
    
    case body5SemiBold
    case body4SemiBold
    case body3SemiBold
    case body2SemiBold
    case body1SemiBold
    
    case tabBarLabel

}

public extension Typography {
    var font: UIFont {
        switch self {
            case .headingH1Bold: return UIFont.pretendard(.bold, size: 48)
            case .headingH2Bold: return UIFont.pretendard(.bold, size: 40)
            case .headingH3Bold: return UIFont.pretendard(.bold, size: 32)
            case .headingH4Bold: return UIFont.pretendard(.bold, size: 24)

            case .headingH1SemiBold: return UIFont.pretendard(.semibold, size: 48)
            case .headingH2SemiBold: return UIFont.pretendard(.semibold, size: 40)
            case .headingH3SemiBold: return UIFont.pretendard(.semibold, size: 32)
            case .headingH4SemiBold: return UIFont.pretendard(.semibold, size: 24)
            case .headingH5SemiBold: return UIFont.pretendard(.semibold, size: 20)
            case .headingH6SemiBold: return UIFont.pretendard(.semibold, size: 16)
                
            case .headingH1Medium: return UIFont.pretendard(.medium, size: 48)
            case .headingH2Medium: return UIFont.pretendard(.medium, size: 40)
            case .headingH3Medium: return UIFont.pretendard(.medium, size: 32)
            case .headingH4Medium: return UIFont.pretendard(.medium, size: 24)
            case .headingH5Medium: return UIFont.pretendard(.medium, size: 20)
            case .headingH6Medium: return UIFont.pretendard(.medium, size: 18)
                
            case .body1Regular: return UIFont.pretendard(.regular, size: 18)
            case .body2Regular: return UIFont.pretendard(.regular, size: 16)
            case .body3Regular: return UIFont.pretendard(.regular, size: 14)
            case .body4Regular: return UIFont.pretendard(.regular, size: 12)
            case .body5Regular: return UIFont.pretendard(.regular, size: 10)
                
            case .body5SemiBold: return UIFont.pretendard(.semibold, size: 10)
            case .body4SemiBold: return UIFont.pretendard(.semibold, size: 12)
            case .body3SemiBold: return UIFont.pretendard(.semibold, size: 14)
            case .body2SemiBold: return UIFont.pretendard(.semibold, size: 16)
            case .body1SemiBold: return UIFont.pretendard(.semibold, size: 18)
            
            case .tabBarLabel: return UIFont.pretendard(.medium, size: 10)
        }
    }
}
