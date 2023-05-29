//
//  main.swift
//  Odev4
//
//  Created by Yusuf Ziya YILDIRIM on 29.05.2023.
//

import Foundation

struct Cevher {
    let kod: String
    let ad: String
    let fiyat: Float
}

struct Tane {
    let kod: String
    let ad: String
    let etki: Float
}

let cevherler: [String: Cevher]  = [
    "DMR": Cevher(kod: "DMR", ad: "Demir", fiyat: 1500),
    "KRM": Cevher(kod: "KRM", ad: "Krom", fiyat: 5000),
    "BKR": Cevher(kod: "BKR", ad: "Bakır", fiyat: 3000),
    "KMR": Cevher(kod: "KMR", ad: "Kömür", fiyat: 500)
]

let taneler: [String: Tane]  = [
    "1": Tane(kod: "1", ad: "Erik", etki: 15),
    "2": Tane(kod: "2", ad: "Portakal", etki: 10),
    "3": Tane(kod: "3", ad: "Karpuz", etki: 0)
]

func cevherFiyat(kod: String) -> Float {
    return cevherler[kod]?.fiyat ?? 0
}

func taneEtkisi(birimFiyat: Float, tane: String) -> Float {
    return birimFiyat - (birimFiyat * (taneler[tane]?.etki ?? 0)) / 100
}

func temizlikEtkisi(fiyat: Float, temizlikOrani: Float) -> Float {
    return fiyat - ((fiyat * temizlikOrani) / 100)
}

func faturaOlustur(cevherKodu: String, taneBuyuklugu: String, temizlikOrani: Float, miktar: Float) {
    print("*********** FATURA *************\n")
    
    print ("Alıcı: \(ad) \(soyad)", terminator: "\n\n")
    
    //Cevher Türü
    print ("Cevher Türü: \(cevherler[cevherKodu]?.ad ?? "Böyle bir cevher bulunmamaktadır.")")
    
    //Normal Fiyat
    let birimFiyat = cevherFiyat(kod: cevherKodu)
    print ("Normal Birim Fiyat: \(birimFiyat) TON/TL")
    
    //Tane Adı
    let tane = taneler[taneBuyuklugu]
    print ("Tane: \(tane?.ad ?? "Böyle bir tane büyüklüğü bulunmamaktadır.") ( -\(tane?.etki ?? 0)%) ")
    
    //Tane Etkisi Sonra Fiyat
    var taneEtkisiFiyat = taneEtkisi(birimFiyat: birimFiyat, tane: taneBuyuklugu)
    print ("\(tane?.ad ?? "") Fiyat: \(taneEtkisiFiyat) TON/TL")
    
    //Temizlik Etkisi
    let temizlikEtkisi = temizlikEtkisi(fiyat: taneEtkisiFiyat, temizlikOrani: temizlikOrani)
    print ("Temizlik: %\(temizlikOrani), Etkisi: -\(temizlikEtkisi) TL", terminator: "\n\n")
    
    print("Temizlik Etkisi Sonrası", terminator: "\n\n")
    
    //Birim Fiyat
    let hesaplanmisBirimFiyat = taneEtkisiFiyat - temizlikEtkisi
    print ("Birim fiyat: \(hesaplanmisBirimFiyat) TON/TL")
    
    //Toplam
    let toplam = hesaplanmisBirimFiyat * miktar
    print ("Toplam: \(toplam) TL")
    
    //KDV
    let kdv = toplam * 0.08
    print ("KDV (%8): \(kdv) TL")
    
    //Genel Toplam
    let genelToplam = toplam + kdv
    print ("Genel Toplam: \(genelToplam) TL", terminator: "\n\n\n")
    
    print("Mega Madencilik, 2016")
    print("************************", terminator: "\n\n")
}

print("*** Cevher V1.0 ***", terminator: "\n\n")

print("Müşteri'nin ;", terminator: "\n\n")
print("Adı: ", terminator: "")
let ad = readLine() ?? ""

print("Soyadı: ", terminator: "")
let soyad = readLine() ?? ""

print("\n")

print("* Cevherin ;", terminator: "\n\n")

print("Kodu: ", terminator: "")
let cevherKodu = readLine() ?? ""

print("Tane büyüklüğü (1-3): ", terminator: "")
let taneBuyuklugu = readLine() ?? ""

print("Temizlik oranı (%): ", terminator: "")
let temizlikOrani = Float(readLine() ?? "") ?? 0

print("Miktar (ton): ", terminator: "")
let miktar = Float(readLine() ?? "") ?? 0

print("\n**************************\n\n")

faturaOlustur(cevherKodu: cevherKodu, taneBuyuklugu: taneBuyuklugu, temizlikOrani: temizlikOrani, miktar: miktar)
