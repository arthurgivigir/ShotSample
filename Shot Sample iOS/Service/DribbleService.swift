//
//  DribbleService.swift
//  Shot Sample iOS
//
//  Created by Arthur Givigir on 26/10/17.
//  Copyright © 2017 Arthur Givigir. All rights reserved.
//
import Foundation
import Moya

let providerDribble = MoyaProvider<DribbleService>()
enum DribbleService {
    case listShots
    case getShot(id: String)
}

extension DribbleService: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.dribbble.com/v1")!
    }
    
    var path: String {
        switch self {
        case .listShots:
            return "/shots"
        case .getShot(let id):
            return "/shots/\(id)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        switch self {
        case .listShots:
            return "{\"id\": 3898939,\"title\": \"Free tomato sticker pack\",\"description\":\"teste\"}".data(using: String.Encoding.utf8)!
        case .getShot( _):
            return "{\"title\" : \"Sasquatch\", \"description\" : \"Quick, messy, five minute sketch of something that might become a fictional something.\",\"team_id\" : 39,\"tags\" : [\"fiction\",\"sasquatch\",\"sketch\",\"wip\"]}".data(using: String.Encoding.utf8)!
        }
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json", "Authorization": "Bearer 39176349cd83da402a202af6a14142959e2a228b1ff30f1aa724cb7bb053dc0f"]
    }
    
    
}

