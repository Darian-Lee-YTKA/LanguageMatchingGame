//
//  memory.swift
//  memoryGame
//
//  Created by Darian Lee on 3/22/24.
//

import Foundation
import SwiftUI

class Card: Identifiable, ObservableObject{
    var id = UUID()
    @Published var isFaceUP = false
    @Published var isMatched = false
    var text: String
    var pair: String
    var dictionary: [String:String]
    
    init(text:String, dictionary:[String:String], pair:String){
        self.text = text
        self.pair = pair
        self.dictionary = dictionary
    }
    func turnOver(){
        self.isFaceUP.toggle()
    }
    
}


let cardPairsHardT: [String: String] = [
    "🔮": "falcı",
        "🔒": "kilit",
        "🪹": "yuvan",
        "🛒": "alışveriş arabası",
        "🏋️‍♂️": "halterci",
        "🐚": "deniz kabuğu",
        "🦜": "papağan",
        "📌": "raptiye",
        "🎈": "balon",
        "🧽": "sünger",
        "🪮": "tarak",
        "🩹": "yara bandı",
        "⚙️": "dişli",
        "🔩": "vida ve somun",
        "⛺️": "çadır",
        "🛶": "sandala",
        "🩼": "koltuk değneği",
        "🦽": "tekerlekli sandalye",
        "♟️": "piyon",
        "🏹": "yay ve ok",
        "🛝": "kaydırak",
        "🪁": "uçurtma",
        "🥢": "yemek çubukları",
        "🫖": "demlik",
        "🍤": "karides",
        "🫘": "fasulye",
        "🥜": "fıstık",
        "🫐": "yaban mersini",
        "🥥": "hindistancevizi",
        "🦔": "kirpi",
        "🦦": "su samuru",
        "🦥": "tembel hayvan",
        "🐑": "koyun",
        "🪱": "solucan",
        "🦅": "kartal",
        "🐜": "karınca",
        "🦗": "çekirge",
        "🦑": "kalamar",
        "🦎": "kertenkele",
        "🕷️": "örümcek",
        "🪡": "iğne",
        "🧵": "iplik",
        "🪢": "düğüm"
    
    
]



let cardPairsHardR: [String: String] = [
    "🔮": "прорицатель",
    "🔒": "замок",
    "🪹": "гнездо",
    "🛒": "тележка",
    "🏋️‍♂️": "штангист",
    "🐚": "ракушка",
    "🦜": "попугай",
    "📌": "булавка",
        "🧽": "губка",
        "🪮": "гребень",
        "🩹": "пластырь",
        "⚙️": "шестеренка",
        "🔩": "болт и гайка",
        "⛺️": "палатка",
        "🛶": "лодка",
        "🩼": "костыли",
        "🦽": "инвалидное кресло",
        "♟️": "пешка",
        "🏹": "лук и стрелы",
        "🛝": "горка",
        "🪁": "воздушный змей",
        "🥢": "палочки для еды",
        "🫖": "чайник",
        "🍤": "креветка",
        "🫘": "бобы",
        "🥜": "арахис",
        "🫐": "черника",
        "🥥": "кокос",
        "🦔": "ёж",
        "🦦": "выдра",
        "🦥": "ленивец",
        "🐑": "овца",
        "🪱": "червяк",
        "🦅": "орёл",
        "🐜": "муравей",
        "🦗": "кузнечик",
        "🦑": "кальмар",
        "🦎": "ящерица",
        "🕷️": "паук",
        "🪡": "игла",
        "🧵": "нить",
        "🪢": "узел",
    
]

let cardPairsEasyT: [String: String] = [
"🌞": "güneş",
"🌸": "çiçek",
"🐱": "kedi",
"🐶": "köpek",
"🍎": "elma",
"📚": "kitap",
"🍕": "pizza",
"⌚️": "saat",
"🏠": "ev",
"❤️🫀": "kalp",
"🚗": "araba",
"🍦": "dondurma",
"📱": "telefon",
"🚲": "bisiklet",
"🍉": "karpuz",
"⚽️": "top",
"🎁": "hediye",
"📷": "kamera",
"🌲": "ağaç",
"👚": "gömlek",
"🌧️": "yağmur",
"🏖️": "plaj",
"💵": "para",
"🛏️": "yatak",
"✏️": "kalem",
"🔴": "kırmızı",
"🟡": "sarı",
"🟢": "yeşil",
"🔵": "mavi",
"⚫️": "siyah",
"⚪️": "beyaz",
"🟠": "turuncu",
"🟣": "mor",
"👩‍❤️‍👨": "aşk",
"⏳🕐": "zaman",
"👩‍👩‍👦": "aile",
"👩": "kadın",
"🧔": "erkek",
"👦": "çocuk",
"👧": "kız",
"👶": "bebek",
"🤚": "el",
"🦵": "bacak",
"👀": "gözler",
"👃": "burun",
"👄": "ağız",
"💪": "kol"]

let cardPairsEasyR: [String: String] =
[
    "🌞": "солнце",
        "🌸": "цветок",
        "🐱": "кошка",
        "🐶": "собака",
        "🍎": "яблоко",
        "📚": "книга",
        "🍕": "пицца",
        "⌚️": "часы",
        "🏠": "дом",
        "❤️🫀": "сердце",
        "🚗": "машина",
        "🍦": "мороженое",
        "📱": "телефон",
        "🚲": "велосипед",
        "🍉": "арбуз",
        "⚽️": "мяч",
        "🎁": "подарок",
    "📷": "камера",
    "🌲": "дерево",
    "👚": "рубашка",
        "🌧️": "дождь",
        "🏖️": "пляж",
        "💵": "деньги",
        "🛏️": "кровать",
        "✏️": "карандаш",
    "🔴": "красный",
        "🟡": "желтый",
        "🟢": "зеленый",
        "🔵": "синий",
        "⚫️": "черный",
        "⚪️": "белый",
        "🟠": "оранжевый",
        "🟣": "пурпурный",
    "👩‍❤️‍👨": "любовь",
    "⏳🕐": "время",
    "👩‍👩‍👦": "семья",
    "👩": "женщина",
        "🧔": "мужчина",
        "👦": "мальчик",
        "👧": "девочка",
        "👶": "ребенок",
        "🤚💪": "рука",
        "🦵": "нога",
        "👀": "глаза",
        "👃": "нос",
        "👄": "рот",
]

func makeCards(pairCount: Int, language: Language, difficulty: Difficulty) -> [Card] {
    var cardList = [Card]()
    var shuffledKeys: [String]
    var currentDictionary: [String:String]
    switch language {
    case .russian:
        print("Russian selected")
        if difficulty == .easy{
            currentDictionary = cardPairsEasyR
            shuffledKeys = Array(currentDictionary.keys.shuffled().prefix((pairCount)))}
        else{
            currentDictionary = cardPairsHardR
            shuffledKeys = Array(currentDictionary.keys.shuffled().prefix((pairCount)))
        }
        
    case .turkish:
        print("Turkish selected")
        if difficulty == .easy{
            currentDictionary = cardPairsEasyT
            shuffledKeys = Array(cardPairsEasyT.keys.shuffled().prefix((pairCount)))}
        else{
            currentDictionary = cardPairsHardT
            shuffledKeys = Array(cardPairsHardT.keys.shuffled().prefix((pairCount)))
        }
    }
        
        for text in shuffledKeys {
            cardList.append(Card(text:text, dictionary: currentDictionary, pair: currentDictionary[text]!))
            cardList.append(Card(text:currentDictionary[text]!, dictionary: currentDictionary, pair: text))
        }
        
    
    return cardList.shuffled()
}



let faceDownCard = Card(text:"?", dictionary: ["":""], pair: "")

enum Language: String, CaseIterable {
    case turkish
    case russian
}
enum Difficulty: String, CaseIterable{
    case hard
    case easy
}

