//
//  LoginVC.swift
//  Odev6
//
//  Created by Yusuf Ziya YILDIRIM on 15.06.2023.
//

import UIKit

class LoginVC: UIViewController {

  @IBOutlet weak var emailTxt: UITextField!
  @IBOutlet weak var passwordTxt: UITextField!
  @IBOutlet weak var indicatorLogin: UIActivityIndicatorView!

  let user = User(name:"Yusuf Ziya YILDIRIM", email: "deneme@gmail.com", password: "123456789")
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

  @IBAction func loginBtnClick(_ sender: Any) {
      indicatorLogin.alpha = 1
      self.indicatorLogin.startAnimating()

      guard
        let emailtText = emailTxt.text, !emailtText.isEmpty,
        let passwordText = passwordTxt.text, !passwordText.isEmpty else{
          displayAlert(withTitle: "Hata!", message: "Tüm alanların doldurulması zorunludur...")
          return
      }

      if(emailtText == user.email && passwordText == user.password) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.performSegue(withIdentifier: "toHomeVC", sender: nil)
        }
      } else{
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
          self.displayAlert(withTitle: "Hata!", message: "Lütfen kullanıcı adı ve şifrenizi kontrol ediniz..")
        }
      }

  }

  func displayAlert(withTitle title: String, message: String) {
      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      let okAction = UIAlertAction(title: "Ok", style: .default)
      alert.addAction(okAction)
      self.present(alert, animated: true)
      indicatorLogin.alpha = 0
      indicatorLogin.stopAnimating()
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "toHomeVC" {
          let destinationVC = segue.destination as! HomeVC
          destinationVC.userNameValue = user.name
      }
  }
}
