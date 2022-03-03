//
//  BaseViewController.swift
//  Loop
//
//  Created by mac 2019 on 2/22/22.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    // MARK: -Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = AppColors.background
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.view.endEditing(true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    func changeTheme(isDark: Bool) {
        if let window = UIApplication.shared.windows.first {
            window.overrideUserInterfaceStyle = isDark ? .dark : .light
        }
    }
    
    // MARK: -Custom Methods
    func setupNavBar(title: AppTexts?, logoClicked: LeftIconClicked?, profileClicked: RightProfileClicked?, notiClicked: RightNotiClicked?) {
        let navBar = NavBar(title: title?.rawValue.tr) {
            logoClicked?()
        } rightProfileClicked: {
            profileClicked?()
        } rightNotiClicked: {
            notiClicked?()
        }

        self.view.addSubview(navBar)
        navBar.addConstraintLTRB(left: (self.view, 0.s, true), top: (self.view, 0.s, true), right: (self.view, 0.s, true), height: SizeConfig.navBarHeight)
    }
}
