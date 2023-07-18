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
    
    @State var isPopUpTime = false
    
    @EnvironmentObject var sheetManager: SheetManager
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                colors.backgroundColor.ignoresSafeArea()
                
                VStack {
                    
                    Text("Choose Your Destination")
                    
                    HStack{
                        
                        Image("time")
                            .padding(.leading,10)
                        Button {
                            withAnimation {
                                isPopUpTime = true
                            }
                        } label: {
                            HStack{
                                Text("\(viewModel.dest)")
                                    .foregroundColor(viewModel.dest != "Set Destination" ? .black : .gray)
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
                            Text("\(viewModel.dest)").underline()
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
                            Text("berada di \(viewModel.dest)")
                        }
                        .foregroundColor(colors.gray)
                        .padding(.top)
                        
                    }
                    
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
            .overlay(alignment: .bottom) {
                if isPopUpTime{
                    popUpDest(time: $viewModel.dest)
                }
            }
        }
        
        .onAppear {
            viewModel.serviceAvailabilityCheck()
        }
        .onChange(of: viewModel.dest) { newValue in
            viewModel.startMonitoring()
        }
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
