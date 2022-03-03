//
//  AppManager.swift
//  PlaungAssignment
//
//  Created by mac 2019 on 3/3/22.
//

import Foundation

final class AppManager {
    static let shared = AppManager()
    let userDefaults = UserDefaults.standard
    
    init() {
        
    }
    
    func setLogin(value: Bool?) {
        userDefaults.set(value, forKey: AppConstants.kUserDefaultLoginKey)
      }

      func isLoggedIn() -> Bool? {
          return userDefaults.bool(forKey: AppConstants.kUserDefaultLoginKey);
      }
    
    func setAuthorizationToken(token: String?) {
        userDefaults.set(token, forKey: AppConstants.kUserDefaultSecreteTokenKey)
    }
    
    func getAuthorizationToken() -> String? {
        return userDefaults.string(forKey: AppConstants.kUserDefaultSecreteTokenKey)
    }
    
    func setCurrentUserId(userId: Int?) {
        userDefaults.set(userId, forKey: AppConstants.kUserDefaultCurrentUserIdKey)
    }
    
    func getCurrentUserId() -> Int? {
        return userDefaults.integer(forKey: AppConstants.kUserDefaultCurrentUserIdKey)
    }
    
    func getAppVersion() -> String {
        return Bundle.main.formattedVersion
    }
}
