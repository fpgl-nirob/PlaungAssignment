//
//  UIView+Extension.swift
//  PlaungAssignment
//
//  Created by mac 2019 on 3/3/22.
//

import Foundation
import UIKit

extension UIView {
    
    /**
     Rounds the given set of corners to the specified radius
     
     - parameter corners: Corners to round
     - parameter radius:  Radius to round to
     */
    func round(corners: UIRectCorner, radius: CGFloat) {
        //_ = _round(corners: corners, radius: radius)
        let mask = _round(corners: corners, radius: radius)
        addBorder(mask: mask, borderColor: UIColor.clear, borderWidth: 0.0)
    }
    
    /**
     Rounds the given set of corners to the specified radius with a border
     
     - parameter corners:     Corners to round
     - parameter radius:      Radius to round to
     - parameter borderColor: The border color
     - parameter borderWidth: The border width
     */
    func round(corners: UIRectCorner, radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        let mask = _round(corners: corners, radius: radius)
        addBorder(mask: mask, borderColor: borderColor, borderWidth: borderWidth)
    }
    
    func round(radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
        if borderWidth > 0.0 {
            self.layer.borderWidth = borderWidth
            self.layer.borderColor = borderColor.cgColor;
        }
    }
    
    func round(radius: CGFloat) {
        self.round(radius: radius, borderColor: UIColor.clear, borderWidth: 0.0)
    }
    
    /**
     Fully rounds an autolayout view (e.g. one with no known frame) with the given diameter and border
     
     - parameter diameter:    The view's diameter
     - parameter borderColor: The border color
     - parameter borderWidth: The border width
     */
    func fullyRound(diameter: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        layer.masksToBounds = true
        layer.cornerRadius = diameter / 2
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor;
    }
    
    // Example use: myView.addBorder(toSide: .Left, withColor: UIColor.redColor().CGColor, andThickness: 1.0)
    
    enum ViewSide {
        case left, right, top, bottom
    }
    
    func addBorder(toSide side: ViewSide, withColor color: CGColor, andThickness thickness: CGFloat) {
        
        let border = CALayer()
        border.backgroundColor = color
        
        switch side {
        case .left: border.frame = CGRect(x: 0, y: 0, width: thickness, height: self.frame.size.height); break
        case .right: border.frame = CGRect(x: self.frame.size.width - thickness, y: 0, width: thickness, height: self.frame.size.height); break
        case .top: border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: thickness); break
        case .bottom: border.frame = CGRect(x: 0, y: self.frame.size.height - thickness, width: self.frame.size.width, height: thickness); break
        }
        
        layer.addSublayer(border)
    }
    
    func addBorder(borderColor: UIColor, borderWidth: CGFloat, cornerRadius: CGFloat = 0) {
        layer.masksToBounds = true
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor;
        if cornerRadius > 0 {
            layer.cornerRadius = cornerRadius
        }
    }
    
    enum GradientMode {
        case horizontal, vertical
    }
    
    func addGradient(_colors: [CGColor], _locations: [NSNumber], _gradientMode: GradientMode) {
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = _colors
        gradient.locations = _locations
        if _gradientMode == .horizontal {
            gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        }
        else {
            gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
            gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        }
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height)
        
        self.layer.addSublayer(gradient)
    }
    
    func addGradient(color1: UIColor, color2: UIColor) {
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height)
        
        self.layer.addSublayer(gradient)
    }
    
    // roundWithShadow function works well all UIView elements except UITextView
    // if apply roundWithShadow to UITextView then the text is going upper from the bounds frame.
    func roundWithShadow(_cornerRadius: CGFloat, _x: CGFloat, _y: CGFloat, _blar: CGFloat, _spread: CGFloat = 0.0, _shadowOpacity: Float = 1.0, _shadowColor: UIColor) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = _cornerRadius
        
        //To apply Shadow
        self.layer.masksToBounds = false
        self.layer.shadowOpacity = _shadowOpacity
        self.layer.shadowRadius = _blar / 2.0
        self.layer.shadowOffset = CGSize(width: _x, height: _y) // Use any CGSize
        self.layer.shadowColor = _shadowColor.cgColor
        if _spread == 0 {
            self.layer.shadowPath = nil
        } else {
            let dx = -_spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            self.layer.shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
    
    func removeShadow() {
        self.layer.shadowOffset = CGSize(width: 0 , height: 0)
        self.layer.shadowColor = UIColor.clear.cgColor
        self.layer.shadowRadius = 0.0
        self.layer.shadowOpacity = 0.0
    }
    
    func showShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.18
        layer.shadowOffset = CGSize(width: 6, height: 6)
        layer.shadowRadius = 15.s
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func addShadow(shadowColor: UIColor, offSet: CGSize, opacity: Float, shadowRadius: CGFloat, cornerRadius: CGFloat, corners: UIRectCorner = [.topLeft, .topRight, .bottomLeft, .bottomRight], fillColor: UIColor = .white) {
        
        let shadowLayer = CAShapeLayer()
        let size = CGSize(width: cornerRadius, height: cornerRadius)
        let cgPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: size).cgPath //1
        shadowLayer.path = cgPath //2
        shadowLayer.fillColor = fillColor.cgColor //3
        shadowLayer.shadowColor = shadowColor.cgColor //4
        shadowLayer.shadowPath = cgPath
        shadowLayer.shadowOffset = offSet //5
        shadowLayer.shadowOpacity = opacity
        shadowLayer.shadowRadius = shadowRadius
        shadowLayer.name =  "shadowLayer"
        
        self.removeLayer(layerName: "shadowLayer")
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor =  UIColor.black.withAlphaComponent(0.15).cgColor
        self.layer.borderWidth = 0.5
        self.layer.insertSublayer(shadowLayer, at: 0)
    }
    
    func removeLayer(layerName: String) {
        for item in self.layer.sublayers ?? [] where item.name == layerName {
            item.removeFromSuperlayer()
        }
    }
    
    func animateRotation(duration: TimeInterval, repeat: Bool, completion: ((Bool) -> ())?) {

        var options = UIView.KeyframeAnimationOptions(rawValue: UIView.AnimationOptions.curveLinear.rawValue)

        if `repeat` {
            options.insert(.repeat)
        }

        UIView.animateKeyframes(withDuration: duration, delay: 0, options: options, animations: {

            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
            })

            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            })

            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                self.transform = CGAffineTransform(rotationAngle: 3*CGFloat.pi/2)
            })

            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                self.transform = CGAffineTransform(rotationAngle: 2*CGFloat.pi)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 1, relativeDuration: 0.25, animations: {
                self.transform = CGAffineTransform(rotationAngle: 5*CGFloat.pi/2)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 1.25, relativeDuration: 0.25, animations: {
                self.transform = CGAffineTransform(rotationAngle: 3*CGFloat.pi)
            })
            UIView.addKeyframe(withRelativeStartTime: 1.5, relativeDuration: 0.25, animations: {
                self.transform = CGAffineTransform(rotationAngle: 7*CGFloat.pi/2)
            })
            UIView.addKeyframe(withRelativeStartTime: 1.75, relativeDuration: 0.25, animations: {
                self.transform = CGAffineTransform(rotationAngle: 4*CGFloat.pi)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 2, relativeDuration: 0.25, animations: {
                self.transform = CGAffineTransform(rotationAngle: 9*CGFloat.pi/2)
            })
            
        }, completion: completion)
    }
}

extension UIView {
    // touple (UIView, CGFloat, Bool) = UIView = equaltToView, CGFloat = constant, Bool = it is usual direction, like top for topanchor
    func addConstraintLTRB(left: (UIView, CGFloat, Bool)? = nil, top: (UIView, CGFloat, Bool)? = nil, right:  (UIView, CGFloat, Bool)? = nil, bottom:  (UIView, CGFloat, Bool)? = nil, centerX: (UIView, CGFloat)? = nil, centerY: (UIView, CGFloat)? = nil, height: CGFloat? = nil, width: CGFloat? = nil) {
        self.translatesAutoresizingMaskIntoConstraints = false
        var constraints: [NSLayoutConstraint] = [NSLayoutConstraint]()
        if left != nil {
            constraints.append(self.leadingAnchor.constraint(equalTo: left!.2 ? left!.0.leadingAnchor : left!.0.trailingAnchor, constant: left!.1))
        }
        if top != nil {
            constraints.append(self.topAnchor.constraint(equalTo: top!.2 ? top!.0.topAnchor : top!.0.bottomAnchor, constant: top!.1))
        }
        if right != nil {
            constraints.append(self.trailingAnchor.constraint(equalTo: right!.2 ? right!.0.trailingAnchor : right!.0.leadingAnchor, constant: right!.1))
        }
        if bottom != nil {
            constraints.append(self.bottomAnchor.constraint(equalTo: bottom!.2 ? bottom!.0.bottomAnchor : bottom!.0.topAnchor, constant: bottom!.1))
        }
        if height != nil {
            constraints.append(self.heightAnchor.constraint(equalToConstant: height!))
        }
        if width != nil {
            constraints.append(self.widthAnchor.constraint(equalToConstant: width!))
        }
        if centerX != nil {
            constraints.append(self.centerXAnchor.constraint(equalTo: centerX!.0.centerXAnchor, constant: centerX!.1))
        }
        if centerY != nil {
            constraints.append(self.centerYAnchor.constraint(equalTo: centerY!.0.centerYAnchor, constant: centerY!.1))
        }
        
        NSLayoutConstraint.activate(constraints)
    }
    func findViewController() -> UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.findViewController()
        }
        else {
            return nil
        }
    }
    func removeSubviews() {
        self.subviews.forEach { (item) in
            item.removeFromSuperview()
        }
    }
    
    ///Constraints a view to its superview
    func constraintToSuperView() {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        
        topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
        leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
    }
    
}

private extension UIView {
    
    @discardableResult func _round(corners: UIRectCorner, radius: CGFloat) -> CAShapeLayer {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        return mask
    }
    
    func addBorder(mask: CAShapeLayer, borderColor: UIColor, borderWidth: CGFloat) {
        let borderLayer = CAShapeLayer()
        borderLayer.path = mask.path
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = borderColor.cgColor
        borderLayer.lineWidth = borderWidth
        borderLayer.frame = bounds
        layer.addSublayer(borderLayer)
    }
    
}

extension UIView {
    static func createLabel(text: AppTexts?) -> UILabel {
        return createLabel(text?.rawValue.tr)
    }
    
    static func createLabel(_ text: String? = nil) -> UILabel {
        let label: UILabel = UILabel()
        label.text = text
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func createButton(imageName: AppImages? = nil) -> UIButton {
        return createButton(imageName?.rawValue)
    }
    
    static func createButton(_ imageName: String? = nil) -> UIButton {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: imageName ?? ""), for: .normal)
        return button
    }
    
    static func createButton(title: AppTexts?) -> UIButton {
        return createButton(title: title?.rawValue.tr)
    }
    
    static func createButton(title: String?) -> UIButton {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = AppFonts.InterRegular(ofSize: 12.s)
        return button
    }
    
    static func createImageView(imageName: AppImages?) -> UIImageView {
        return createImageView(imageName?.rawValue)
    }
    
    static func createImageView(_ imageName: String?) -> UIImageView {
        let imageView: UIImageView = UIImageView()
        imageView.image = UIImage(named: imageName!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    static func createView() -> UIView {
        let cView: UIView = UIView()
        cView.backgroundColor = UIColor.white
        cView.translatesAutoresizingMaskIntoConstraints = false
        return cView
    }
    
     static func createPrimaryButton(_ title: AppTexts? = nil, buttonSize: CGSize) -> PrimaryButton {
        let button = PrimaryButton(frame: CGRect(x: 0.0, y: 0.0, width: buttonSize.width , height: buttonSize.height))
        button.setTitle(title?.rawValue.tr, for: .normal)
        return button
    }
    
    static func createSmallButton(_ title: AppTexts? = nil) -> PrimaryButton  {
        let button = createPrimaryButton(title, buttonSize: CGSize(width: 166.s, height: 44.s))
        
        return button
    }
    
    static func createLargeButton(_ title: AppTexts? = nil) -> PrimaryButton  {
        let button = createPrimaryButton(title, buttonSize: CGSize(width: 290.s, height: 40.s))
        
        return button
    }

    static func createTextField(placeholder: AppTexts?, leftIcon: AppImages) -> PrimaryTextField {
        return createTextField(placeholder: placeholder?.rawValue, leftIcon: leftIcon.rawValue)
    }
    
    static func createTextField(placeholder: String?, leftIcon: String) -> PrimaryTextField {
        let textField = PrimaryTextField(frame: CGRect(x: 0, y: 0, width: 290.s, height: 40.s))
        textField.placeholder = placeholder?.tr
        textField.setLeftIcon(UIImage(named: leftIcon)!, _userInteractionEnabled: false)
        return textField
    }
    
    static func createSearchTextField(placeholder: AppTexts?) -> UISearchTextField {
        return createSearchTextField(placeholder: placeholder?.rawValue)
    }
    
    static func createSearchTextField(placeholder: String?) -> UISearchTextField {
        let searchField = UISearchTextField()
        searchField.borderStyle = .none
        searchField.backgroundColor = AppColors.searchBGColor.withAlphaComponent(0.5)
        searchField.placeholder = placeholder?.tr
        return searchField
    }
    
    static func createCircularButton(_ title: AppTexts? = nil) -> PrimaryButton  {
        let button = createPrimaryButton(title, buttonSize: CGSize(width: 140.s, height: 140.s))
        button.isCircular = true
        return button
    }
    
    public static func createTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) -> UITableView {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.clear
        
        return tableView
    }
    
    public static func createCollectionView(delegate: UICollectionViewDelegate?, dataSource: UICollectionViewDataSource?) -> UICollectionView {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0.s, left: 0.s, bottom: 0.s, right: 0.s)
        layout.minimumInteritemSpacing = 2.s
        layout.minimumLineSpacing = 2.s
        layout.itemSize = CGSize(width: 75.s, height: 90.s)
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
        collectionView.backgroundColor = UIColor.clear
        
        return collectionView
    }
    
    public static func createPickerView(delegate: UIPickerViewDelegate, dataSource: UIPickerViewDataSource) -> UIPickerView {
        let pickerView = UIPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.delegate = delegate
        pickerView.dataSource = dataSource
        pickerView.backgroundColor = UIColor.clear
        
        return pickerView
    }
    
    public static func createScrollView(delegate: UIScrollViewDelegate) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.delegate = delegate
        scrollView.showsVerticalScrollIndicator = false
        
        return scrollView
    }
    
    static func createTimePicker() -> UIDatePicker {
        let dp = UIDatePicker(frame: CGRect(x:0, y:0, width:SizeConfig.screenWidth, height: 30.s))
        dp.datePickerMode = UIDatePicker.Mode.time
        dp.translatesAutoresizingMaskIntoConstraints = false
        //dp.frame = CGRectMake(0, 0, 320, 180);
        dp.locale =  Locale(identifier: "ja_JP")
        dp.minuteInterval = 15
        if #available(iOS 13.4, *) {
            dp.preferredDatePickerStyle = .wheels
        }
        return dp
    }
}
