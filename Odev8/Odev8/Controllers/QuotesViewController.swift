//
//  FamousQuotesViewController.swift
//  Odev8
//
//  Created by Yusuf Ziya YILDIRIM on 22.06.2023.
//

import UIKit

class QuotesViewController: UIViewController {


    @IBOutlet weak var genderImg: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        setQuote(quote: quotes[0])
        index += 1
    }
    

    @IBAction func changeBtnClick(_ sender: Any) {
      getCurrentQuote()
    }

    func getCurrentQuote(){
      let currentQuote = quotes[index]
      setQuote(quote: currentQuote)

      if index + 1 < quotes.count{
        index += 1
      } else{
        index = 0
      }
    }

    func setQuote(quote: Quote){
      genderImg.image = quote.author.gender == Gender.male ? UIImage(named: "erkek") : UIImage(named: "kadin")
      authorNameLabel.text = quote.author.name
      titleLabel.text = quote.title
    }
}
