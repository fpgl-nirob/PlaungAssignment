//
//  NHConstants.swift
//  PlaungAssignment
//
//  Created by mac 2019 on 3/3/22.
//

import Foundation
import UIKit

struct AppConstants {
    static let kUserDefaultFirstTimeKey = "kFirstTimeKey"
    static let kUserDefaultLoginKey = "kLoginKey"
    static let kUserDefaultSecreteTokenKey = "kSecreteTokenKey"
    static let kUserDefaultCurrentUserIdKey = "kCurrentUserIdKey"
}

struct AppFonts {
    
    static func InterRegular(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Inter-Regular", size: ofSize)!
    }
    
    static func InterExtraLight(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Inter-ExtraLight", size: ofSize)!
    }
    
    static func InterThin(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Inter-Thin", size: ofSize)!
    }
    
    static func InterLight(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Inter-Light", size: ofSize)!
    }
    
    static func InterMedium(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Inter-Medium", size: ofSize)!
    }
    
    static func InterSemiBold(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Inter-SemiBold", size: ofSize)!
    }
    
    static func InterBold(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Inter-Bold", size: ofSize)!
    }
    
    static func InterExtraBold(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Inter-ExtraBold", size: ofSize)!
    }
    
    static func InterBlack(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Inter-Black", size: ofSize)!
    }
    
    static func RobotoRegular(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Regular", size: ofSize)!
    }
    
    static func RobotoItalic(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Italic", size: ofSize)!
    }
    
    static func RobotoThin(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Thin", size: ofSize)!
    }
    
    static func RobotoLight(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Light", size: ofSize)!
    }
    
    static func RobotoLightItalic(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-LightItalic", size: ofSize)!
    }
    
    static func RobotoMedium(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Medium", size: ofSize)!
    }
    
    static func RobotoMediumItalic(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-MediumItalic", size: ofSize)!
    }
    
    static func RobotoBold(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Bold", size: ofSize)!
    }
    
    static func RobotoBoldItalic(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-BoldItalic", size: ofSize)!
    }
    
    static func RobotoBlack(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Black", size: ofSize)!
    }
    
    static func RobotoBlackItalic(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-BlackItalic", size: ofSize)!
    }
    
}

struct AppColors {
    static let white = UIColor(rgb: 0xFFFFFF)
    static let transparent = UIColor.clear
    static let red = UIColor(red: 255.0/255.0, green: 0.0, blue: 0.0, alpha: 1.0)
    static let gray = UIColor.gray
    static let background = UIColor(named: "Background") ?? UIColor.clear
    static let whiteBlack = UIColor(named: "WhiteBlack") ?? UIColor.clear
    static let buttonGradient1 = UIColor(named: "ButtonGradient1") ?? UIColor.clear
    static let buttonGradient2 = UIColor(named: "ButtonGradient2") ?? UIColor.clear
    static let grayA8 = UIColor(named: "GrayA8") ?? UIColor.clear
    static let gray71 = UIColor(named: "Gray71") ?? UIColor.clear
    static let white3A = UIColor(named: "White3A") ?? UIColor.clear
    static let b9d67 = UIColor(named: "B9D67") ?? UIColor.clear
    static let d166 = UIColor(named: "D166") ?? UIColor.clear
    static let d40F9 = UIColor(named: "D40F9") ?? UIColor.clear
    static let d40White = UIColor(named: "D40White") ?? UIColor.clear
    static let b253 = UIColor(named: "B253") ?? UIColor.clear
    static let cc67 = UIColor(named: "CC67") ?? UIColor.clear
    static let d40ef = UIColor(named: "D40EF") ?? UIColor.clear
    static let white67 = UIColor(named: "White67") ?? UIColor.clear
    static let white35 = UIColor(named: "White35") ?? UIColor.clear
    static let a4c3 = UIColor(named: "A4C3") ?? UIColor.clear
    static let c006 = UIColor(named: "C006") ?? UIColor.clear
    static let searchBGColor = UIColor(named: "A7067") ?? UIColor.clear
    static let grayE9 = UIColor(rgb: 0xE9E9E9)
    static let gray99 = UIColor(rgb: 0x999999)
    static let switchBlueColor = UIColor(rgb: 0x071332)
}

enum AppTexts: String {
    case translate_id_0001
    case translate_id_0002
    case translate_id_0003
    case translate_id_0004
    case translate_id_0005
    case translate_id_0006
    case translate_id_0007
    case translate_id_0008
    case translate_id_0009
    case translate_id_0010
    case translate_id_0011
    case translate_id_0012
    case translate_id_0013
    case translate_id_0014
    case translate_id_0015
    case translate_id_0016
    case translate_id_0017
    case translate_id_0018
    case translate_id_0019
    case translate_id_0020
    case translate_id_0021
    case translate_id_0022
    case translate_id_0023
    case translate_id_0024
    case translate_id_0025
    case translate_id_0026
    case translate_id_0027
    case translate_id_0028
    case translate_id_0029
    case translate_id_0030
    case translate_id_0031
    case translate_id_0032
    case translate_id_0033
    case translate_id_0034
    case translate_id_0035
    case translate_id_0036
    case translate_id_0037
    case translate_id_0038
    case translate_id_0039
    case translate_id_0040
}

enum AppImages: String {
    // Login
    case logo = "Logo"
    case loopLogo = "LoopLogo"
    case email = "Email"
    case password = "Password"
    // Bottom Tabbar
    case creators = "Creators"
    case home = "Home"
    case menu = "Menu"
    case searchView = "SearchView"
    case creatorsSelected = "CreatorsSelected"
    case homeSelected = "HomeSelected"
    case menuSelected = "MenuSelected"
    case searchViewSelected = "SearchViewSelected"
    // Top Navbar
    case logoSmall = "LogoSmall"
    case profile = "Profile"
    case notification = "Notification"
    // home
    case profile1 = "Profile1"
    case profile2 = "Profile2"
    case profile3 = "Profile3"
    case profile4 = "Profile4"
    case emptySearch = "EmptySearch"
    case myProfileBG = "MyProfileBG"
    case myProfile = "MyProfile"
}

struct APIConstants {
    static let bearerKey = "Authorization";
    
    static let baseUrl = "https://bd50.ocdev.me/api/";
    static let loginEndPoint = "user/login";
}
