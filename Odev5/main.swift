//
//  File.swift
//  Odev5
//
//  Created by Yusuf Ziya YILDIRIM on 2.06.2023.
//

import Foundation

func printString(_ value: String) {
    print(value)
}

func printInteger(_ value: Int) {
    print(value)
}

func printFloat(_ value: Float) {
    print(value)
}

func readInteger(prompt: String) -> Int {
    while true {
        print(prompt, terminator: "")
        if let input = readLine(), let value = Int(input) {
            return value
        }
        
        printString("Lütfen geçerli bir değer giriniz")
    }
}

func readFloat(prompt: String) -> Float {
    while true {
        print(prompt, terminator: "")
        if let input = readLine(), let value = Float(input) {
            return value
        }
        
        printString("Lütfen geçerli bir değer giriniz")
    }
}

func readString(prompt: String) -> String {
    while true {
        print(prompt, terminator: "")
        if let input = readLine(), input != "" {
            return input
        }
        
        printString("Lütfen geçerli bir değer giriniz")
    }
}

func messageBox(_ message: String) {
    let stars = String(repeating: "*", count: 34)
    print("\n")
    print(stars)
    print(message)
    print(stars)
}

func greetings() {
    print("\nHoşgeldiniz...")
    print("Yatırım Ustası v1.0 by FLO Bootcamp")
}

func byebye() {
    print("\nİyi günler....")
    print("Yatırım Ustası v1.0 by FLO Bootcamp")
}

func randomNumber(upTo max: Int) -> Int {
    let random = Int.random(in: 1...max)
    return random
}

//Kurun artma yüzdesine göre karar verme
func gelirMi(yuzde: Int) -> Bool {
    let random = randomNumber(upTo: 100)
    return random < yuzde
}

//Kurun artma ihtimali değerlendirilerek ve değişim yüzdesine göre yeni kuru hesaplama
func yeniKurHesapla(güncelKur: Float, artmaIhtimali: Int, degisimYuzdesi: Float) -> Float {
    var kur = güncelKur
    if gelirMi(yuzde: artmaIhtimali) {
        kur += kur * degisimYuzdesi / 100
    } else {
        kur -= kur * degisimYuzdesi / 100
    }
    return kur
}

func yatirimSimulatoru(_ yatirimMiktari: Float, _ dolarYatirimiTL: Float, _ euroYatirimiTL: Float, _ altinYatirimiTL: Float, _ gumusYatirimiTL: Float, _ faizYatirimiTL: Float, _ bitcoinYatirimiTL: Float ) {
    
    //Başlangıçtaki kurları belirleme
    var dolarKur: Float = 8.3
    var euroKur: Float = 10.1
    var altinKur: Float = 510.0
    var gumusKur: Float = 7.5
    var bitcoinKur: Float = 1000.0
   
    //Kurlar değişmeden önce eski kurları kullanıcıya göster
    messageBox("    YATIRIMLARIN YAPILDIĞI KUR")
    
    messageBox(
        """
            Dolar Kur: \(dolarKur) TL
            Euro Kur: \(euroKur) TL
            Altın Kur: \(altinKur) TL
            Gümüş Kur: \(gumusKur) TL
            Bitcoin Kur: \(bitcoinKur) TL
        """
    )
    
    // Kur fiyatına göre TL'den seçilen kura dönüştürme
    let dolarMiktarı = dolarYatirimiTL / dolarKur
    let euroMiktarı = euroYatirimiTL / euroKur
    let altinMiktarı = altinYatirimiTL / altinKur
    let gumusMiktarı = gumusYatirimiTL / gumusKur
    let bitcoinMiktarı = bitcoinYatirimiTL / bitcoinKur
    
    //Kurların artma yüzdesine göre yeni kurların belirlenmesi
    dolarKur = yeniKurHesapla(güncelKur: dolarKur, artmaIhtimali: 50, degisimYuzdesi: 20)
    euroKur = yeniKurHesapla(güncelKur: euroKur, artmaIhtimali: 60, degisimYuzdesi: 10)
    altinKur = yeniKurHesapla(güncelKur: altinKur, artmaIhtimali: 40, degisimYuzdesi: 15)
    gumusKur = yeniKurHesapla(güncelKur: gumusKur, artmaIhtimali: 30, degisimYuzdesi: 20)
    bitcoinKur = yeniKurHesapla(güncelKur: bitcoinKur, artmaIhtimali: 20, degisimYuzdesi: 25)
    
    // Yeni kur fiyatlarına göre fiyatları TL'ye dönüştürme
    let dolarKazanc = dolarMiktarı * dolarKur
    let euroKazanc = euroMiktarı * euroKur
    let altinKazanc = altinMiktarı * altinKur
    let gumusKazanc = gumusMiktarı * gumusKur
    let faizKazanc = faizYatirimiTL + faizYatirimiTL * 15 / 100
    let bitcoinKazanc = bitcoinMiktarı * bitcoinKur
    
    // Kar miktarlarını hesaplama
    let dolarKar = dolarKazanc - dolarYatirimiTL
    let euroKar = euroKazanc - euroYatirimiTL
    let altinKar = altinKazanc - altinYatirimiTL
    let gumusKar = gumusKazanc - gumusYatirimiTL
    let faizKar = faizKazanc - faizYatirimiTL
    let bitcoinKar = bitcoinKazanc - bitcoinYatirimiTL
    
    let toplamKar = dolarKar + euroKar + altinKar + gumusKar + faizKar + bitcoinKar
    
    // Sonuçları ekrana yazdır
    messageBox("    SONUÇLAR")
    
    messageBox(
        """
            Dolar Kur       : \(dolarKur) TL
            Dolara Yatırım  : \(dolarYatirimiTL) TL
            Dolar Miktarı   : \(dolarMiktarı) Dolar
            Dolar Kar       : \(dolarKar) TL
            Dolar Kar Yüzde : \( (dolarKar / dolarYatirimiTL) * 100) %
        """
    )
    
    messageBox(
        """
            Euro Kur       : \(euroKur) TL
            Euro Yatırım   : \(euroYatirimiTL) TL
            Euro Miktarı   : \(euroMiktarı) Euro
            Euro Kar       : \(euroKar) TL
            Euro Kar Yüzde : \( (euroKar / euroYatirimiTL) * 100) %
        """
    )
    
    messageBox(
        """
            Altın Kur       : \(altinKur) TL
            Altın Yatırım   : \(altinYatirimiTL) TL
            Altın Miktarı   : \(altinMiktarı) Altın
            Altın Kar       : \(altinKar) TL
            Altın Kar Yüzde : \((altinKar / altinYatirimiTL) * 100) %
        """
    )
    
    messageBox(
        """
            Gümüş Kur       : \(gumusKur) TL
            Gümüş Yatırım   : \(gumusYatirimiTL) TL
            Gümüş Miktarı   : \(gumusMiktarı) Gümüş
            Gümüş Kar       : \(gumusKar) TL
            Gümüş Kar Yüzde : \((gumusKar / gumusYatirimiTL) * 100) %
        """
    )
    
    messageBox(
        """
            Faiz Yatırım   : \(faizYatirimiTL) TL
            Faiz Kar       : \(faizKar) TL
            Faiz Kar Yüzde : \((faizKar / faizYatirimiTL) * 100) %
        """
    )
    
    messageBox(
        """
            Bitcoin Kur       : \(bitcoinKur) TL
            Bitcoin Yatırım   : \(bitcoinYatirimiTL) TL
            Bitcoin Miktarı   : \(bitcoinMiktarı) Bitcoin
            Bitcoin Kar       : \(bitcoinKar) TL
            Bitcoin Kar Yüzde : \((bitcoinKar / bitcoinYatirimiTL) * 100) %
        """
    )
    
    messageBox(
        """
            Toplam Yatırım   : \(yatirimMiktari) TL
            Toplam Kar       : \(toplamKar) TL
            Toplam Kar Yüzde : \((toplamKar / yatirimMiktari) * 100) %
        """
    )
    
    byebye()
}

func yatirimRobotu(adSoyad: String, riskIstahi: Int, aylıkGelir: Float, yatirimMiktari: Float, yas: Int) {
    var dolarYatirimiTL: Float = 0
    var euroYatirimiTL: Float = 0
    var altinYatirimiTL: Float = 0
    var gumusYatirimiTL: Float = 0
    var faizYatirimiTL: Float = 0
    var bitcoinYatirimiTL: Float = 0
    
    var riskIstahi = riskIstahi
    
    //Risk iştahını gelir oranı ve yaşa göre güncelleme
    if yatirimMiktari > 0 {
        let gelirOrani = aylıkGelir / yatirimMiktari
        
        if gelirOrani < 0.1 {
            if riskIstahi == 5 || riskIstahi == 4 {
                riskIstahi = 2
            } else if riskIstahi == 3 {
                riskIstahi = 1
            }
        } else if gelirOrani >= 0.1 && gelirOrani < 0.5 {
            if yas > 30 {
                riskIstahi -= 1
            }
        } else if gelirOrani >= 0.5 && gelirOrani < 1 {
            if yas > 50 {
                riskIstahi -= 1
            }
        } else if gelirOrani >= 1 && gelirOrani <= 5 {
            if yas > 60 {
                riskIstahi -= 1
            }
        }
        
        //Risk iştahına göre yatırımları yapma
        switch riskIstahi {
        case 1:
            bitcoinYatirimiTL = yatirimMiktari
        case 2:
            dolarYatirimiTL = yatirimMiktari * 30 / 100
            euroYatirimiTL = yatirimMiktari * 30 / 100
            altinYatirimiTL = yatirimMiktari * 20 / 100
            faizYatirimiTL = yatirimMiktari * 20 / 100
        case 3:
            dolarYatirimiTL = yatirimMiktari * 50 / 100
            altinYatirimiTL = yatirimMiktari * 10 / 100
            gumusYatirimiTL = yatirimMiktari * 30 / 100
            bitcoinYatirimiTL = yatirimMiktari * 10 / 100
        case 4:
            dolarYatirimiTL = yatirimMiktari * 30 / 100
            gumusYatirimiTL = yatirimMiktari * 10 / 100
            bitcoinYatirimiTL = yatirimMiktari * 60 / 100
        case 5:
            dolarYatirimiTL = yatirimMiktari * 10 / 100
            gumusYatirimiTL = yatirimMiktari * 20 / 100
            bitcoinYatirimiTL = yatirimMiktari * 70 / 100
        default:
            printString("Bir hata oluştu...!")
            break
        }
        
        /* Eğer kullanıcı bu şartları sağlıyorsa ve bitcoinde yatırımı varsa
         Bitcoin yatırımı diğer gruplara eşit dağıtılır */
        if gelirOrani >= 0.5 && gelirOrani < 1 {
            if yas >= 40 && yas <= 50 {
                if bitcoinYatirimiTL > 0 {
                    let oran = bitcoinYatirimiTL / 5
                    bitcoinYatirimiTL = 0
                    dolarYatirimiTL += oran
                    euroYatirimiTL += oran
                    altinYatirimiTL += oran
                    gumusYatirimiTL += oran
                    faizYatirimiTL += oran
                }
            }
        }
        
        //Yatırım Sonuçlarını Hesaplama
        yatirimSimulatoru(yatirimMiktari, dolarYatirimiTL, euroYatirimiTL, altinYatirimiTL, gumusYatirimiTL, faizYatirimiTL, bitcoinYatirimiTL)
    }
}

func main() {
    greetings()
    
    let adSoyad = readString(prompt: "Adınız ve soyadınız: ")
    var riskIstahi = 0
    
    //1-5 arasında bir sayı girilene kadar kullanıcıdan risk iştahını öğrenme
    while true{
        riskIstahi = readInteger(prompt: "Risk İştahınızı 1-5 arasında bir sayıyla belirtin: ")
        if riskIstahi >= 0 && riskIstahi <= 5 {
            break
        }
    }
    
    let aylıkGelir = readFloat(prompt: "Aylık geliriniz: ")
    let yatirimMiktari = readFloat(prompt: "Yatırım miktarınız: ")
    let yas = readInteger(prompt: "Yaşınız: ")
    
    //Yatırımları verilere göre yapma
    yatirimRobotu(adSoyad: adSoyad, riskIstahi: riskIstahi, aylıkGelir: aylıkGelir, yatirimMiktari: yatirimMiktari, yas: yas)
}

main()
