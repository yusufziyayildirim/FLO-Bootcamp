
var otFiyatlari = [String: Int]()

let tazelikKaybiOranlari = [
    "kekik": 0.10,
    "nane": 0.20,
    "fesleğen": 0.10,
    "reyhan": 0.25
]

func otBirimFiyat(_ otIsmi: String) -> Int? {
    return otFiyatlari[otIsmi]
}

func tazelikEtkisi(_ otIsmi: String, _ miktar: Int, _ tazeMi: Bool) -> Int? {
    guard let birimFiyat = otBirimFiyat(otIsmi) else {
        return nil
    }
    
    var tazelikKaybi = 0
    
    if !tazeMi, let tazelikKaybiOrani = tazelikKaybiOranlari[otIsmi] {
        tazelikKaybi = Int(Double(birimFiyat * miktar) * tazelikKaybiOrani)
    }
    
    return tazelikKaybi
}

func faturaOlustur(_ otIsmi: String, _ miktar: Int, _ tazeMi: Bool) {
    guard let birimFiyat = otBirimFiyat(otIsmi),
          let tazelikKaybi = tazelikEtkisi(otIsmi, miktar, tazeMi)
    else {
        print("Geçersiz ot ismi!")
        return
    }
    
    let kdvOrani = 0.18
    let islemTutari = miktar * birimFiyat
    let tutar = islemTutari - tazelikKaybi
    let kdv = Int(Double(tutar) * kdvOrani)
    let genelToplam = tutar + kdv
    
    print("**************************")
    
    print("Tür: \(otIsmi)")
    print("-\(otIsmi)- miktar (kg): \(miktar)")
    
    if tazeMi {
        print("Taze mi? (1=taze): 1")
        print("İşlem tutarı: \(islemTutari)")
    } else {
        print("Taze mi? (1=taze): 0")
        print("İşlem tutarı: \(islemTutari)")
        print("Tazelik etkisi: -\(tazelikKaybi) TL")
        
    }
    
    print("Tutar: \(tutar)")
    
    print("KDV (18%): \(kdv) TL")
    
    print("**************************")
    
    print("Fatura:")
    print("--------------------------")
    
    print("OT A.Ş.")
    print("* \(otIsmi): \(miktar)kg x \(birimFiyat)TL = \(tutar)")
    
    if !tazeMi {
        print("Taze değil.")
    }else {
        print("Taze")
    }
    
    print("KDV (18%): \(kdv) TL")
    print("Genel Toplam: \(genelToplam) TL")
}

func main() {
    
    print("Kekik birim fiyatı (TL/kg): " , terminator: "")
    if let kekikFiyati = Int(readLine() ?? "") {
        otFiyatlari["kekik"] = kekikFiyati
    }

    print("Nane birim fiyatı (TL/kg): ", terminator: "")
    if let naneFiyati = Int(readLine() ?? "") {
        otFiyatlari["nane"] = naneFiyati
    }

    print("Fesleğen birim fiyatı (TL/kg): ", terminator: "")
    if let feslegenFiyati = Int(readLine() ?? "") {
        otFiyatlari["fesleğen"] = feslegenFiyati
    }

    print("Reyhan birim fiyatı (TL/kg): ", terminator: "")
    if let reyhanFiyati = Int(readLine() ?? "") {
        otFiyatlari["reyhan"] = reyhanFiyati
    }

    print("Hangi otu almak istersiniz? (kekik, nane, fesleğen, reyhan): ", terminator: "")
    if let otIsmi = readLine() {
        print("Kaç kilogram istersiniz? ", terminator: "")
        if let miktar = Int(readLine() ?? "") {
            print("Taze mi? (1=taze, 0=taze değil): ", terminator: "")
            if let tazeSecimi = Int(readLine() ?? "") {
                faturaOlustur(otIsmi, miktar, tazeSecimi == 1 ? true : false)
            } else {
                print("Geçersiz taze seçimi!")
            }
        } else {
            print("Geçersiz miktar!")
        }
    } else {
        print("Geçersiz ot ismi!")
    }
}


main()
