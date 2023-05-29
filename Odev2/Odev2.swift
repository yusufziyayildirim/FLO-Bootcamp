var ayakkabiStok = 0
var cantaStok = 0
var gozlukStok = 0

var sonIslemTuru = ""
var sonIslemUrunKodu = ""
var sonIslemMiktar = 0

func malTuruMenu() -> Int {
    print("1- Ayakkabı")
    print("2- Çanta")
    print("3- Gözlük")
    print("4- Vazgeç")
    
    print("Seçim:")
    if let secim = readLine(), let secimInt = Int(secim) {
        return secimInt
    }
    
    return 0
}

func malEkle() {
    let secim = malTuruMenu()
    
    switch secim {
    case 1:
        print("Ayakkabı Ekleme")
        print("-------------------------------")
        var toplamMiktar = 0
        
        while true {
            print("Miktarı Giriniz (çıkış için 0): ", terminator: "")
            
            if let giris = readLine(), let miktar = Int(giris) {
                if miktar == 0 {
                    break
                }
                
                toplamMiktar += miktar
            }
        }
        
        ayakkabiStok += toplamMiktar
        sonIslemTuru = "Ekleme"
        sonIslemUrunKodu = "U01"
        sonIslemMiktar = toplamMiktar
        
        print("------------------------------")
        print("Ayakkabı stoğuna toplam \(toplamMiktar) adet ayakkabı eklendi.")
        
    case 2:
        print("Çanta Ekleme")
        print("-------------------------------")
        var toplamMiktar = 0
        
        while true {
            print("Miktarı Giriniz (çıkış için 0): ", terminator: "")
            
            if let giris = readLine(), let miktar = Int(giris) {
                if miktar == 0 {
                    break
                }
                
                toplamMiktar += miktar
            }
        }
        
        cantaStok += toplamMiktar
        sonIslemTuru = "Ekleme"
        sonIslemUrunKodu = "U02"
        sonIslemMiktar = toplamMiktar
        
        print("------------------------------")
        print("Çanta stoğuna toplam \(toplamMiktar) adet çanta eklendi.")
        
    case 3:
        print("Gözlük Ekleme")
        print("-------------------------------")
        var toplamMiktar = 0
        
        while true {
            print("Miktarı Giriniz (çıkış için 0): ", terminator: "")
            
            if let giris = readLine(), let miktar = Int(giris) {
                if miktar == 0 {
                    break
                }
                
                toplamMiktar += miktar
            }
        }
        
        gozlukStok += toplamMiktar
        sonIslemTuru = "Ekleme"
        sonIslemUrunKodu = "U03"
        sonIslemMiktar = toplamMiktar
        
        print("------------------------------")
        print("Gözlük stoğuna toplam \(toplamMiktar) adet gözlük eklendi.")
        
    case 4:
        print("Vazgeç")
        
    default:
        print("Geçersiz seçim!")
    }
}

func malCikart() {
    let secim = malTuruMenu()
    
    switch secim {
    case 1:
        print("Ayakkabı Çıkartma")
        print("-------------------------------")
        
        if ayakkabiStok == 0 {
            print("Ayakkabı stokta bulunmamaktadır.")
            break
        }
        
        print("Stok Miktarı= \(ayakkabiStok) adet")
        var cikartilanMiktar = 0
        
        while true {
            print("Miktarı Giriniz (çıkış için 0): ", terminator: "")
            
            if let giris = readLine(), let miktar = Int(giris) {
                if miktar == 0 {
                    break
                }
                
                if miktar > ayakkabiStok {
                    print("Stokta bu kadar yok, \(ayakkabiStok) adet kaldı...")
                    continue
                }
                
                cikartilanMiktar += miktar
            }
        }
        
        ayakkabiStok -= cikartilanMiktar
        sonIslemTuru = "Çıkartma"
        sonIslemUrunKodu = "U01"
        sonIslemMiktar = cikartilanMiktar
        
        print("------------------------------")
        print("Ayakkabı stoğundan toplam \(cikartilanMiktar) adet ayakkabı çıkarıldı.")
        
    case 2:
        print("Çanta Çıkartma")
        print("-------------------------------")
        
        if cantaStok == 0 {
            print("Çanta stokta bulunmamaktadır.")
            break
        }
        
        print("Stok Miktarı= \(cantaStok) adet")
        var cikartilanMiktar = 0
        
        while true {
            print("Miktarı Giriniz (çıkış için 0): ", terminator: "")
            
            if let giris = readLine(), let miktar = Int(giris) {
                if miktar == 0 {
                    break
                }
                
                if miktar > cantaStok {
                    print("Stokta bu kadar yok, \(cantaStok) adet kaldı...")
                    continue
                }
                
                cikartilanMiktar += miktar
            }
        }
        
        cantaStok -= cikartilanMiktar
        sonIslemTuru = "Çıkartma"
        sonIslemUrunKodu = "U02"
        sonIslemMiktar = cikartilanMiktar
        
        print("------------------------------")
        print("Çanta stoğundan toplam \(cikartilanMiktar) adet çanta çıkarıldı.")
        
    case 3:
        print("Gözlük Çıkartma")
        print("-------------------------------")
        
        if gozlukStok == 0 {
            print("Gözlük stokta bulunmamaktadır.")
            break
        }
        
        print("Stok Miktarı= \(gozlukStok) adet")
        var cikartilanMiktar = 0
        
        while true {
            print("Miktarı Giriniz (çıkış için 0): ", terminator: "")
            
            if let giris = readLine(), let miktar = Int(giris) {
                if miktar == 0 {
                    break
                }
                
                if miktar > gozlukStok {
                    print("Stokta bu kadar yok, \(gozlukStok) adet kaldı...")
                    continue
                }
                
                cikartilanMiktar += miktar
            }
        }
        
        gozlukStok -= cikartilanMiktar
        sonIslemTuru = "Çıkartma"
        sonIslemUrunKodu = "U03"
        sonIslemMiktar = cikartilanMiktar
        
        print("------------------------------")
        print("Gözlük stoğundan toplam \(cikartilanMiktar) adet gözlük çıkarıldı.")
        
    case 4:
        print("Vazgeç")
        
    default:
        print("Geçersiz seçim!")
    }
}

func stokAra() {
    print("Aranacak ürün adını giriniz : ", terminator: "")
    
    if let arananUrunStr = readLine() {
        let urunKodu = ara(arananUrunStr)
        
        if urunKodu == "U01" {
            print("Ayakkabı stok durumu: \(ayakkabiStok) adet")
        } else if urunKodu == "U02" {
            print("Çanta stok durumu: \(cantaStok) adet")
        } else if urunKodu == "U03" {
            print("Gözlük stok durumu: \(gozlukStok) adet")
        }
    }
   
}

func stokListele() {
    print("Ayakkabı stok durumu: \(ayakkabiStok) adet")
    print("Çanta stok durumu: \(cantaStok) adet")
    print("Gözlük stok durumu: \(gozlukStok) adet")
}

func sonIslem() {
    print("Son işlem türü: \(sonIslemTuru)")
    print("İlgili ürünün kodu: \(sonIslemUrunKodu)")
    print("İlgili üründen yapılan işlem miktarı: \(sonIslemMiktar)")
}

func ara(_ urunAdi: String) -> String {
    if urunAdi == "Ayakkabı" || urunAdi == "ayakkabı"  {
        return "U01"
    } else if urunAdi == "Çanta" || urunAdi == "çanta" {
        return "U02"
    } else if urunAdi == "Gözlük" || urunAdi == "gözlük" {
        return "U03"
    } else {
        print("Böyle bir ürünümüz bulunmamaktadır...")
        return ""
    }
}

func menu() {
    while true {
        print("\n---- DepoFLO ----")
        print("1- Mal Ekle")
        print("2- Mal Çıkart")
        print("3- Stok Ara")
        print("4- Stok Listele")
        print("5- Son İşlem")
        print("6- Çıkış")
        
        print("\nSeçim:")
        if let secim = readLine(), let secimInt = Int(secim) {
            switch secimInt {
            case 1:
                malEkle()
                
            case 2:
                malCikart()
                
            case 3:
                stokAra()
                
            case 4:
                stokListele()
                
            case 5:
                sonIslem()
                
            case 6:
                print("Programdan çıkılıyor...")
                return
                
            default:
                print("Geçersiz seçim!")
            }
        } else {
            print("Geçersiz seçim!")
        }
    }
}

menu()

