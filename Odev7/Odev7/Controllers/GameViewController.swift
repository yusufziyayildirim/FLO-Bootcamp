//
//  GameViewController.swift
//  Odev7
//
//  Created by Yusuf Ziya YILDIRIM on 20.06.2023.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var wrongAnswerImg: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var textFieldLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var countLabel: UILabel!
  
    var randomNumber: Int!
    var hak = 5

    override func viewDidLoad() {
        super.viewDidLoad()

        randomNumber = Int.random(in: 1..<100)
        print(randomNumber ?? "")
    }

    @IBAction func btnTapped(_ sender: Any) {
        controlData()
    }

    func controlData(){
        guard let userNumberText = textField.text, let userNumber = Int(userNumberText) else {
            infoLabel.text = "HATALI GİRİŞ!"
            return
        }

        //1 deneme yapıldı
        hak -= 1

        if userNumber == randomNumber {
          performSegue(withIdentifier: "toResultVC", sender: true)
        } else {
            if (hak == 0){
                performSegue(withIdentifier: "toResultVC", sender: nil)
            }
            infoLabel.text = userNumber < randomNumber ? "ARTIR" : "AZALT"
            textField.text = ""
            wrongAnswerImg.image = UIImage(named: "yanlis")
            textFieldLabel.text = "Tahmin İçin Yeni Bir Sayı Yaz"
            countLabel.text = "HAK: \(hak)"
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultVC" {
            let resultVC = segue.destination as! ResultViewController

            if sender != nil {
                resultVC.basarili = true
                resultVC.resultLabelValue = "KAZANDIN!"
                let totalTry = 5 - hak
                resultVC.totalTryLabelValue = "Toplam \(totalTry) Deneme yaptın."
            } else{
                resultVC.basarili = false
                resultVC.resultLabelValue = "KAYBETTİN!"
                if let randomNumber = randomNumber {
                    resultVC.totalTryLabelValue = "Tüm Haklarını Tamamladın. Doğru Tahmin \(randomNumber) olmalıydı."
                }
            }

        }
    }

}
