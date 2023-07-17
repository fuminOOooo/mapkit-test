//
//  FirstTimeModal.swift
//  TesMapKit
//
//  Created by Elvis Susanto on 23/05/23.

import SwiftUI

struct FirstTimeModal: View {
    
    @Binding var notAccepted: Bool
    
    var body: some View {
        
        VStack () {
            
            Text("Keep the chat safe.")
                .font(Font.custom("SFPro-Bold", size: 24))
                .foregroundColor(colors.white)
            
            Divider()
                .overlay(colors.white)
            
            VStack (alignment: .leading) {
                
                Text("Your anonymity does not give you the")
                    .font(Font.custom("SF-Pro-Text-Light", size: 14))
                    .foregroundColor(colors.white)
                
                Text("right to target specific individuals.")
                    .font(Font.custom("SF-Pro-Text-Light", size: 14))
                    .foregroundColor(colors.white)
                
                Text("Treat others how you want to be treated.")
                    .font(Font.custom("SF-Pro-Text-Light", size: 14))
                    .foregroundColor(colors.white)
                
            }
            .frame(minWidth: 350)
            .padding()
            
            Button {
                self.notAccepted = false
            } label: {
                Text("Okay, I understand")
                    .frame(maxWidth: 270)
            }
            .buttonStyle(FillButton())
            
        }
        .padding(.init(top: 24, leading: 20, bottom: 24, trailing: 20))
        .frame(maxWidth: 306)
        .background(colors.modalBackground)
        .cornerRadius(15)
        .opacity(notAccepted ? 1 : 0)
        .scaleEffect(notAccepted ? 1 : 0)
        .animation(.spring(response: 0.4, dampingFraction: 0.8))
        .transition(.move(edge: .bottom))
    }
    
}
