//
//  MoyaVC.swift
//  Swiftme
//
//  Created by laohanme on 16/01/2019.
//  Copyright © 2019 laohanme. All rights reserved.
//

// 菩萨已经把代码变得更高大尚

import UIKit
import Moya
import SwiftyJSON

class MoyaVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		service.request(.read) { (result) in
			switch result {
			case .success(let value):
				let data = JSON(value.data)
				do {
					_ = try value.filterSuccessfulStatusCodes()
					print(data)
				}
				catch {
					print("Error: YOUR_ERROR_MESSAGE")
				}
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
    }
	
	func uploadPicture(image:UIImage) {
		service.request(.uploadPic(fileImg: image)) { (result) in
			switch result {
			case .success(let value):
				let dataResponse = JSON(value.data)
				do {
					_ = try value.filterSuccessfulStatusCodes()
					print(dataResponse)
				}
				catch {
					print("Error: YOUR_ERROR_MESSAGE")
				}
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
