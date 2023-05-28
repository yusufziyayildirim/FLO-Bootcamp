//
//  ResultVC.swift
//  Odev3
//
//  Created by Yusuf Ziya YILDIRIM on 28.05.2023.
//

import UIKit

class ResultVC: UIViewController {

    @IBOutlet weak var tutarLabel: UILabel!
    @IBOutlet weak var indirimLabel: UILabel!
    @IBOutlet weak var araToplamLabel: UILabel!
    @IBOutlet weak var kdvLabel: UILabel!
    @IBOutlet weak var genelToplamLabel: UILabel!
    
    var tutar: Float?
    var indirim: Float?
    var araToplam: Float?
    var kdv: Float?
    var genelToplam: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tutarLabel.text = String("İşlem Tutarı: \(tutar ?? 0) TL")
        indirimLabel.text = String("Tazelik Etkisi: \(indirim ?? 0) TL")
        araToplamLabel.text = String("Ara Toplam: \(araToplam ?? 0) TL")
        kdvLabel.text = String("KDV(%18): \(kdv ?? 0) TL")
        genelToplamLabel.text = String("Genel Toplam: \(genelToplam ?? 0) TL")
        
    }
}
