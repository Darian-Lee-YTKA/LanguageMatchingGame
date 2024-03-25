//
//  cardView.swift
//  memoryGame
//
//  Created by Darian Lee on 3/22/24.
//

import SwiftUI


struct cardView: View {
    @ObservedObject var card:Card
    
    let width: Int = 120
    @Binding var matchedCards: [Card]
    @Binding var userChoices: [Card]
    var body: some View {
        
        if card.isFaceUP {
            Text(card.text)
            
                .font(.custom("Courier", size: 30))
                .lineLimit(4)
                .minimumScaleFactor(0.3)
                .padding()
                .frame(width: CGFloat(width), height: CGFloat(width))
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(red: 0/255, green: 255/255, blue: 0/255), 
                            Color(red: 0/255, green: 200/255, blue: 0/255)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )                
                    .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 3)
                )
                    )
        }
        else if matchedCards.contains(where: {$0.id == card.id}){
            if let additionalText = card.dictionary[card.text] {
            Text(card.text + additionalText)
                    .font(.custom("Courier", size: 20))
                .lineLimit(4)
                .minimumScaleFactor(0.5)
                .padding()
                .frame(width: CGFloat(width), height: CGFloat(width))
                .background(
                    Color.clear
                )
        } else {
            Text("")
                .font(.custom("Courier", size: 20))
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .padding()
                .frame(width: CGFloat(width), height: CGFloat(width))
                .background(
                    Color.clear
                )
        }
        }
        
        else {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color(red: 0/255, green: 255/255, blue: 0/255),
                                                Color(red: 0/255, green: 200/255, blue: 0/255)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .mask(Text("?").font(.custom("Courier", size: 50)).frame(width: CGFloat(width), height: CGFloat(width)))
                
                
            }
                .padding()
                .frame(width: CGFloat(width), height: CGFloat(width))
                .background(Color.black)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 3)
                )
                .onTapGesture {
                    if userChoices.count == 0{
                        card.turnOver()
                        userChoices.append(card)}
                    else if userChoices.count == 1{
                        card.turnOver()
                        userChoices.append(card)
                        let matched = checkForMatch()
                        if !(matched){
                            print("not matched")
                    
                        for choosenCard in userChoices{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                                choosenCard.turnOver()
                                userChoices.removeAll()
                            }
                        }
                            
                        }
                        
                    }
                    
                }
        }
    }
    func checkForMatch() -> Bool {
        if userChoices[0].pair == userChoices[1].text{
            print("matched")
            userChoices[0].turnOver()
            userChoices[1].turnOver()
            matchedCards.append(userChoices[0])
            matchedCards.append(userChoices[1])
            userChoices.removeAll()
            return true
        }
        print("not matched")
        return false
    }
}


