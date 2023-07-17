//
//  FirstTimeModal.swift
//  TesMapKit
//
//  Created by Elvis Susanto on 23/05/23.

import SwiftUI

struct OutsideLocationModal: View {
    
    @StateObject private var viewModel = MapViewModel()
    
    @Binding var isOutside: Bool
    
    var body: some View {
        
        VStack () {
            
            Text("You are out of range!")
                .font(Font.custom("SFPro-Bold", size: 24))
                .foregroundColor(colors.white)
            
            Divider()
                .overlay(colors.white)
            
            VStack (alignment: .leading) {
                
                Text("Please go back into the range of the")
                    .font(Font.custom("SF-Pro-Text-Light", size: 14))
                    .foregroundColor(colors.white)
                
                Text("academy to continue accessing today’s")
                    .font(Font.custom("SF-Pro-Text-Light", size: 14))
                    .foregroundColor(colors.white)
                
                Text("chat log and enable sending messages.")
                    .font(Font.custom("SF-Pro-Text-Light", size: 14))
                    .foregroundColor(colors.white)
                
            }
            .frame(minWidth: 350)
            .padding()
            
//            Text("Press the button below to check again.")
//                .font(Font.custom("SF-Pro-Text-Light", size: 14))
//                .foregroundColor(colors.white)
//                .frame(minWidth: 350)
//                .padding(.bottom)
//            
//            Button {
//                viewModel.checkIfUserIsInInsideRegion()
//                if (viewModel.isInside) {
//                    isOutside = false
//                }
//            }
//            label: {
//                Text("Check my location again")
//                    .frame(maxWidth: 270)
//            }
//            .buttonStyle(FillButton())
            
        }
        .padding(.init(top: 24, leading: 20, bottom: 24, trailing: 20))
        .frame(maxWidth: 306)
        .background(colors.modalBackground)
        .cornerRadius(15)
        .opacity(isOutside ? 1 : 0)
        .scaleEffect(isOutside ? 1 : 0)
        .animation(.spring(response: 0.4, dampingFraction: 0.8))
        .transition(.move(edge: .bottom))
    }
    
}
