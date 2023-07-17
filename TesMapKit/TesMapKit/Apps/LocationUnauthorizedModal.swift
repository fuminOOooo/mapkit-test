//
//  LocationUnauthorized.swift
//  TesMapKit
//
//  Created by Elvis Susanto on 24/05/23.
//

import SwiftUI

struct LocationUnauthorizedModal: View {
    
    @StateObject private var viewModel = MapViewModel()
    
    @Binding var isInaccessible : Bool
    
    var body: some View {
        
        VStack () {
            
            Text("App needs locations.")
                .font(Font.custom("SFPro-Bold", size: 24))
                .foregroundColor(colors.white)
            
            Divider()
                .overlay(colors.white)
            
            VStack (alignment: .leading) {
                
                Text("Location accesses have been turned off")
                    .font(Font.custom("SF-Pro-Text-Light", size: 14))
                    .foregroundColor(colors.white)
                
                Text("for this application, disabling some features.")
                    .font(Font.custom("SF-Pro-Text-Light", size: 14))
                    .foregroundColor(colors.white)
                
                Text("Please turn them on and check again.")
                    .font(Font.custom("SF-Pro-Text-Light", size: 14))
                    .foregroundColor(colors.white)
                
            }
            .frame(minWidth: 350)
            .padding()
            
            Button {
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                viewModel.serviceAvailabilityCheck()
                if viewModel.locationAccess {
                    isInaccessible = true
                }
            }
            label: {
                Text("Open Settings")
                    .frame(maxWidth: 270)
            }
            .buttonStyle(FillButton())
            
        }
        .padding(.init(top: 24, leading: 20, bottom: 24, trailing: 20))
        .frame(maxWidth: 306)
        .background(colors.modalBackground)
        .cornerRadius(15)
        .opacity(isInaccessible ? 1 : 0)
        .scaleEffect(isInaccessible ? 1 : 0)
        .animation(.spring(response: 0.4, dampingFraction: 0.8))
        .transition(.move(edge: .bottom))
    }
}
