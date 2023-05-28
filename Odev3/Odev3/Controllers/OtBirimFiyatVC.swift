//
//  OtBirimFiyatVC.swift
//  Odev3
//
//  Created by Yusuf Ziya YILDIRIM on 28.05.2023.
//

import UIKit

class OtBirimFiyatVC: UIViewController {

    
    @IBOutlet weak var kekikTxtField: UITextField!
    @IBOutlet weak var naneTxtField: UITextField!
    @IBOutlet weak var feslegenTxtField: UITextField!
    @IBOutlet weak var reyhanTxtField: UITextField!
    
    var otlar : [String:Otlar] = [
        "Kekik" : Otlar(otTur: "Kekik", otFiyat: 0, tzEtki: 0.10),
        "Nane" : Otlar(otTur: "Nane", otFiyat: 0, tzEtki: 0.20),
        "Fesleğen" : Otlar(otTur: "Fesleğen", otFiyat: 0, tzEtki: 0.10),
        "Reyhan" : Otlar(otTur: "Reyhan", otFiyat: 0, tzEtki: 0.25)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFaturaVC" {
            let faturaVC = segue.destination as! FaturaVC
            faturaVC.otlar = otlar
        }
    }
    
    func birimFiyatKaydet (){
        guard let kekikFiyatText = kekikTxtField.text, let kekikFiyat = Float(kekikFiyatText),
              let naneFiyatText = naneTxtField.text, let naneFiyat = Float(naneFiyatText),
              let feslegenFiyatText = feslegenTxtField.text, let feslegenFiyat = Float(feslegenFiyatText),
              let reyhanFiyatText = reyhanTxtField.text, let reyhanFiyat = Float(reyhanFiyatText) else {
            displayAlert(message: "Tüm alanların doldurulması zorunludur. Lütfen tüm alanlara geçerli fiyat değerleri giriniz.")
            return
        }
        
        //Ot birim fiyatlarını güncelle
        otlar["Kekik"]?.otFiyat = kekikFiyat
        otlar["Nane"]?.otFiyat = naneFiyat
        otlar["Fesleğen"]?.otFiyat = feslegenFiyat
        otlar["Reyhan"]?.otFiyat = reyhanFiyat
    }
    
    @IBAction func kaydetBtnClick(_ sender: Any) {
        birimFiyatKaydet()
        performSegue(withIdentifier: "toFaturaVC", sender: nil)
    }
    
    func displayAlert(message: String) {
        let alertController = UIAlertController(title: "Uyarı", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }

}
