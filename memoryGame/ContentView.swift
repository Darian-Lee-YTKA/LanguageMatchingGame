//
//  ContentView.swift
//  memoryGame
//
//  Created by Darian Lee on 3/22/24.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfPairs: Int = 6
    @State private var difficulty: Difficulty = .hard
    @State private var language: Language = .russian
    private var threeColumnGrid = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]

    @State var matchedCards = [Card]()
    @State var userChoices = [Card]()

    var cards: [Card] {
        makeCards(pairCount: numberOfPairs, language: language, difficulty: difficulty).shuffled()
    }
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    Text("◼️ LANGUAGE MATCH ◼️")
                        .font(.custom("Courier", size: 28))
                        
                    Spacer()
                    HStack {
                        Picker(selection: $language, label: Text("Language")) {
                            ForEach(Language.allCases, id: \.self) { language in
                                    Text(language.rawValue)
                                        .tag(language)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .foregroundColor(.green)
                        
                        Spacer()
                        
                        Picker(selection: $numberOfPairs, label: Text("Number of Pairs")) {
                            ForEach([6, 9, 12, 15], id: \.self) { number in
                                Text("\(number) pairs")
                                    .tag(number)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .foregroundColor(.green)
                        
                        Spacer()
                        
                        Picker(selection: $difficulty, label: Text("Difficulty")) {
                            ForEach(Difficulty.allCases, id: \.self) { difficulty in
                                    Text(difficulty.rawValue)
                                        .tag(difficulty)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .foregroundColor(.green)
                        
                        Spacer()
                        Button(action: {
                            matchedCards.removeAll()
                            
                            
                            
                        }) {
                            Text("Restart")
                                .foregroundColor(.black)
                                .padding(3.5)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 1))
                        }
                    }
                    .accentColor(.black)
                    LazyVGrid(columns: threeColumnGrid, spacing: 10) {
                        ForEach(cards) { card in
                            cardView(card: card, matchedCards: $matchedCards, userChoices: $userChoices)
                        }
                    }
                }
            }

            
                                   
                    }
                    .background(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 0.3))
                }

             
            }
