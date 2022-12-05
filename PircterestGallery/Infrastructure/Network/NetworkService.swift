//
//  NetworkService.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/12/02.
//

import Foundation
import Moya

enum NetworkService {
    case fetchRecommendImageList
    case searchImageList(query: ImageQuery, page: Int)
}

extension NetworkService: TargetType {
    var baseURL: URL {
        guard let base = Bundle.main.object(forInfoDictionaryKey: "APIBASEURL") as? String else { fatalError() }
        guard let url = URL(string: base) else {fatalError()}
        return url
    }
    
    var path: String {
        switch self {
        case .fetchRecommendImageList:
            return "/photos"
        case .searchImageList(_):
            return "/search/photos"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
        case .searchImageList(let query, let page):
            return .requestParameters(parameters: ["query":query, "page":page], encoding: JSONEncoding.default)
        case .fetchRecommendImageList:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        let nativeAppKey = Bundle.main.infoDictionary?["PICTEREST_NATIVE_APP_KEY"] as? String
        return ["Authorization":"Client-ID \(nativeAppKey!)"]
    }
    
    
}
