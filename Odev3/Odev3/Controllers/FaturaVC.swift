import UIKit

class FaturaVC: UIViewController {
    
    @IBOutlet weak var otTextField: UITextField!
    @IBOutlet weak var miktarTextField: UITextField!
    @IBOutlet weak var tazeMiSwitch: UISwitch!
    
    var otlar: [String: Otlar]?
    let pickerView = UIPickerView()
    let arrowButton = UIButton(type: .custom)
    
    var tutar: Float = 0
    var indirim: Float = 0
    var araToplam: Float = 0
    var kdvToplam: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.selectRow(0, inComponent: 0, animated: false)
        otTextField.inputView = pickerView
        doneButtonTapped()
        
        let toolbar = createToolbar()
        otTextField.inputAccessoryView = toolbar
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
    
        setupArrowButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultVC" {
            let resultVC = segue.destination as! ResultVC
            resultVC.tutar = tutar
            resultVC.indirim = indirim
            resultVC.araToplam = araToplam
            resultVC.kdv = round(kdvToplam)
            resultVC.genelToplam = round(kdvToplam + araToplam)
        }
    }
    
    func otBirimFiyat(_ ot: String) -> Float {
        return otlar![ot]?.otFiyat ?? 0
       
    }
    
    func tazelikEtkisi(_ ot: String, _ tutar: Float) -> Float {
        let oran = otlar![ot]?.tzEtki ?? 0
        return tutar * oran
    }
    
    @IBAction func faturaOlusturBtnClick(_ sender: Any) {
        let selectedRow = pickerView.selectedRow(inComponent: 0)
        let selectedOt = Array(otlar!.values)[selectedRow]
    
        guard selectedRow >= 0 ,
              let miktarText = miktarTextField.text, let miktar = Float(miktarText) else {
            displayAlert(message: "Miktar alanını kontrol ediniz.")
            return
        }
        
        tutar = miktar * otBirimFiyat(selectedOt.otTur)
        print(tutar)
        
        if !tazeMiSwitch.isOn {
            indirim = tazelikEtkisi(selectedOt.otTur, tutar)
        }
        
        araToplam = tutar - indirim
        kdvToplam = araToplam * 0.18
        
        
        performSegue(withIdentifier: "toResultVC", sender: nil)
    }
    
    func displayAlert(message: String) {
        let alertController = UIAlertController(title: "Uyarı", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

//UIPicker configuration
extension FaturaVC: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return otlar?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let ot = Array(otlar!.values)[row]
        return ot.otTur
    }
}

// Toolbar
extension FaturaVC {
    func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.tintColor = .black
        
        let cancelButton = UIBarButtonItem(title: "İptal", style: .plain, target: self, action: #selector(cancelButtonTapped))
        cancelButton.tintColor = .red
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let doneButton = UIBarButtonItem(title: "Seç", style: .done, target: self, action: #selector(doneButtonTapped))
        doneButton.tintColor = .blue
        
        toolbar.setItems([cancelButton, flexibleSpace, doneButton], animated: false)
        toolbar.sizeToFit()
        
        return toolbar
    }
    
    func setupArrowButton() {
        arrowButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        arrowButton.tintColor = .lightGray
        arrowButton.addTarget(self, action: #selector(arrowButtonTapped), for: .touchUpInside)
        
        otTextField.rightView = arrowButton
        otTextField.rightViewMode = .always
    }
    
    @objc func cancelButtonTapped() {
        otTextField.resignFirstResponder()
    }
    
    @objc func doneButtonTapped() {
        let selectedRow = pickerView.selectedRow(inComponent: 0)
        let ot = Array(otlar!.values)[selectedRow]
        otTextField.text = ot.otTur
        otTextField.resignFirstResponder()
    }
    
    @objc func arrowButtonTapped() {
        otTextField.becomeFirstResponder()
    }

}

