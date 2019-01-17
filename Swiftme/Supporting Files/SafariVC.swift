//
//  SafariVC.swift
//  Swiftme
//
//  Created by laohanme on 17/01/2019.
//  Copyright © 2019 laohanme. All rights reserved.
//

import UIKit
import SafariServices

class SafariVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		let safariWeb = SFSafariViewController(url: URL(string: "https://example.com")!)
		self.present(safariWeb, animated: true)
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
