//
//  ResultViewController.swift
//  Odev7
//
//  Created by Yusuf Ziya YILDIRIM on 21.06.2023.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultImg: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var totalTryLabel: UILabel!

    var basarili: Bool!
    var resultLabelValue = ""
    var totalTryLabelValue = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        if basarili {
          resultImg.image = UIImage(named: "basarili") 
          resultLabel.textColor = .green
        } else{
          resultImg.image = UIImage(named: "basarisiz")
          resultLabel.textColor = .red
        }

        resultLabel.text = resultLabelValue
        totalTryLabel.text = totalTryLabelValue
    }
}
