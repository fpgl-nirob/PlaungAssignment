//
//  NavBar.swift
//  Loop
//
//  Created by mac 2019 on 2/23/22.
//

import Foundation
import UIKit

typealias LeftIconClicked = () -> Void
typealias RightProfileClicked = () -> Void
typealias RightNotiClicked = () -> Void

final class NavBar: UIView {
    private var leftIconClicked: LeftIconClicked?
    private var rightProfileClicked: RightProfileClicked?
    private var rightNotiClicked: RightNotiClicked?
    
    private var title: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(title: String?, leftIconClicked: LeftIconClicked?, rightProfileClicked: RightProfileClicked?, rightNotiClicked: RightNotiClicked?) {
        let frame = CGRect.zero
        super.init(frame: frame)
        self.frame = frame
        self.backgroundColor = AppColors.background
        
        self.leftIconClicked = leftIconClicked
        self.rightProfileClicked = rightProfileClicked
        self.rightNotiClicked = rightNotiClicked
        
        self.title = title
        
        setupUI()
    }
    
    private func setupUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let leftLogo = UIView.createButton(imageName: .logoSmall)
        leftLogo.addTarget(self, action: #selector(leftLogoPressed), for: .touchUpInside)
        self.addSubview(leftLogo)
        leftLogo.addConstraintLTRB(left: (self, 20.s, true), centerY: (self, 16.s))
        
        let rightProfile = UIView.createButton(imageName: .profile)
        rightProfile.addTarget(self, action: #selector(rightProfilePressed), for: .touchUpInside)
        self.addSubview(rightProfile)
        rightProfile.addConstraintLTRB(right: (self, -20.s, true), centerY: (self, 16.s))
        
        let rightNoti = UIView.createButton(imageName: .notification)
        rightNoti.addTarget(self, action: #selector(rightNotiPressed), for: .touchUpInside)
        self.addSubview(rightNoti)
        rightNoti.addConstraintLTRB(right: (rightProfile, -6.s, false), centerY: (self, 16.s))
        
        let title = UIView.createLabel(self.title)
        title.numberOfLines = 1
        title.textAlignment = .center
        title.font = AppFonts.InterMedium(ofSize: 16.sp)
        title.textColor = AppColors.whiteBlack
        self.addSubview(title)
        title.addConstraintLTRB(centerX: (self, 0.s), centerY: (self, 16.s), width: 200.s)
    }
    
    @objc private func leftLogoPressed(sender: UIButton) {
        self.leftIconClicked?()
    }
    
    @objc private func rightProfilePressed(sender: UIButton) {
        self.rightProfileClicked?()
    }
    
    @objc private func rightNotiPressed(sender: UIButton) {
        self.rightNotiClicked?()
    }
}
