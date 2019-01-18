//
//  NetworkServices.swift
//  Swiftme
//
//  Created by laohanme on 16/01/2019.
//  Copyright © 2019 laohanme. All rights reserved.
//

// 施主见此代码请您留步! 代码并无放任何注释
// 如想要了解此代码您需要 打坐七七四十九天 方得悟道

import Foundation
import Moya

private let contentTypeJSON = ["Content-Type":"application/json"]
private let contentTypeForm = ["Content-Type":"application/x-www-form-urlencoded"]

// MARK: - Helpers
private extension String {
	var urlEscaped: String {
		return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
	}
	
	var utf8Encoded: Data {
		return data(using: .utf8)!
	}
}

enum indexAPI {
	case read
	case uploadPic(fileImg: UIImage)
}

extension indexAPI: TargetType {
	
	var baseURL: URL {
		return URL(string: "<YOUR_API_LINK>")!
	}
	
	var headers: [String : String]? {
		return contentTypeForm
	}
	
	var path: String {
		switch self {
		case .read:
			return "<LINK>"
		case .uploadPic:
			return "<LINK>"
		}
	}
	
	var method: Moya.Method {
		switch self {
		case .read:
			return .get
		case .uploadPic:
			return .post
		}
	}
	
	var sampleData: Data {
		switch self {
		case .read:
			return "Hello World".utf8Encoded
		case .uploadPic:
			return "Upload Picture".utf8Encoded
		}
	}
	
	var task: Task {
		switch self {
		case .read:
			return .requestPlain
		case let .uploadPic(fileImg):
			let imageData = fileImg.jpegData(compressionQuality: 0.1)
			let imgServer = MultipartFormData(provider: .data(imageData!), name: "pic", fileName: "img.png", mimeType: "image/png")
			
			let multipartData = [imgServer]
			return .uploadMultipart(multipartData)
		}
	}
	
}

let endpointClosure = { (target: indexAPI) -> Endpoint in
	let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
	
	// Sign all non-authenticating requests
	switch target {
	case .read:
		return defaultEndpoint.adding(newHTTPHeaderFields: ["Authorization": "<YOUR_TOKEN>"])
	default:
		return defaultEndpoint
	}
}

let service = MoyaProvider<indexAPI>(endpointClosure: endpointClosure)
