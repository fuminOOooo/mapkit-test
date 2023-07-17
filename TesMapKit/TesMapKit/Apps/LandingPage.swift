//
//  ContentView.swift
//  TesMapKit
//
//  Created by Elvis Susanto on 16/05/23.
//

import SwiftUI
import MapKit

struct LandingPage: View {
    
    @StateObject private var viewModel = MapViewModel()
    
    @State private var isInaccessible : Bool = false
    @State private var dest: String = "Set Destination"
    @State var isPopUpTime = false
    @EnvironmentObject var sheetManager:SheetManager
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                colors.backgroundColor.ignoresSafeArea()
                
                VStack {
                    HStack{
                        Image("time")
                            .padding(.leading,10)
                        Button {
                            withAnimation {
                                isPopUpTime = true
                            }
                        } label: {
                            HStack{
                                Text("\(dest)")
                                    .foregroundColor(dest != "Set Destination" ? .black : .gray)
                                Spacer()
                            }
                            .frame(width: 200)
                        }
                        Spacer()
                    }
                    .frame(width: 327, height: 50)
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(radius: 3)
                    
                    Spacer()
                    
                    // Requirement & Button
                    if (viewModel.isInside) {
                        
                        VStack (spacing: 4) {
                            Text("Sekarang anda memasuki daerah")
                            Text("Apple Academy!").underline()
                        }
                        .foregroundColor(colors.gray)
                        .font(Font.custom("SF-Pro-Text-Regular", size: 16))
                        .padding(.top)
                        .multilineTextAlignment(.center)
                        
                    }
                    else {
                        
                        HStack (spacing: 4) {
                            Text("Sekarang anda")
                            Text("tidak").underline()
                            Text("berada di lokasi!")
                        }
                        .foregroundColor(colors.gray)
                        .padding(.top)
                        
                    }
                    VStack (spacing: 4) {
                        Text(String(viewModel.refreshingInZero))
                    }
                    .foregroundColor(colors.gray)
                    .font(Font.custom("SF-Pro-Text-Regular", size: 16))
                    .padding(.top)
                    .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                }
                if isPopUpTime {
                    Color.black
                        .opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            withAnimation {
                                isPopUpTime.toggle()
                            }
                        }
                }
                
                if !viewModel.locationAccess {
                    Color.black.opacity(0.75)
                        .edgesIgnoringSafeArea(.all)
                        .onAppear {
                            isInaccessible = true
                        }
                    // Modal View
                    LocationUnauthorizedModal(isInaccessible: $isInaccessible)
                        .zIndex(1)
                }
                
            }
            .overlay(alignment: .bottom){
                if isPopUpTime{
                    popUpDest(time: $dest)
                }
            }
        }
        .onReceive(viewModel.timer) { _ in
            if viewModel.refreshingInZero > 0 {
                viewModel.refreshingInZero -= 1
            } else if viewModel.refreshingInZero == 0 {
                viewModel.locationAuthorizationCheck()
                viewModel.checkIfUserIsInInsideRegion()
                viewModel.refreshingInZero = 1
            }
        }
        .onAppear {
            viewModel.serviceAvailabilityCheck()
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
