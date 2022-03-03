//
//  CustomTabBarController.swift
//  Hinatabo
//
//  Created by mac 2019 on 2/19/21.
//

import UIKit


/**It's an enum for identify bottom tab items*/
enum TabItemType {
    case home_icon
    case creators_icon
    case searchview_icon
    case menu_icon
    
    /**
     *Return Image for normal tab when not selected
     */
    var image: UIImage? {
        switch self {
        case .home_icon: do {return UIImage.init(named: AppImages.home.rawValue)}
        case .creators_icon: do {return UIImage.init(named: AppImages.creators.rawValue)}
        case .searchview_icon: do {return UIImage.init(named: AppImages.searchView.rawValue)}
        case .menu_icon: do {return UIImage.init(named: AppImages.menu.rawValue)}
        }
    }
    
    /**Return Images for when tab selected*/
    var selectedImage: UIImage? {
        switch self {
        case .home_icon: do {return UIImage.init(named: AppImages.homeSelected.rawValue)}
        case .creators_icon: do {return UIImage.init(named: AppImages.creatorsSelected.rawValue)}
        case .searchview_icon: do {return UIImage.init(named: AppImages.searchViewSelected.rawValue)}
        case .menu_icon: do {return UIImage.init(named: AppImages.menuSelected.rawValue)}
        }
    }
    
    /**Return title of the tab that will show at tab bottom*/
    var title: String {
        switch self {
        case .home_icon: do {return AppTexts.translate_id_0006.rawValue.tr}
        case .creators_icon: do {return AppTexts.translate_id_0007.rawValue.tr}
        case .searchview_icon: do {return AppTexts.translate_id_0008.rawValue.tr}
        case .menu_icon: do {return AppTexts.translate_id_0009.rawValue.tr}
        }
    }
}

final class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    private var isLoaded: Bool = false
    
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

    }
    
    private func setTabbarHeight() {
        tabBar.backgroundColor = AppColors.gray
        
        let kBarHeight = 50.s + SizeConfig.padding.bottom
        tabBar.frame.size.height = kBarHeight
        tabBar.frame.origin.y = view.frame.height - kBarHeight
        
    }
    
    public func setupTabBar() {
        
        UITabBar.appearance().tintColor = AppColors.buttonGradient1
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: AppColors.b9d67], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: AppColors.buttonGradient1], for: .selected)
        
        let homeVC = ViewController()
        let homeNC = CustomNavigationController(rootViewController: homeVC)
        homeNC.navigationBar.isHidden = true
        homeNC.tabBarItem = createTabBarItem(.home_icon)
        
        let creatorsVC = ViewController()
        let creatorsNC = CustomNavigationController(rootViewController: creatorsVC)
        creatorsNC.navigationBar.isHidden = true
        creatorsNC.tabBarItem = createTabBarItem(.creators_icon)
        
        let searchViewVC = ViewController()
        let searchViewNC = CustomNavigationController(rootViewController: searchViewVC)
        searchViewNC.navigationBar.isHidden = true
        searchViewNC.tabBarItem = createTabBarItem(.searchview_icon)
        
        let menuVC = ViewController()
        let menuNC = CustomNavigationController(rootViewController: menuVC)
        menuNC.navigationBar.isHidden = true
        menuNC.tabBarItem = createTabBarItem(.menu_icon)
        
        viewControllers = [homeNC, creatorsNC, searchViewNC, menuNC]
        
        isLoaded = true
    }
    
    func createTabBarItem(_ type: TabItemType) -> UITabBarItem {
        let tabBarItem = UITabBarItem()
        tabBarItem.title = type.title
        tabBarItem.image = type.image
        tabBarItem.selectedImage = type.selectedImage
        return tabBarItem
    }
    
}
