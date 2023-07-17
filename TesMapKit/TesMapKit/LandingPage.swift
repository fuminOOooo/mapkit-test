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
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                colors.backgroundColor.ignoresSafeArea()
                
                VStack {
                    
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

//struct LandingPage: View {
//
//    @StateObject private var viewModel = MapViewModel()
//
//    @State private var isInaccessible : Bool = false
//
//    var body: some View {
//
//        NavigationView {
//
//            ZStack {
//
//                colors.backgroundColor.ignoresSafeArea()
//
//                VStack {
//
//                    Spacer()
//
//                    // App Title, Icon, and Timer
//                    VStack (spacing: 15) {
//
//                        HStack {
//
//                            // App Title
//                            Text("Aca-Talk")
//                                .font(Font.custom("SFPro-ExpandedBold", size: 48))
//                                .foregroundColor(colors.white)
//                            // Timer
//                                .onReceive(viewModel.timer) { _ in
//                                        if viewModel.refreshingInZero > 0 {
//                                            viewModel.refreshingInZero -= 1
//                                        } else if viewModel.refreshingInZero == 0 {
//                                            viewModel.locationAuthorizationCheck()
//                                            viewModel.checkIfUserIsInInsideRegion()
//                                            viewModel.refreshingInZero = 1
//                                        }
//                                }
//                        }
//
//                        // App Icon
//                        Image("BlurIcon261")
//                            .padding(.bottom)
//
//                    }
//
//                    // App Description
//                    VStack {
//                        Text("Academy’s anonymous chatting platform.")
//
//                        Text("Get yourself close to the academy")
//
//                        Text("and start chatting with other users!")
//                    }
//                    .font(Font.custom("SF-Pro-Text-Light", size: 16))
//                    .foregroundColor(colors.white)
//
//                    Spacer()
//
//                    // Requirement & Button
//                    if (viewModel.isInside) {
//
//                        Text("You are currently in range to chat!")
//                            .foregroundColor(colors.gray)
//                            .font(Font.custom("SF-Pro-Text-Regular", size: 16))
//                            .padding(.top)
//
//                        NavigationLink {
//                            ChatPage(viewModel: viewModel)
//    //                        ChatPage()
//                        } label: {
//                            HStack {
//                                Image(systemName: "text.bubble.fill")
//                                Text("Start talking with everyone")
//                            }
//                            .frame(maxWidth: 342)
//                        }
//                        .padding(.leading)
//                        .padding(.trailing)
//                        .buttonStyle(FillButton())
//
//                    }
//                    else {
//
//                        HStack (spacing: 4) {
//                            Text("You are")
//                            Text("not").underline()
//                            Text("currently in range to chat!")
//                        }
//                        .foregroundColor(colors.gray)
//                        .padding(.top)
//
//                        Button {
//
//                        } label: {
//                            HStack {
//                                Image(systemName: "text.bubble.fill")
//                                Text("Start talking with everyone")
//                            }
//                            .frame(maxWidth: 342)
//                        }
//                        .padding(.leading)
//                        .padding(.trailing)
//                        .disabled(true)
//                        .buttonStyle(DisabledButton())
//
//                    }
//
//                    Spacer()
//
//                }
//
//                if !viewModel.locationAccess {
//                    Color.black.opacity(0.75)
//                        .edgesIgnoringSafeArea(.all)
//                        .onAppear {
//                            isInaccessible = true
//                        }
//                    // Modal View
//                    LocationUnauthorizedModal(isInaccessible: $isInaccessible)
//                        .zIndex(1)
//                }
//
//            }
//
//        }
//        .onAppear {
//            viewModel.serviceAvailabilityCheck()
//        }
//
//    }
//
//}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
