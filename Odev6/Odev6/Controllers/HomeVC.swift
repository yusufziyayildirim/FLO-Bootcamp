//
//  HomeVC.swift
//  Odev6
//
//  Created by Yusuf Ziya YILDIRIM on 15.06.2023.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var userName: UILabel!

    var userNameValue = "user"

    override func viewDidLoad() {
        super.viewDidLoad()
        userName.text = userNameValue
    }
    


}
