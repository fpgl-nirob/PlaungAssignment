//
//  UserServices.swift
//  PlaungAssignment
//
//  Created by mac 2019 on 3/3/22.
//

import Foundation
import Alamofire

struct Starships: Decodable {
    var count: Int?
    var nextt: String?
    
    enum CodingKeys: String, CodingKey {
        case count
        case nextt = "next"
    }
}

final class UserServices {
    static let shared = UserServices()
    
    func getHeaders() -> HTTPHeaders {
        var headers: HTTPHeaders = ["Accept": "application/json"]
        let secreteToken = AppManager.shared.getAuthorizationToken()
        if secreteToken != nil {
            headers[APIConstants.bearerKey] = "Bearer " + secreteToken!
        }
        
        return headers
    }
    
    func getFullUrl(endPoint: String) -> String {
        let url = APIConstants.baseUrl + endPoint
        return url
    }
    
    private func apiRequest<T: Decodable>(type: T.Type, method: HTTPMethod, url: String, params: [String: Any]?, completionHandler: @escaping (_ value: T?, _ error: Error?) -> Void) {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        AF.request(url, method: method, parameters: params, headers: getHeaders())
            .validate(statusCode: 200..<206)
            .responseDecodable(of: type, decoder: decoder) { response in
                completionHandler(response.value, response.error)
            }
    }
    
    func getRequest<T: Decodable>(type: T.Type, endPoint: String, params: [String: Any]?, completionHandler: @escaping (_ value: T?, _ error: Error?) -> Void) {
        let url = getFullUrl(endPoint: endPoint)
        apiRequest(type: type, method: .get, url: url, params: params) { value, error in
            completionHandler(value, error)
        }
    }
    
    func postRequest<T: Decodable>(type: T.Type, endPoint: String, params: [String: Any]?, completionHandler: @escaping (_ value: T?, _ error: Error?) -> Void) {
        let url = getFullUrl(endPoint: endPoint)
        apiRequest(type: type, method: .post, url: url, params: params) { value, error in
            completionHandler(value, error)
        }
    }
    
    func patchRequest<T: Decodable>(type: T.Type, endPoint: String, params: [String: Any]?, completionHandler: @escaping (_ value: T?, _ error: Error?) -> Void) {
        let url = getFullUrl(endPoint: endPoint)
        apiRequest(type: type, method: .patch, url: url, params: params) { value, error in
            completionHandler(value, error)
        }
        
    }
}
