//
//  NetworkServices.swift
//  Swiftme
//
//  Created by laohanme on 16/01/2019.
//  Copyright © 2019 laohanme. All rights reserved.
//

// 施主见此代码请您留步! 代码并无放任何注释
// 如想要了解此代码您必须需要 打坐七七四十九天 方得悟道

import Foundation
import Moya

// MARK: - Helpers
private extension String {
	var urlEscaped: String {
		return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
	}
	
	var utf8Encoded: Data {
		return data(using: .utf8)!
	}
}


enum indexAPI: TargetType {
	
	case read
	
	var baseURL: URL {
		return URL(string: "<YOUR_API_LINK>")!
	}
	
	var path: String {
		switch self {
		case .read:
			return "<LINK>"
		}
	}
	
	var method: Moya.Method {
		switch self {
		case .read:
			return .get
		}
	}
	
	var sampleData: Data {
		switch self {
		case .read:
			return "Hello World".utf8Encoded
		}
	}
	
	var task: Task {
		switch self {
		case .read:
			return .requestPlain
		}
	}
	
	var headers: [String : String]? {
		return ["Content-Type":"application/x-www-form-urlencoded"]
	}
}
